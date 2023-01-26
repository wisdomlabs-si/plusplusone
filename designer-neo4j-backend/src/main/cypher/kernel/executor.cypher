/*
@name kernel.executor.startExecutor

@mode write

@output errorMessage, STRING
*/

CALL apoc.periodic.commit(
'
  MATCH (executor:JobExecutor)
  WITH executor LIMIT 1
  SET executor.running = true
  RETURN 0
'
) YIELD batchErrors AS createStatusMessage


CALL apoc.periodic.commit(
'
  CALL custom.kernel.executor.startExecuteTask() YIELD value
  WITH value LIMIT 1
  RETURN 1
'
) YIELD batchErrors

MATCH (executor:JobExecutor)
SET executor.running = false

RETURN apoc.convert.toString(batchErrors) AS errorMessage;

/*
@name kernel.executor.startExecuteTask

@mode write

@output value, ANY
*/
MATCH (executor:JobExecutor)-[current:CURRENT]->(alreadyExecuted:JobExecution)-[:NEXT]->(nextToRun:JobExecution)

WITH executor, current, nextToRun
  LIMIT 1
CALL custom.kernel.executor.getCurrentTask(nextToRun) YIELD task

WITH executor, current, nextToRun, task
CALL apoc.do.when(
task IS NULL,
'
    WITH $nextToRun AS nextToRun, $executor AS executor, $current AS current
    CREATE (executor)-[:CURRENT]->(nextToRun)
    DELETE current
    RETURN 1
',
'
    WITH $nextToRun AS nextToRun,
          $task AS task
    CALL custom.kernel.executor.executeTaskInQueue(task, nextToRun) YIELD errorMessage
    RETURN errorMessage
',
{nextToRun: nextToRun, executor: executor, current: current, task: task}
)  YIELD value

RETURN value;


/*
@name kernel.executor.getCurrentTask

@mode write
@input jobExecution, NODE

@output task, NODE
*/
WITH $jobExecution AS jobExecution

MATCH (jobExecution)-[:FOR]->(job:Job)
OPTIONAL MATCH path = (job)-[:STARTS_WITH|NEXT*1..]->(t:Task)
  WHERE NOT (t)<-[:PROCESSED]-(jobExecution)
WITH jobExecution, job, path
  LIMIT 1
WITH jobExecution, job,
     CASE WHEN length(path) = 0 THEN null
       ELSE nodes(path)[-1]
       END AS task

CALL {

WITH task, job
MATCH (task)<-[:STARTS_WITH]-(job)
RETURN task AS ifTaskNeedToBeTriggered

UNION

WITH task, jobExecution
MATCH (task)<-[:NEXT]-(:Task)<-[run:PROCESSED]-(jobExecution)
  WHERE  run.message = '{}'
RETURN task AS ifTaskNeedToBeTriggered

UNION

RETURN null AS ifTaskNeedToBeTriggered
}

WITH ifTaskNeedToBeTriggered
  LIMIT 1

RETURN ifTaskNeedToBeTriggered AS task;



/*
@name kernel.executor.executeTaskInQueue

@mode write
@input task, NODE
@input jobExecution, NODE

@output errorMessage, STRING
*/
WITH $task AS task,
     $jobExecution AS jobExecution

CALL {
    WITH jobExecution
    OPTIONAL MATCH (jobExecution)-[withValue:WITH_VALUE]->(input:Input)
    RETURN CASE WHEN input IS NULL THEN {}
             ELSE apoc.map.setEntry({}, input.name, withValue.referenceUuid)
             END AS taskParameters
}

CALL apoc.periodic.iterate(
'
    WITH $task as task
    RETURN task
',
'
    WITH $task as task, $jobExecution as jobExecution

    CREATE (jobExecution)-[processed:PROCESSED]->(task) SET processed.startTime = datetime()
    RETURN processed
'
, {
  batchSize: 1,
  params:    {task: task, jobExecution: jobExecution}
}
) YIELD batch, operations, errorMessages

WITH jobExecution, task, taskParameters
CALL apoc.periodic.iterate(
'
    WITH $task as task
    RETURN task
',
'
    WITH $task as task,
         $taskParameters as taskParameters,
         $jobExecution as jobExecution

    CALL custom.tnt.executeWriteTask(task, taskParameters) YIELD value AS result
    RETURN result
'
, {
  batchSize: 1,
  params:    {task:         task,
              jobExecution: jobExecution,
              taskParameters: taskParameters}
}
) YIELD batch, operations, errorMessages

MATCH (jobExecution)-[processed:PROCESSED]->(task)
WITH processed, apoc.convert.toString(errorMessages) AS errorMessages
SET processed.message = errorMessages, processed.endTime = datetime()

RETURN errorMessages;