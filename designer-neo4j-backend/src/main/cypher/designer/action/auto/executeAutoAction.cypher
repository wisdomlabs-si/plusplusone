/*
@name designer.action.auto.executeAutoAction

@mode write

@input actionProcedure, STRING
@input contextUuid, STRING
@input viewUuid, STRING
@input params, MAP
@input implicitParams, LIST OF STRING

@output strategy, STRING
@output message, STRING
@output statusCode, INTEGER
@output result, MAP
*/

WITH $actionProcedure AS actionProcedure,
     $contextUuid AS contextUuid,
     $viewUuid AS viewUuid,
     $params AS params,
     $implicitParams AS implicitParams

WHERE actionProcedure STARTS WITH "auto."

CALL apoc.cypher.doIt('
                      CALL custom.designer.action.' + actionProcedure + '_do($contextUuid, $viewUuid, $params, $implicitParams) YIELD strategy, message, statusCode, result
                      RETURN strategy, message, statusCode, result
                     ',
                      {
                      contextUuid: contextUuid,
                      viewUuid:viewUuid,
                      params: params,
                      implicitParams: implicitParams
                      }) YIELD value


RETURN value.strategy AS strategy, value.message AS message, value.statusCode AS statusCode, value.result AS result;