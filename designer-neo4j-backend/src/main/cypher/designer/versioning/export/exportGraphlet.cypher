/*
@name designer.export.exportGraphlet

@input graphlet, NODE

@return STRING
*/

WITH $graphlet AS graphlet

CALL apoc.log.debug("[designer.export.exportGraphlet] Exporting Graphlet with uuid %s and name %s", [graphlet.uuid, graphlet.name])

CALL apoc.path.subgraphAll(graphlet,
                            {
                              relationshipFilter: "CONTAINS>|REL_TARGET>|REL_SOURCE>",
                              labelFilter: "Graphlet|Node|Rel",
                              maxLevel: 2
                            }) YIELD nodes, relationships
WITH graphlet,
     nodes,
     relationships
CALL {
      WITH nodes

      UNWIND nodes AS  node

      MATCH (node)
        WHERE node:Node OR node:Rel

      MATCH (node)-[r:HAS_TYPE|DEFINED_BY]->(type)
        WHERE type:Type OR type:NodeDef OR type:RelDef OR type:AbstractNodeDef

      RETURN collect(type) AS dependantNodes, collect(r) AS additionalRelationships
}

WITH custom.util.toSnakeCase(graphlet.name) AS graphletName,
     dependantNodes,
     nodes,
     additionalRelationships + relationships AS relationships

RETURN tnt.export.toCypher("/import/graphlet_" + graphletName + ".cypher", dependantNodes, nodes, relationships);