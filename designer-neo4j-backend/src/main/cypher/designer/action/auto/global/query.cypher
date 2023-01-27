/*
@name designer.action.auto.global.query

@mode read
@input view, NODE

@output name, STRING
@output group, STRING
@output icon, STRING
@output params, LIST OF MAP
@output implicitParams, LIST OF STRING
@output hidden, BOOLEAN
*/

RETURN 'Query' AS name,
       'View' AS group,
       'search-circle' AS icon,
       [{name: 'query', widget: "textArea"}] AS params,
       [] AS implicitParams,
       false AS hidden;

/*
@name designer.action.auto.global.query_do

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

WITH $params AS params
WITH params['query'] AS query
CALL apoc.cypher.run(query, {}) YIELD value

RETURN value AS result,
       0 AS statusCode,
       '' AS message,
       'APPEND' AS strategy;
