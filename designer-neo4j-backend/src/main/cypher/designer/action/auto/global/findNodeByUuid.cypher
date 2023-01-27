/*
@name designer.action.auto.global.findNodeByUuid

@mode read
@input view, NODE

@output name, STRING
@output group, STRING
@output icon, STRING
@output params, LIST OF MAP
@output implicitParams, LIST OF STRING
@output hidden, BOOLEAN
*/

RETURN 'Find node by uuid' AS name,
       'View' AS group,
       'search-circle' AS icon,
       [{name: 'uuid', widget: 'textField'}] AS params,
       [] AS implicitParams,
       false AS hidden;

/*
@name designer.action.auto.global.findNodeByUuid_do

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
WITH params['uuid'] AS uuid

MATCH (node:_Identifiable)
  WHERE node.uuid = uuid

RETURN {node: node} AS result,
       0 AS statusCode,
       '' AS message,
       'APPEND' AS strategy;
