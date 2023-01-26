/*
@name designer.traverse.traverseFunction

@mode read
@input function, NODE


@output nodes, LIST OF NODE
@output relationships, LIST OF RELATIONSHIP
@output dependantNodes, LIST OF NODE
*/

WITH $function AS function

CALL apoc.log.debug("[designer.traverse.traverseFunction] Traverse Function with uuid %s and name %s", [function.uuid, function.name])

OPTIONAL MATCH (function)-[:HAS_INPUT]->(input:Input)
OPTIONAL MATCH (function)-[:HAS_OUTPUT]->(output:Output)

WITH function, collect(input) AS inputs, collect(output) AS outputs

MATCH (function)-[implemented:IMPLEMENTED]->(implementation)

CALL apoc.path.subgraphAll(implementation,
{
  relationshipFilter: 'NEXT>|HAS_BINDING>|HAS_OUTPUT_BINDING>|BINDS_FROM>|BINDS_TO>|USING>|SCOPED>|EXECUTES>|KEY>|DEFINED_BY>|OF_NODE>',
  labelFilter:        '+Input|+Output|+Map|+Reduce|+Call|+Binding|+Var|+Function|+Match|+Complete|+Create|+Graphlet|+Aggregation|+AggregationFunction|+PropVar|+NativeCall'
})

YIELD nodes, relationships
WITH function,
     inputs + outputs + nodes AS nodes,
     [rel IN implemented + relationships WHERE NOT rel:CONTAINS OR rel:HAS_INPUT OR rel:HAS_OUTPUT] AS relationships,
     ['Graphlet', 'Function', 'AggregationFunction','Input', 'Output'] AS dependantLabels

WITH function,
     function + [node IN nodes WHERE ALL(label IN labels(node) WHERE NOT label IN dependantLabels) | node] AS nodes,
       [node IN nodes WHERE any(label IN labels(node) WHERE label IN dependantLabels) | node] AS dependantNodes,
       relationships

RETURN nodes,
       relationships,
       dependantNodes

