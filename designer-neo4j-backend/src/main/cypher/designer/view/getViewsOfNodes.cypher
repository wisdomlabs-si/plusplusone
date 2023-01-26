/*
@name designer.view.getViewsOfNodes

@mode write

@input view, NODE
@input context, MAP
@input nodes, LIST OF NODE

@output viewsOfNodes, LIST OF MAP
*/

WITH $view AS view,
     $context AS context,
     $nodes AS nodes

WITH view, nodes,
CASE WHEN context IS NULL THEN {uuid: null, type: null}
ELSE context.selectionContext END AS selectionContext,
CASE WHEN context IS NULL THEN null
ELSE context.strategy END AS strategy

WITH view, nodes, strategy,
CASE WHEN selectionContext.type = "NODE" THEN custom.designer.view.position.getPositionForUuid(view, selectionContext.uuid)
ELSE null END AS contextPosition

WITH view, nodes,
CASE WHEN contextPosition IS NOT NULL THEN {x: contextPosition.x, y: contextPosition.y, limitX: 600, limitY: 600}
ELSE null END AS generatePosition,
// unless they are being deleted, all nodes are set as visible by default
CASE WHEN strategy <> 'DELETE' THEN true
ELSE null END AS overrideVisibility

UNWIND nodes AS node

CALL custom.designer.view.position.getPosition(view, node, generatePosition) YIELD position
// if position is not saved in graph yet -> save it
CALL custom.designer.view.position.setPosition(view, node, position.x, position.y, coalesce(overrideVisibility, position.visible)) YIELD position AS _

WITH view, node, position,
     custom.util.graphObjectType(node) AS nodeType

WITH apoc.map.mergeList([
  {
    uuid:       apoc.any.property(node, "uuid"),
    label:      nodeType,
    caption:    custom.designer.view.style.getNodeCaption(view, node),
    properties: custom.util.getElementaryProperties(node),
    actionDefs: custom.designer.action.getNodeActions(view, node),
    x:          position.x,
    y:          position.y
  },
  custom.designer.view.style.getNodeStyle(view, nodeType)
]) AS viewOfNode

RETURN collect(viewOfNode) AS viewsOfNodes;
