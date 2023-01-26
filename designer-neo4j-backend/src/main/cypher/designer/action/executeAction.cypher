/*
@name designer.action.executeAction

@mode write
@input action, NODE
@input parameters, MAP

@output strategy, STRING
@output message, STRING
@output statusCode, INTEGER
@output result, MAP
*/

WITH $action AS action,
    $parameters AS parameters

CALL apoc.log.debug('[designer.action.executeAction] Executing action with uuid: %s and parameters: %s', [action.uuid, parameters])

WITH action, parameters
MATCH (action)-[:EXECUTES]->(function:Function)

CALL custom.designer.action.parameters.mapParametersToArguments(action, parameters) YIELD arguments
CALL custom.tnt.executeWriteFunction(function, arguments) YIELD value AS result, error AS message
RETURN message,
       CASE WHEN message IS NULL THEN 0 ELSE 1 END AS statusCode,
       action.strategy AS strategy,
       result;