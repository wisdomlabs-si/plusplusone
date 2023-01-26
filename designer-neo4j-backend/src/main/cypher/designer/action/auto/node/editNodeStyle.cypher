/*
@name designer.action.auto.node.editNodeStyle

@mode read
@input view, NODE
@input node, NODE

@output name, STRING
@output group, STRING
@output icon, STRING
@output params, LIST OF MAP
@output implicitParams, LIST OF STRING
@output hidden, BOOLEAN
*/

WITH $view AS view,
     custom.util.graphObjectType($node) AS nodeType

MATCH (nodeDef:NodeDef {name: nodeType})
MATCH (view)-[:HAS_STYLE]->(style:Style)

WITH view, nodeDef, collect(DISTINCT style.name) AS styles
  WHERE NOT styles = []

RETURN 'Edit Node Style' AS name,
       'View' AS group,
       'pencil-alt' AS icon,
       [
         {name: 'style', widget: 'dropDown', initValues: styles},
         {name: 'size', widget: 'numberField'},
         {name: 'color', widget: 'colorPicker'},
         {name: 'icon', widget: 'iconPicker'}
       ] AS params,
       [nodeDef.uuid] AS implicitParams,
       false AS hidden;


/*
@name designer.action.auto.node.editNodeStyle_do

@mode write

@input contextUuid, STRING
@input viewUuid, STRING
@input params, MAP
@input implicitParams, LIST OF STRING

@output strategy, STRING
@output message, STRING
@output statusCode, INTEGER
@output result, MAP
*/

WITH $viewUuid AS viewUuid,
     $params['color'] AS color,
     $params['size'] AS size,
     $params['icon'] AS icon,
     $params['style'] AS styleName,
     $implicitParams[0] AS nodeDefUuid

MATCH (view:View {uuid: viewUuid})
MATCH (nodeDef:NodeDef {uuid: nodeDefUuid})
MATCH (view)-[:HAS_STYLE]->(style:Style {name: styleName})

MERGE (style)-[hasNodeStyle:NODE_STYLE]->(nodeStyle:NodeStyle)-[forNode:FOR_NODE]->(nodeDef)
  ON CREATE SET hasNodeStyle.uuid = randomUUID(), nodeStyle.uuid = randomUUID(), forNode.uuid = randomUUID()
SET nodeStyle += {color: color, size: size, icon: icon}

WITH view, nodeDef
MATCH (view)-[:DISPLAY_NODE {visible: true}]->(viewedNode)
  WHERE nodeDef.name IN labels(viewedNode)

RETURN {node: viewedNode} AS result,
       0 AS statusCode,
       '' AS message,
       'APPEND' AS strategy;


