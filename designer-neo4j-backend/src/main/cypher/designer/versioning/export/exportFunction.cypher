/*
@name designer.export.exportFunction

@input function, NODE

@return STRING
*/

WITH $function AS function

CALL apoc.log.debug("[designer.export.exportFunction] Exporting Function with uuid %s and name %s", [function.uuid, function.name])

OPTIONAL MATCH (function)-[hasInput:HAS_INPUT]->(input:Input)
OPTIONAL MATCH (function)-[hasOutput:HAS_OUTPUT]->(output:Output)

WITH function,
      collect(hasInput) AS hasInputs,
      collect(hasOutput) AS hasOutputs,
     collect(input) AS inputs,
     collect(output) AS outputs

WITH function,
     function + inputs + outputs AS initialNodes,
      hasInputs + hasOutputs AS initialRelations

MATCH (function)-[implemented:IMPLEMENTED]->(implementation)

CALL apoc.path.subgraphAll(implementation,
{
  relationshipFilter: 'NEXT>|HAS_BINDING>|HAS_OUTPUT_BINDING>|BINDS_FROM>|BINDS_TO>|USING>|SCOPED>|EXECUTES>|KEY>|DEFINED_BY>|OF_NODE>|OF_REL>|ON_VALUE>',
  labelFilter:        '+Input|+Output|+Map|+Reduce|+Call|+Binding|+Var|+Function|+Match|+Complete|+Create|+Graphlet|+Aggregation|+AggregationFunction|+GraphFilter|+ValueFilter|+PropVar|+NativeCall|+Node|+Rel|+Property|+Constant'
})

YIELD nodes, relationships
WITH function,
     initialNodes,
     initialRelations,
     nodes,
     [rel IN implemented + relationships WHERE NOT rel:CONTAINS OR rel:HAS_INPUT OR rel:HAS_OUTPUT] + initialRelations AS relationships,
     ['Graphlet', 'Function', 'AggregationFunction','Input', 'Output','Node', 'Rel','Property'] AS dependantLabels

WITH function,
     initialNodes + [node IN nodes WHERE ALL(label IN labels(node) WHERE NOT label IN dependantLabels) | node] AS nodes,
       [node IN nodes WHERE any(label IN labels(node) WHERE label IN dependantLabels) AND NOT node IN initialNodes | node] AS dependantNodes,
       relationships

CALL {
      WITH dependantNodes
      WITH [node IN dependantNodes WHERE node:Graphlet| node] AS dependantGraphlets

      UNWIND range(1, size(dependantGraphlets)) AS index
      WITH index, dependantGraphlets[index - 1] AS graphlet

      WITH custom.designer.export.exportGraphlet(graphlet) AS cypher
      RETURN count(*) AS _

      UNION

      WITH dependantNodes
      WITH [node IN dependantNodes WHERE node:Function| node] AS dependantFunctions

      UNWIND range(1, size(dependantFunctions)) AS index
      WITH index, dependantFunctions[index - 1] AS dependantFunction

      WITH custom.designer.export.exportFunction(dependantFunction) AS cypher
      RETURN count(*) AS _
}

WITH custom.util.toSnakeCase(function.name) AS functionName,
     dependantNodes,
     nodes,
     relationships, count(*) AS _

WITH tnt.export.toCypher("/import/function_" + functionName + ".cypher", dependantNodes, nodes, relationships) AS cypher
RETURN cypher;


