/*
@name designer.action.auto.node.dashboard.publishDashboard

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
  WHERE node:Dashboard

RETURN 'Publish' AS name,
       'Dashboard' AS group,
       'share' AS icon,
       [] AS params,
       [] AS implicitParams,
       false AS hidden;


/*
@name designer.action.auto.node.dashboard.publishDashboard_do

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

WITH $contextUuid AS contextUuid
MATCH (dashboard:Dashboard:_Identifiable {uuid: contextUuid})

CALL custom.dashboard.v1.publishDashboard(dashboard) YIELD dashboard AS _

RETURN {node: dashboard} AS result,
       0 AS statusCode,
       '' AS message,
       'APPEND' AS strategy;
