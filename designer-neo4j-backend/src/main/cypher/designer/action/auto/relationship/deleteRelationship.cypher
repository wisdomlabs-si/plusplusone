/*
@name designer.action.auto.relationship.deleteRelationship

@mode read
@input view, NODE
@input rel, REL

@output name, STRING
@output group, STRING
@output icon, STRING
@output params, LIST OF MAP
@output implicitParams, LIST OF STRING
@output hidden, BOOLEAN
*/
RETURN 'Delete Relationship' AS name,
       'Delete' AS group,
       'trash' AS icon,
       [] AS params,
       [] AS implicitParams,
       false AS hidden;

/*
@name designer.action.auto.relationship.deleteRelationship_do

@mode write

@input contextUuid, STRING
@input viewUuid, STRING
@input params, MAP
@input implicitParams, LIST OF STRING

@output strategy, STRING
@output message, STRING
@output statusCode, INTEGER
@output result, MAP
*/

WITH $contextUuid AS contextUuid

MATCH (a)-[rel {uuid: contextUuid}]-(b)
  WHERE a.uuid <= b.uuid
DELETE rel

WITH a, b, contextUuid
CALL apoc.create.vRelationship(a, 'DeletedRel',{uuid: contextUuid}, b) YIELD rel AS delRel

RETURN 0 AS statusCode,
       '' AS message,
       {deletedRel: delRel} AS result,
       'DELETE' AS strategy;
