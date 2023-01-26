/*
@name designer.action.auto.node.deleteNode

@mode read
@input view, NODE
@input node, NODE

@output name, STRING
@output group, STRING
@output icon, STRING
@output params, LIST OF MAP
@output implicitParams, LIST OF STRING
@output hidden, BOOLEAN
*/

RETURN 'Delete Node' AS name,
       'Delete' AS group,
       'trash' AS icon,
       [] AS params,
       [] AS implicitParams,
       false AS hidden;


/*
@name designer.action.auto.node.deleteNode_do

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

CALL apoc.periodic.submit('delete-node-' + contextUuid, "MATCH (n:_Identifiable {uuid:'" + contextUuid + "'}) DETACH DELETE n", {}) YIELD name
// We created virtual node, because backend expect to be node as result
CALL apoc.create.vNode(['DeletedNode'],{uuid: contextUuid}) YIELD node

RETURN 0 AS statusCode,
       '' AS message,
       {deletedNode: node} AS result,
       'DELETE' AS strategy;