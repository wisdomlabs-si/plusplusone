/*
@name dashboard.v1.discardDashboard

@mode write
@input dashboard, NODE
@output dashboard, NODE
*/

WITH $dashboard AS dashboard
MATCH (dash:_Neodash_Dashboard {title: dashboard.title})
DETACH DELETE dash
RETURN dashboard;

