/*
@name designer.action.auto.node.hideNode

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

RETURN 'Hide' AS name,
       'View' AS group,
       'eye-off' AS icon,
       [] AS params,
       [] AS implicitParams,
       false AS hidden;


/*
@name designer.action.auto.node.hideNode_do

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

WITH $contextUuid AS contextUuid,
     $viewUuid AS viewUuid

MATCH (:View {uuid: viewUuid})-[displayNode:DISPLAY_NODE]->(n:_Identifiable {uuid: contextUuid})
SET displayNode.visible = false
RETURN {hideNode: n, hideRelationship: displayNode} AS result,
       0 AS statusCode,
       '' AS message,
       'DELETE' AS strategy;
