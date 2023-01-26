/*
@name designer.action.auto.node.export.exportFunction

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

WITH $node AS node
WHERE node:Function

RETURN 'Export Function' AS name,
       'Export' AS group,
       'download' AS icon,
       [] AS params,
       [] AS implicitParams,
       false AS hidden;


/*
@name designer.action.auto.node.export.exportFunction_do

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
MATCH (function:_Identifiable {uuid: contextUuid})
WHERE function:Function

WITH custom.designer.export.exportFunction(function) AS cypher

RETURN {} AS result,
       0 AS statusCode,
       '' AS message,
       'IGNORE' AS strategy;
