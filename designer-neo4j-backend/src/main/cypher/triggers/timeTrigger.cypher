/*
@name trigger.timeTriggerCreated

@mode write
@input triggerUuid, STRING

@output value, MAP
*/

WITH $triggerUuid AS triggerUuid

MATCH (timeTrigger:TimeTrigger {uuid: triggerUuid})
WHERE timeTrigger.active = true
CALL mvn.scheduleJob(triggerUuid, timeTrigger.cron, "CALL custom.trigger.timeTrigger($triggerUuid)", {triggerUuid: triggerUuid}) YIELD errorMessage
RETURN count(*);

/*
@name trigger.timeTriggerDeleted

@mode write
@input triggerUuid, STRING

@output value, MAP
*/

WITH $triggerUuid AS triggerUuid

CALL mvn.unscheduleJob(triggerUuid)
RETURN count(*);

/*
@name trigger.timeTriggerModified

@mode write
@input triggerUuid, STRING

@output value, MAP
*/

WITH $triggerUuid AS triggerUuid

CALL custom.trigger.timeTriggerDeleted(triggerUuid) YIELD value AS vd
CALL custom.trigger.timeTriggerCreated(triggerUuid) YIELD value AS vc
RETURN count(*);

/*
@name trigger.timeTrigger

@mode write
@input triggerUuid, STRING

@output value, MAP
*/

WITH $triggerUuid AS triggerUuid

MATCH (timeTrigger:TimeTrigger {uuid: triggerUuid})
WHERE timeTrigger.active = true

// call functions
CALL {
    WITH timeTrigger
    MATCH (timeTrigger)-[:EXECUTES]->(func:Function)
    CALL apoc.log.debug("[trigger.timeTrigger] Trigger executing function: %s", [func.uuid])

    CALL tnt.compileFunction(func) YIELD cypher
    CALL apoc.cypher.doIt(cypher, {}) YIELD value
    RETURN count(*) AS countFuncCalls
}

// schedule jobs
CALL {
    WITH timeTrigger
    MATCH (timeTrigger)-[:SCHEDULES]->(job:Job)
    WITH collect({trigger: timeTrigger, job: job}) AS eventDatas
    WHERE NOT isEmpty(eventDatas)

    CALL custom.trigger.createEvent(timestamp()) YIELD event

    UNWIND eventDatas AS eventData
    CALL apoc.log.debug("[trigger.timeTrigger] Trigger scheduling job: %s", [eventData.job.uuid])

    CALL custom.kernel.scheduleJob(event, eventData.trigger, eventData.job, []) YIELD jobExecution
    RETURN count(*) AS countJobCalls
}

RETURN *;
