/*
@name designer.action.auto.node.setPosition

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

RETURN 'setPosition' AS name,
       null AS group,
       'location-marker' AS icon,
       [{name: 'x', widget: 'NUMBER'}, {name: 'y', widget: 'NUMBER'}] AS params,
       [] AS implicitParams,
       true AS hidden;


/*
@name designer.action.auto.node.setPosition_do

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

MATCH (view:View {uuid: $viewUuid})
MATCH (node: _Identifiable{uuid: $contextUuid})

CALL custom.designer.view.position.setPosition(view, node, $params.x, $params.y, true) YIELD position

RETURN 0 AS statusCode,
       '' AS message,
       {node: node} AS result,
       'LAZY_UPDATE' AS strategy;
