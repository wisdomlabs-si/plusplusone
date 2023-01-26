/*
@name designer.import.importFromDirectory

@mode write
@input directory, STRING

@output imported, BOOLEAN
*/

CALL apoc.load.directory("metagraph_*", $directory) YIELD value AS file
CALL apoc.cypher.runFile("file:///" + file) YIELD result
WITH file, result
CALL apoc.log.info("Imported file: %s, statistics: %s", [file, apoc.convert.toString(result)])
WITH count(*) AS _

CALL apoc.load.directory("graphlet_*", $directory) YIELD value AS file
CALL apoc.cypher.runFile("file:///" + file) YIELD result
WITH file, result
CALL apoc.log.info("Imported file: %s, statistics: %s", [file, apoc.convert.toString(result)])
WITH count(*) AS _

CALL apoc.load.directory("function_*", $directory) YIELD value AS file
CALL apoc.cypher.runFile("file:///" + file) YIELD result
WITH file, result
CALL apoc.log.info("Imported file: %s, statistics: %s", [file, apoc.convert.toString(result)])
WITH count(*) AS _

CALL apoc.load.directory("job_*", $directory) YIELD value AS file
CALL apoc.cypher.runFile("file:///" + file) YIELD result
WITH file, result
CALL apoc.log.info("Imported file: %s, statistics: %s", [file, apoc.convert.toString(result)])
WITH count(*) AS _

CALL apoc.load.directory("functionality_*", $directory) YIELD value AS file
CALL apoc.cypher.runFile("file:///" + file) YIELD result
WITH file, result
CALL apoc.log.info("Imported file: %s, statistics: %s", [file, apoc.convert.toString(result)])
WITH count(*) AS _

CALL apoc.load.directory("style_*", $directory) YIELD value AS file
CALL apoc.cypher.runFile("file:///" + file) YIELD result
WITH file, result
CALL apoc.log.info("Imported file: %s, statistics: %s", [file, apoc.convert.toString(result)])
WITH count(*) AS _

CALL apoc.load.directory("view_*", $directory) YIELD value AS file
CALL apoc.cypher.runFile("file:///" + file) YIELD result
WITH file, result
CALL apoc.log.info("Imported file: %s, statistics: %s", [file, apoc.convert.toString(result)])
WITH count(*) AS _

CALL apoc.load.directory("project_*", $directory) YIELD value AS file
CALL apoc.cypher.runFile("file:///" + file) YIELD result
WITH file, result
CALL apoc.log.info("Imported file: %s, statistics: %s", [file, apoc.convert.toString(result)])
WITH count(*) AS _

RETURN true AS imported;