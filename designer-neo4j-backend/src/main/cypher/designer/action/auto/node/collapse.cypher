/*
@name designer.action.auto.node.collapse

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

RETURN 'Collapse' AS name,
       'View' AS group,
       'support' AS icon,
       [] AS params,
       [] AS implicitParams,
       false AS hidden;


/*
@name designer.action.auto.node.collapse_do

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

MATCH (n:_Identifiable {uuid: contextUuid})-[rel*]->(rn)
WHERE none(r IN rel WHERE type(r) = 'DISPLAY_NODE')
WITH viewUuid, collect(rn) AS reachableNodes
MATCH (:View {uuid: viewUuid})-[displayNode:DISPLAY_NODE]->(visibleNode)
WHERE visibleNode IN reachableNodes
DELETE displayNode
RETURN {hideNode: visibleNode, hideRelationship: []} AS result,
       0 AS statusCode,
       '' AS message,
       'DELETE' AS strategy;
