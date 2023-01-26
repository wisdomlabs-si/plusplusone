CALL apoc.trigger.add('uuid-trigger',
'
WITH [createdNode IN $createdNodes WHERE NOT exists(createdNode.uuid) | createdNode] AS createdNodesWithoutUuid,
      [createdRel IN $createdRelationships WHERE NOT exists(createdRel.uuid) | createdRel] AS createdRelationshipsWithoutUuid

FOREACH (node IN createdNodesWithoutUuid | SET node.uuid = randomUUID())
FOREACH (rel IN createdRelationshipsWithoutUuid | SET rel.uuid = randomUUID())
RETURN true
',
{phase:'before'});