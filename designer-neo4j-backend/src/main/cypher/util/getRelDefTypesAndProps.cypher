/*
@name util.getRelDefTypesAndProps

@mode read
@input relDef, NODE

@output type, NODE
@output prop, NODE
*/

WITH $relDef AS relDef
MATCH (relDef)-[:HAS_TYPE]->(type:Type)-[:HAS_PROPERTY]->(prop:Property)
WHERE NOT prop.name = 'uuid'
RETURN type, prop;
