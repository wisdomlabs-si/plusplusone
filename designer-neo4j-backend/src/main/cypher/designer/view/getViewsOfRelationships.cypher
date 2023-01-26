/*
@name designer.view.getViewsOfRelationships

@mode read

@input view, NODE
@input relationships, LIST OF RELATIONSHIP

@return LIST OF MAP
*/

WITH $view AS view,
     $relationships AS relationships

UNWIND relationships AS relationship

WITH apoc.map.mergeList([
  {
    uuid:          apoc.any.property(relationship, "uuid"),
    startNodeUuid: startNode(relationship).uuid,
    endNodeUuid:   endNode(relationship).uuid,
    label:         type(relationship),
    properties:    custom.util.getElementaryProperties(relationship),
    caption:       custom.designer.view.style.getRelationshipCaption(view, relationship),
    actionDefs:    custom.designer.action.getRelationshipActions(view, relationship)
  },
  custom.designer.view.style.getRelationshipStyle(view, type(relationship))
]) AS viewOfRel

RETURN collect(viewOfRel);
