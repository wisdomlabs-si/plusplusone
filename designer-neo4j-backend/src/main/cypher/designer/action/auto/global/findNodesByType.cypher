/*
@name designer.action.auto.global.findNodesByType

@mode read
@input view, NODE

@output name, STRING
@output group, STRING
@output icon, STRING
@output params, LIST OF MAP
@output implicitParams, LIST OF STRING
@output hidden, BOOLEAN
*/

MATCH (:Metagraph)-[:DEFINES]->(nodeDef:NodeDef)
WITH nodeDef ORDER BY nodeDef.name

RETURN 'Find nodes by type' AS name,
       'View' AS group,
       'search-circle' AS icon,
       [{name: 'type', widget: "dropDown", initValues: collect(nodeDef.name)}] AS params,
       [] AS implicitParams,
       false AS hidden;

/*
@name designer.action.auto.global.findNodesByType_do

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
WITH params['type'] AS label
CALL apoc.cypher.run("MATCH (node:" + label + ") RETURN node", {}) YIELD value

RETURN {node: value.node} AS result,
       0 AS statusCode,
       '' AS message,
       'APPEND' AS strategy;