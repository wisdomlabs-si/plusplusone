/*
@name designer.action.auto.node.executeTask

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

WITH $node AS taskNode
WHERE taskNode:Task

OPTIONAL MATCH (taskNode)-[:HAS_INPUT]->(var:Input)

WITH taskNode, collect(var) AS variables
WITH [variable IN variables WHERE NOT variable IS NULL | {name: variable.name, widget: 'textField'}] AS params

RETURN 'Execute Task' AS name,
       'Task' AS group,
       'cog' AS icon,
       params AS params,
       [] AS implicitParams,
       false AS hidden;

/*
@name designer.action.auto.node.executeTask_do

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
     $params AS parameters

MATCH (task:Task {uuid: contextUuid})
CALL custom.tnt.executeWriteTask(task, parameters) YIELD value

RETURN 0 AS statusCode,
       '' AS message,
       value AS result,
       'APPEND' AS strategy;