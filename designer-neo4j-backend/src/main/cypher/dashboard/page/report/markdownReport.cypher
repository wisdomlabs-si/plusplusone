/*
  @name dashboard.v1.page.report.markdownReport
  @input report, NODE
  @input position, MAP
  @return MAP
*/
WITH $report AS report,
     $position AS position

RETURN CASE report.title WHEN null THEN ''
         ELSE report.title
         END AS title,
       CASE report.text WHEN null THEN ''
         ELSE report.text
         END AS query,
       position.width AS width,
       position.height AS height,
       position.x AS x,
       position.y AS y,
       'text' AS type,
       {} AS selection,
       {
         `replaceGlobalParameters`: false
       } AS settings,
       100 AS refreshRate;