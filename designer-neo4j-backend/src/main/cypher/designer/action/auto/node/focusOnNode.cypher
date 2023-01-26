/*
@name designer.action.auto.node.focusOnNode

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

RETURN 'Focus On' AS name,
       'View' AS group,
       'zoom-in' AS icon,
       [] AS params,
       [] AS implicitParams,
       false AS hidden;


/*
@name designer.action.auto.node.focusOnNode_do

@mode read

@input contextUuid, STRING
@input viewUuid, STRING
@input params, MAP
@input implicitParams, LIST OF STRING

@output strategy, STRING
@output message, STRING
@output statusCode, INTEGER
@output result, MAP
*/

WITH $contextUuid AS contextUuid

MATCH (node {uuid: contextUuid})

RETURN {node: node} AS result,
       0 AS statusCode,
       '' AS message,
       'REPLACE' AS strategy;
