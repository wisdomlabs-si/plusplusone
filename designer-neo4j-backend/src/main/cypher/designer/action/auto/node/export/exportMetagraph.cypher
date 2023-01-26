/*
@name designer.action.auto.node.export.exportMetagraph

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
WHERE node:Metagraph

RETURN 'Export Metagraph' AS name,
       'Export' AS group,
       'download' AS icon,
       [] AS params,
       [] AS implicitParams,
       false AS hidden;


/*
@name designer.action.auto.node.export.exportMetagraph_do

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

MATCH (metagraph:Metagraph {uuid: contextUuid})
WITH custom.designer.export.exportMetagraph(metagraph) AS cypher

RETURN {} AS result,
       0 AS statusCode,
       '' AS message,
       'IGNORE' AS strategy;
