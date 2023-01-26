CALL apoc.log.info("[Meta] Setting up system constraints.");
CREATE CONSTRAINT constraint_identifiables IF NOT EXISTS FOR (n:_Identifiable) REQUIRE n.uuid IS UNIQUE;

CALL apoc.log.info("[Meta] Setting system trigger.");
CALL apoc.trigger.add('systemTrigger', 'CALL custom.trigger.systemTrigger($commitTime, $createdNodes, $createdRelationships, $deletedNodes, $deletedRelationships, $removedLabels, $removedNodeProperties, $removedRelationshipProperties, $assignedLabels, $assignedNodeProperties, $assignedRelationshipProperties)', {phase: 'after'});

CALL apoc.log.info("[Meta] Start time triggers.");
MATCH (timeTrigger:TimeTrigger)
WHERE timeTrigger.active = true
WITH timeTrigger.cron AS cron, timeTrigger.uuid AS triggerUuid
CALL mvn.scheduleJob(triggerUuid, cron, "CALL custom.trigger.timeTrigger($triggerUuid)", {triggerUuid: triggerUuid}) YIELD errorMessage
RETURN *;
