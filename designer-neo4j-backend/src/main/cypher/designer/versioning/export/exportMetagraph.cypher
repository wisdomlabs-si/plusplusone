/*
@name designer.export.exportMetagraph

@input metagraph, NODE

@return STRING
*/
WITH $metagraph AS metagraph

CALL apoc.log.debug("[designer.export.exportMetagraph] Exporting Metagraph with uuid %s and name %s", [metagraph.uuid, metagraph.name])

WITH metagraph

CALL {
      WITH metagraph
      MATCH (metagraph)-[:DEFINES]->(node)
        WHERE node:NodeDef OR node:RelDef OR node:Type OR node:AbstractNodeDef
      RETURN node

      UNION

      WITH metagraph
      MATCH (metagraph)-[:DEFINES]->()-[:HAS_PROPERTY]->(node:Property)
      RETURN node
}

WITH metagraph,
     collect(node) AS nodes

CALL {
      WITH metagraph
      MATCH (metagraph)-[relation:DEFINES]->(node)
        WHERE node:NodeDef OR node:RelDef OR node:Type OR node:AbstractNodeDef
      RETURN relation

      UNION

      WITH metagraph
      MATCH (metagraph)-[:DEFINES]->(node)-[relation:HAS_TYPE]->(:Type)
        WHERE node:NodeDef OR node:RelDef OR node:AbstractNodeDef
      RETURN relation

      UNION

      WITH metagraph
      MATCH (metagraph)-[:DEFINES]->()-[:HAS_TYPE]->(:Type)-[relation:HAS_PROPERTY]->(:Property)
      RETURN relation

      UNION

      WITH metagraph
      MATCH (metagraph)-[:DEFINES]->(:RelDef)-[relation:REL_SOURCE]->()
      RETURN relation

      UNION

      WITH metagraph
      MATCH (metagraph)-[:DEFINES]->(:RelDef)-[relation:REL_TARGET]->()
      RETURN relation

      UNION

      WITH metagraph
      MATCH (metagraph)-[:DEFINES]->(node)-[relation:SUBCLASS_OF]->()
      WHERE node:AbstractNodeDef OR node:NodeDef
      RETURN relation
}

WITH metagraph,
     nodes,
     collect(relation) AS relations

CALL {
      WITH metagraph
      OPTIONAL MATCH (metagraph)-[:DEFINES]->(:RelDef)-[:REL_TARGET]->(dependantNode)<-[:DEFINES]-(otherMetagraph:Metagraph)
        WHERE (dependantNode:NodeDef OR dependantNode:AbstractNodeDef) AND NOT (metagraph = otherMetagraph)
      RETURN dependantNode

      UNION

      WITH metagraph
      OPTIONAL MATCH (metagraph)-[:DEFINES]->()-[:HAS_TYPE]->(dependantNode:Type)<-[:DEFINES]-(otherMetagraph:Metagraph)
            WHERE NOT (metagraph = otherMetagraph)
      RETURN dependantNode
}

WITH metagraph,
     nodes,
     relations,
     collect(dependantNode) AS dependantNodes

WITH  metagraph,
      dependantNodes,
       metagraph + nodes AS nodes,
       relations AS relationships

RETURN tnt.export.toCypher("/import/metagraph_" + custom.util.toSnakeCase(metagraph.name) + ".cypher", dependantNodes, nodes, relationships);