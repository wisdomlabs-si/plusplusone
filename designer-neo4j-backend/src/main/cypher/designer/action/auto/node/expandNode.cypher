/*
@name designer.action.auto.node.expandNode

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

RETURN 'Expand' AS name,
       'View' AS group,
       'arrows-expand' AS icon,
       [] AS params,
       [] AS implicitParams,
        false AS hidden;


/*
@name designer.action.auto.node.expandNode_do

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

WITH $contextUuid AS contextUuid, $viewUuid AS viewUuid

MATCH (node {uuid: contextUuid})
OPTIONAL MATCH (node)-[rel]->(neighbour)
WHERE NOT rel:DISPLAY_NODE

RETURN {neighbourNode: neighbour,
        outgoingRelationship: rel} AS result,
       0 AS statusCode,
       '' AS message,
       'APPEND' AS strategy;
