/*
@name designer.action.parameters.retrieveInitialValuesForWidgets

@mode read
@input widget, NODE

@return LIST OF STRING
*/

WITH $widget AS widget


CALL {
  WITH widget
  MATCH (widget)-[:ON_INIT]->(function:Function)
  CALL custom.tnt.executeReadFunction(function, {}) YIELD value

  WITH DISTINCT value AS value
  WITH apoc.map.flatten(value) AS results
  UNWIND keys(results) AS key
  WITH key, results[key] AS dicValue
  WHERE apoc.meta.isType(dicValue, 'List')

  RETURN dicValue LIMIT 1

  UNION

  RETURN null AS dicValue
}

RETURN dicValue;