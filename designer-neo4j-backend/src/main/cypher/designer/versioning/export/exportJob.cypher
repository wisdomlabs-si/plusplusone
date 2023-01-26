/*
@name designer.export.exportJob

@input job, NODE

@return STRING
*/

WITH $job AS job

CALL apoc.log.debug("[designer.export.exportJob] Exporting Job with uuid %s and name %s", [job.uuid, job.name])

MATCH (job)-[startsWith:STARTS_WITH]->(task:Task)
OPTIONAL MATCH (task)-[:HAS_INPUT]->(input:Input)

WITH job, task, startsWith, collect(input) AS inputs

CALL apoc.path.subgraphAll(task,
{
  relationshipFilter: 'NEXT>|HAS_BINDING>|HAS_OUTPUT_BINDING>|BINDS_FROM>|BINDS_TO>|USING>|SCOPED>|EXECUTES>|KEY>|DEFINED_BY>|OF_NODE>|OF_REL>|ON_VALUE>',
  labelFilter:        '+Input|+Output|+Map|+Reduce|+Call|+Binding|+Var|+Function|+Match|+Complete|+Create|+Graphlet|+Aggregation|+AggregationFunction|+GraphFilter|+ValueFilter|+PropVar|+NativeCall|+Constant|+Node|+Rel|+Property|+Type|+Constant'
})

YIELD nodes, relationships
WITH job,
     [job, task] + inputs + nodes AS nodes,
     startsWith + relationships AS relationships,
     ['Graphlet', 'Function', 'AggregationFunction', 'Node', 'Rel', 'Type', 'Property'] AS dependantLabels

WITH custom.util.toSnakeCase(job.name) AS jobNameInSnakeCase,
      [node IN nodes WHERE all(label IN labels(node) WHERE NOT label IN dependantLabels) | node] AS nodes,
       [node IN nodes WHERE any(label IN labels(node) WHERE label IN dependantLabels) | node] AS dependantNodes,
       relationships

CALL {
      WITH jobNameInSnakeCase, dependantNodes
      WITH jobNameInSnakeCase,
           [node IN dependantNodes WHERE node:Graphlet| node] AS dependantGraphlets

      UNWIND range(1, size(dependantGraphlets)) AS index
      WITH jobNameInSnakeCase, index, dependantGraphlets[index - 1] AS graphlet

      WITH custom.designer.export.exportGraphlet(graphlet) AS cypher
      RETURN count(*) AS _

      UNION

      WITH jobNameInSnakeCase, dependantNodes
      WITH jobNameInSnakeCase,
           [node IN dependantNodes WHERE node:Function| node] AS dependantFunctions

      UNWIND range(1, size(dependantFunctions)) AS index
      WITH jobNameInSnakeCase, index, dependantFunctions[index - 1] AS function

      WITH custom.designer.export.exportFunction(function) AS cypher
      RETURN count(*) AS _
}

WITH jobNameInSnakeCase, dependantNodes, nodes, relationships, count(*) AS _
RETURN tnt.export.toCypher("/import/job_" + jobNameInSnakeCase + ".cypher", dependantNodes, nodes, relationships);


