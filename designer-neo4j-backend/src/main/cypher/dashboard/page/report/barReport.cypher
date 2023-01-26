/*
  @name dashboard.v1.page.report.barReport
  @input report, NODE
  @input position, MAP
  @return MAP
*/

WITH $report AS report,
     $position AS position

MATCH (report)-[:EXECUTES]->(function:Function)
MATCH (function)-[:HAS_OUTPUT]->(value:Output)<-[:DISPLAYS_VALUES]-(report)
MATCH (function)-[:HAS_OUTPUT]->(index:Output)<-[:INDEX_BY]-(report)
OPTIONAL MATCH (function)-[:HAS_OUTPUT]->(group:Output)<-[:GROUP_BY]-(report)

WITH report,
     function,
     position,
     value,
     index,
     group

WITH report,
     function,
     position,
     value,
     index,
     group,
     custom.util.joinText([output IN [index, value] | "value['" + output.name + "'] AS " + output.name], ', ')
     AS outputNames

RETURN CASE report.title WHEN null THEN ''
         ELSE report.title
         END AS title,

       CASE function WHEN null THEN ''
         ELSE apoc.text.format("MATCH (f:Function {name: '%s'}) CALL custom.tnt.executeReadFunction(f, {}) YIELD value RETURN %s", [
         function.name, outputNames])
         END AS query,

       position.width AS width,
       position.height AS height,
       position.x AS x,
       position.y AS y,

       'bar' AS type,
       {`index`: index.name,
        value:   value.name,
        key:     CASE group
                   WHEN null THEN '(none)'
                   ELSE group.name
                   END} AS selection,
       {
         `barValues`:              false,
         `hideSelections`:         CASE report.hideSelections
                                     WHEN null THEN true
                                     ELSE report.hideSelections
                                     END,
         `legend`:                 CASE report.showLegend
                                     WHEN null THEN true
                                     ELSE report.showLegend
                                     END,
         `showOptionalSelections`: false,
         `groupMode`:              'grouped',
         `layout`:                 'vertical'
       } AS settings;

