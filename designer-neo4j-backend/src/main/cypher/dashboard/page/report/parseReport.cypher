/*
@name dashboard.v1.page.report.parseReport
@mode read
@input report, NODE
@input position, MAP
@output reportDefinition, MAP
*/

WITH $report AS report,
     $position AS position

WITH report, position,
     CASE WHEN report:MarkdownReport THEN 'dashboard.v1.page.report.markdownReport'
       WHEN report:SingleValueReport THEN 'dashboard.v1.page.report.singleValueReport'
       WHEN report:TableReport THEN 'dashboard.v1.page.report.tableReport'
       WHEN report:BarReport THEN 'dashboard.v1.page.report.barReport'
       WHEN report:GraphReport THEN 'dashboard.v1.page.report.graphReport'
       WHEN report:PieReport THEN 'dashboard.v1.page.report.pieReport'
       WHEN report:LineReport THEN 'dashboard.v1.page.report.lineReport'
       ELSE custom.util.throwException('There is no report of type %s for node with uuid %s', [custom.util.graphObjectType(report), report.uuid])
       END AS reportParsers

CALL apoc.cypher.run("RETURN custom. " + reportParsers + "($report, $position) AS definition", {report: report, position: position}) YIELD value
RETURN value.definition AS reportDefinition;