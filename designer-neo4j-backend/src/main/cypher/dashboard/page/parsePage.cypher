/*
@name dashboard.v1.page.parsePage
@input page, NODE
@return MAP
*/

WITH $page AS page
CALL {
       WITH page
       MATCH (page)-[display:DISPLAYS_REPORT]->(report)
       CALL custom.dashboard.v1.page.report.parseReport(report, {x:      display.positionX,
                                                                 y:      display.positionY,
                                                                 width:  display.width,
                                                                 height: display.height}) YIELD reportDefinition
       RETURN collect(reportDefinition) AS reports
}

RETURN page.title AS title, reports;