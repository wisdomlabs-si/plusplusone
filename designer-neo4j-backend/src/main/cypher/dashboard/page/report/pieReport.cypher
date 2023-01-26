/*
  @name dashboard.v1.page.report.pieReport
  @input report, NODE
  @input position, MAP
  @return MAP
*/
WITH $report AS report,
     $position AS position

MATCH (report)-[:EXECUTES]->(function:Function)
MATCH (function)-[:HAS_OUTPUT]->(value:Output)<-[:DISPLAYS_VALUES]-(report)
MATCH (function)-[:HAS_OUTPUT]->(index:Output)<-[:INDEX_BY]-(report)

WITH report,
     function,
     position,
     value,
     index

WITH report,
     function,
     position,
     value,
     index,
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

       'pie' AS type,
       {`index`: index.name,
        value:   value.name,
        key:     '(none)'} AS selection,
       {} AS settings;