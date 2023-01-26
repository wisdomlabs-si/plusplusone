/*
  @name dashboard.v1.page.report.singleValueReport
  @input report, NODE
  @input position, MAP
  @return MAP
*/

WITH $report AS report,
     $position AS position

OPTIONAL MATCH (report)-[:EXECUTES]->(function:Function)-[:HAS_OUTPUT]->(output:Output)<-[:DISPLAYS_VALUE]-(report)

RETURN CASE report.title WHEN null THEN ''
         ELSE report.title
         END AS title,
       CASE function WHEN null THEN ''
         ELSE apoc.text.format("MATCH (f:Function {name: '%s'}) CALL custom.tnt.executeReadFunction(f, {}) YIELD value RETURN value['%s']", [function.name, output.name])
         END AS query,
       position.width AS width,
       position.height AS height,
       position.x AS x,
       position.y AS y,
       'value' AS type,
       {} AS selection,
       {} AS settings;