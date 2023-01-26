/*
  @name dashboard.v1.page.report.lineReport
  @input report, NODE
  @input position, MAP
  @return MAP
*/

WITH $report AS report,
     $position AS position

MATCH (report)-[:EXECUTES]->(function:Function)
MATCH (function)-[:HAS_OUTPUT]->(output:Output)<-[:DISPLAYS_VALUES_ON_X_AXIS|:DISPLAYS_VALUES_ON_Y_AXIS]-(report)
WITH report,
     function,
     position,
     collect(output) AS outputs

WITH report,
     function,
     position,
     outputs,
     custom.util.joinText([output IN outputs | "value['" + output.name + "'] AS " + output.name], ', ') AS outputNames

RETURN CASE report.title WHEN null THEN ''
         ELSE report.title
         END AS title,

       CASE function WHEN null THEN ''
         ELSE apoc.text.format("MATCH (f:Function {name: '%s'}) CALL custom.tnt.executeReadFunction(f, {}) YIELD value RETURN %s", [function.name, outputNames])
         END AS query,

       position.width AS width,
       position.height AS height,
       position.x AS x,
       position.y AS y,

       'line' AS type,
       {
         x:     head([output IN outputs WHERE (output)<-[:DISPLAYS_VALUES_ON_X_AXIS]-(report) | output.name]),
         value: [
                    head([output IN outputs WHERE (output)<-[:DISPLAYS_VALUES_ON_Y_AXIS]-(report) | output.name])
                  ]
       } AS selection,
       {
         curve:          'linear',
         showGrid:       false,
         hideSelections: true
       } AS settings;

