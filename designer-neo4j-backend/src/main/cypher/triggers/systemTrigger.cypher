/*
@name trigger.systemTrigger

@mode write
@input commitTime, NUMBER
@input createdNodes, LIST OF NODE
@input createdRelationships, LIST OF RELATIONSHIP
@input deletedNodes, LIST OF NODE
@input deletedRelationships, LIST OF RELATIONSHIP
@input removedLabels, MAP
@input removedNodeProperties, MAP
@input removedRelationshipProperties, MAP
@input assignedLabels, MAP
@input assignedNodeProperties, MAP
@input assignedRelationshipProperties, MAP

@output value, MAP
*/

MATCH (dbTrig:DbTrigger)
WHERE dbTrig.active = true
MATCH (dbTrig)-[:CONDITIONED_WITH]->(condition)
// allow only one condition per trigger for now
WITH dbTrig, head(collect(condition)) AS condition

// evaluate conditions one by one
CALL {
    WITH condition
    MATCH (condition:CreatedNode)
    CALL custom.trigger.getConditionedNodeNames(condition) YIELD names AS nodeNames
    RETURN [n IN $createdNodes WHERE custom.util.graphObjectType(n) IN nodeNames | n.uuid] AS uuids

    UNION

    WITH condition
    MATCH (condition:ModifiedNode)
    CALL custom.trigger.getConditionedNodeNames(condition) YIELD names AS nodeNames
    WITH nodeNames, apoc.coll.flatten([k IN keys($assignedNodeProperties) | $assignedNodeProperties[k]]) AS assignedNodeProps
    // take only node for now - ignore metadata about property name, old value and new value
    WITH nodeNames, [anp IN assignedNodeProps | anp.node] AS modifiedNodes
    RETURN [n IN modifiedNodes WHERE custom.util.graphObjectType(n) IN nodeNames AND NOT n IN $createdNodes | n.uuid] AS uuids

    UNION

    WITH condition
    MATCH (condition:DeletedNode)
    CALL custom.trigger.getConditionedNodeNames(condition) YIELD names AS nodeNames
    WITH apoc.coll.toSet(apoc.coll.flatten([k IN keys($removedLabels) WHERE k IN nodeNames | $removedLabels[k]])) AS removedLabelNodes, [n IN $deletedNodes | id(n)] AS delNodesIds
    WITH [n IN removedLabelNodes WHERE id(n) IN delNodesIds | id(n)] AS delNodesIds
    RETURN [n IN $removedNodeProperties.uuid WHERE id(n.node) IN delNodesIds | n.old] AS uuids

    UNION

    WITH condition
    MATCH (condition:CreatedRel)
    CALL custom.trigger.getConditionedRelNames(condition) YIELD names AS relNames
    RETURN [n IN $createdRelationships WHERE custom.util.graphObjectType(n) IN relNames | n.uuid] AS uuids

    UNION

    WITH condition
    MATCH (condition:ModifiedRel)
    CALL custom.trigger.getConditionedRelNames(condition) YIELD names AS relNames
    WITH relNames, apoc.coll.flatten([k IN keys($assignedRelationshipProperties) | $assignedRelationshipProperties[k]]) AS assignedRelProps
    // take only rel for now - ignore metadata about property name, old value and new value
    WITH relNames, [arp IN assignedRelProps | arp.relationship] AS modifiedRels
    RETURN [n IN modifiedRels WHERE custom.util.graphObjectType(n) IN relNames AND NOT n IN $createdRelationships | n.uuid] AS uuids

    UNION

    WITH condition
    MATCH (condition:DeletedRel)
    CALL custom.trigger.getConditionedRelNames(condition) YIELD names AS relNames
    WITH [n IN $deletedRelationships WHERE type(n) IN relNames | id(n)] AS delRelsIds
    RETURN [n IN $removedRelationshipProperties.uuid WHERE id(n.relationship) IN delRelsIds | n.old] AS uuids
}

WITH dbTrig, condition, uuids
WHERE NOT isEmpty(uuids)

CALL apoc.log.debug("[trigger.systemTrigger] DB trigger (%s) and condition (%s) matched uuids: %s", [dbTrig.uuid, condition.uuid, uuids])

// call functions
CALL {
    WITH dbTrig, condition, uuids
    MATCH (dbTrig)-[:EXECUTES]->(func:Function)
    OPTIONAL MATCH (func)-[:HAS_INPUT]->(i:Input)<-[:PROVIDES_VALUE]-(condition)
    CALL apoc.log.debug("[trigger.systemTrigger] Trigger executing function: %s", [func.uuid])

    UNWIND uuids AS uuid
    CALL tnt.compileFunction(func) YIELD cypher
    CALL apoc.cypher.doIt(cypher, apoc.map.fromPairs([[i.name, uuid]])) YIELD value
    RETURN count(*) AS countFuncCalls
}

// schedule jobs
CALL {
    WITH dbTrig, condition, uuids
    MATCH (dbTrig)-[:SCHEDULES]->(job:Job)
    OPTIONAL MATCH (job)-[:HAS_INPUT]->(i:Input)<-[:PROVIDES_VALUE]-(condition)
    WITH collect({trigger: dbTrig, job: job, input: i, uuids: uuids}) AS eventDatas
    WHERE NOT isEmpty(eventDatas)

    CALL custom.trigger.createEvent($commitTime) YIELD event

    UNWIND eventDatas AS eventData
    CALL apoc.log.debug("[trigger.systemTrigger] Trigger scheduling job: %s", [eventData.job.uuid])

    UNWIND eventData.uuids AS uuid
    CALL custom.kernel.scheduleJob(event, eventData.trigger, eventData.job, [{name: "referenceUuid", value: uuid, input: eventData.input}]) YIELD jobExecution
    RETURN count(*) AS countJobCalls
}

RETURN *;

/*
@name trigger.getConditionedNodeNames

@mode read
@input conditionNode, NODE

@output names, LIST OF STRING
*/

WITH $conditionNode AS conditionNode
MATCH (conditionNode)-[:DEFINED_BY]->(nd:NodeDef)
RETURN collect(nd.name) AS names

UNION

WITH $conditionNode AS conditionNode
MATCH (conditionNode)-[:HAS_TYPE]->(:Type)<-[:HAS_TYPE]-(nd:NodeDef)
RETURN collect(nd.name) AS names;

/*
@name trigger.getConditionedRelNames

@mode read
@input conditionNode, NODE

@output names, LIST OF STRING
*/

WITH $conditionNode AS conditionNode
MATCH (conditionNode)-[:DEFINED_BY]->(rd:RelDef)
RETURN collect(rd.name) AS names

UNION

WITH $conditionNode AS conditionNode
MATCH (conditionNode)-[:HAS_TYPE]->(:Type)<-[:HAS_TYPE]-(rd:RelDef)
RETURN collect(rd.name) AS names;
