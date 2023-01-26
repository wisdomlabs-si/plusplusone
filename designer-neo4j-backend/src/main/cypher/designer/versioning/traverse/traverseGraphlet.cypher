/*
@name designer.traverse.traverseGraphlet

@mode read
@input graphlet, NODE

@output nodes, LIST OF NODE
@output relationships, LIST OF RELATIONSHIP
@output dependantNodes, LIST OF NODE
*/

WITH $graphlet AS graphlet

CALL apoc.log.debug("[designer.traverse.traverseGraphlet] Traverse Graphlet with uuid %s and name %s", [graphlet.uuid, graphlet.name])

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

RETURN  nodes AS nodes,
        additionalRelationships + relationships AS relationships,
        dependantNodes
