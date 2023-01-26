/*
@name tnt.executeWriteTask

@mode write
@input task, NODE
@input parameters, MAP

@output value, MAP
*/

WITH $task AS task,
     $parameters AS parameters

CALL tnt.compileTask(task) YIELD cypher
CALL apoc.cypher.doIt(cypher, parameters) YIELD value
RETURN value;
