/*
@name util.getNodeDefTypes

@mode read
@input nodeDef, NODE

@output type, NODE
*/

WITH $nodeDef AS nodeDef
MATCH (nodeDef)-[:HAS_TYPE]->(type:Type)
RETURN type

UNION

WITH $nodeDef AS nodeDef
MATCH (nodeDef)-[:SUBCLASS_OF*1..]->(:AbstractNodeDef)-[:HAS_TYPE]->(type:Type)
RETURN type;
