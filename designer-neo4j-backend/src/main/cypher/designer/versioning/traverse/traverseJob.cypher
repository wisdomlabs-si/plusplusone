/*
@name designer.traverse.traverseJob

@mode read
@input job, NODE

@output nodes, LIST OF NODE
@output relationships, LIST OF RELATIONSHIP
@output dependantNodes, LIST OF NODE
*/

WITH $job AS job

CALL apoc.log.debug("[designer.traverse.traverseJob] Traverse Job with uuid %s and name %s", [job.uuid, job.name])

MATCH (job)-[startsWith:STARTS_WITH]->(task:Task)
OPTIONAL MATCH (task)-[:HAS_INPUT]->(input:Input)

WITH job, task, startsWith, collect(input) AS inputs

CALL apoc.path.subgraphAll(task,
{
  relationshipFilter: 'NEXT>|HAS_BINDING>|HAS_OUTPUT_BINDING>|BINDS_FROM>|BINDS_TO>|USING>|SCOPED>|EXECUTES>|KEY>|DEFINED_BY>|OF_NODE>|OF_REL>',
  labelFilter:        '+Input|+Output|+Map|+Reduce|+Call|+Binding|+Var|+Function|+Match|+Complete|+Create|+Graphlet|+Aggregation|+AggregationFunction|+PropVar|+NativeCall|+Constant|+Node|+Rel|+Property|+Type'
})

YIELD nodes, relationships
WITH job,
     [job, task] + inputs + nodes AS nodes,
     startsWith + relationships AS relationships,
     ['Graphlet', 'Function', 'AggregationFunction', 'Node', 'Rel', 'Type', 'Property'] AS dependantLabels

RETURN  [node IN nodes WHERE all(label IN labels(node) WHERE NOT label IN dependantLabels) | node] AS nodes,
        relationships,
        [node IN nodes WHERE any(label IN labels(node) WHERE label IN dependantLabels) | node] AS dependantNodes


