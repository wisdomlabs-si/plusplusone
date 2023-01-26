/*
@name kernel.scheduleJob

@mode write
@input event, NODE
@input trigger, NODE
@input job, NODE
@input inputsParams, LIST OF MAP

@output jobExecution, NODE
*/

// input param has the following structure {name: STRING, value: ANY, input: NODE}
WITH $event AS event,
    $trigger AS trigger,
    $job AS job,
    $inputsParams AS inputsParams

CREATE (jobExecution:JobExecution:_Identifiable {uuid: randomUUID()}),
    (event)-[:SCHEDULED]->(jobExecution),
    (jobExecution)-[:TRIGGERED_BY]->(trigger),
    (jobExecution)-[:FOR]->(job)

// create links to inputs with provided values
WITH inputsParams, jobExecution
CALL {
    WITH inputsParams, jobExecution
    UNWIND inputsParams AS v
    WITH jobExecution, v
    WHERE NOT v.input IS NULL
    CALL apoc.create.relationship(jobExecution, "WITH_VALUE", apoc.map.fromPairs([[v.name, v.value]]), v.input) YIELD rel
    RETURN count(*) AS countParams
}

// link new scheduled job to the queue
WITH jobExecution
CALL {
    WITH jobExecution
    MATCH (lastJobExecution:JobExecution)
    WHERE jobExecution <> lastJobExecution AND NOT (lastJobExecution)-[:NEXT]->(:JobExecution)
    CREATE (lastJobExecution)-[:NEXT]->(jobExecution)
}

// ensure that job executor exists and points to one job execution
MERGE (jobExecutor:JobExecutor:_Identifiable)
ON CREATE SET jobExecutor.uuid = randomUUID(), jobExecutor.running = false
WITH jobExecution, jobExecutor
CALL {
    WITH jobExecutor, jobExecution
    MATCH (jobExecutor)
    WHERE NOT (jobExecutor)-[:CURRENT]->()
    CREATE (jobExecutor)-[:CURRENT]->(jobExecution)
}
RETURN jobExecution;
