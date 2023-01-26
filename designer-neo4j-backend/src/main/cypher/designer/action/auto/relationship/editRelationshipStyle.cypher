/*
@name designer.action.auto.relationship.editRelationshipStyle

@mode read
@input view, NODE
@input rel, REL

@output name, STRING
@output group, STRING
@output icon, STRING
@output params, LIST OF MAP
@output implicitParams, LIST OF STRING
@output hidden, BOOLEAN
*/
WITH $view AS view,
     custom.util.graphObjectType($rel) AS relType

MATCH (relDef:RelDef {name: relType})
MATCH (view)-[:HAS_STYLE]->(style:Style)

WITH view, relDef, collect(DISTINCT style.name) AS styles
  WHERE NOT styles = []

RETURN 'Edit Relationship Style' AS name,
       'View' AS group,
       'pencil-alt' AS icon,
       [
         {name: 'style', widget: 'dropDown', initValues: styles},
         {name: 'line style', widget: 'dropDown', initValues: ['solid', 'dotted', 'dashed']},
         {name: 'line width', widget: 'numberField'},
         {name: 'color', widget: 'colorPicker'},
         {name: 'icon', widget: 'iconPicker'}
       ] AS params,
       [relDef.uuid] AS implicitParams,
       false AS hidden;


/*
@name designer.action.auto.relationship.editRelationshipStyle_do

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
     $params['line style'] AS lineStyle,
     $params['line width'] AS lineWidth,
     $params['icon'] AS icon,
     $params['style'] AS styleName,
     $implicitParams[0] AS relDefUuid

MATCH (view:View {uuid: viewUuid})
MATCH (relDef:RelDef {uuid: relDefUuid})
MATCH (view)-[:HAS_STYLE]->(style:Style {name: styleName})

MERGE (style)-[hasRelStyle:REL_STYLE]->(relStyle:RelStyle)-[forRel:FOR_REL]->(relDef)
  ON CREATE SET hasRelStyle.uuid = randomUUID(), relStyle.uuid = randomUUID(), forRel.uuid = randomUUID()
SET relStyle += {color: color, lineStyle: lineStyle, lineWidth: lineWidth, icon: icon}

WITH view, relDef
MATCH (view)-[:DISPLAY_NODE {visible: true}]->()-[viewedRel]->()<-[:DISPLAY_NODE {visible: true}]-(view)
  WHERE type(viewedRel) = relDef.name

RETURN {rel: viewedRel} AS result,
       0 AS statusCode,
       '' AS message,
       'APPEND' AS strategy;
