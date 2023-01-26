WITH [
       'metagraphs/00-metagraphMeta.cypher',
       'metagraphs/01-metagraphComputation.cypher',
       'metagraphs/02-metagraphGraphview.cypher',
       'metagraphs/02-metagraphIngest.cypher',
       'metagraphs/02-metagraphTriggering.cypher',
       'metagraphs/03-metagraphExecution.cypher',
       'functions/00-aggregation.cypher',
       'functions/00-basic.cypher',
       'functions/00-util.cypher',
       'view-models/00-initialView.cypher',
       'styles/computation-style.cypher',
       'styles/meta-style.cypher',
       'styles/graph-view-style.cypher',
       'triggers/time-triggers-un-registration.cypher',
       'functionality/kernel/executorStartTrigger.cypher'
     ] AS biosFiles

CALL {
    WITH biosFiles
    UNWIND biosFiles AS file
    CALL apoc.cypher.runFile('file:///main/bios/' + file) YIELD result
    WITH file, result
    CALL apoc.log.info('Imported file: %s, statistics: %s', [file, apoc.convert.toString(result)])
    RETURN count(*) AS countBiosFiles
}

CALL apoc.cypher.runFile('file:///main/bios/connectAllNodeDefToAny.cypher') YIELD result
WITH count(result) AS _

CALL custom.designer.import.importFromDirectory('file:///main/bios/functionality/computation-editor') YIELD imported
RETURN count(*);

/*
Run migration scripts
*/
WITH [
    'v0_6/systemEvolution.cypher',
    'v0_6/refactor.cypher'
] AS migrationFiles

CALL {
    WITH migrationFiles
    UNWIND migrationFiles AS file
    CALL apoc.cypher.runFile("file:///main/bios/migrations/" + file) YIELD result
    WITH file, result
    CALL apoc.log.info("Executed migration file: %s, statistics: %s", [file, apoc.convert.toString(result)])
    RETURN count(*) AS countMigrationFiles
}
RETURN *;
