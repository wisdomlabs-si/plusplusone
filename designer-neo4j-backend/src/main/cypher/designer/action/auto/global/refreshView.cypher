/*
@name designer.action.auto.global.refreshView

@mode read
@input view, NODE

@output name, STRING
@output group, STRING
@output icon, STRING
@output params, LIST OF MAP
@output implicitParams, LIST OF STRING
@output hidden, BOOLEAN
*/

WITH $view AS view

RETURN 'Refresh View' AS name,
       'View' AS group,
       'refresh' AS icon,
       [] AS params,
       [] AS implicitParams,
       false AS hidden;

/*
@name designer.action.auto.global.refreshView_do

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

WITH $viewUuid AS viewUuid
MATCH (view:View {uuid: viewUuid})

MATCH (view)-[displayedNode:DISPLAY_NODE]->()
REMOVE displayedNode.visible

WITH count(*) AS _
RETURN null AS result,
       0 AS statusCode,
       '' AS message,
       'REFRESH' AS strategy;