/*
@name util.getNodeDefTypesAndProps

@mode read
@input nodeDef, NODE

@output type, NODE
@output prop, NODE
*/

WITH $nodeDef AS nodeDef

CALL custom.util.getNodeDefTypes(nodeDef) YIELD type
MATCH (type)-[:HAS_PROPERTY]->(prop:Property)
WHERE NOT prop.name = 'uuid'
RETURN type, prop;
