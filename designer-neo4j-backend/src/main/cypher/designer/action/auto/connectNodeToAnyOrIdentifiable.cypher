/*
@name designer.action.auto.connectNodeToAnyOrIdentifiable

@input node, Node
@mode write

@output modifiedPaths, INTEGER
*/

WITH $node as node

CALL {
  WITH node
  MATCH (node: NodeDef)
  CALL custom.designer.action.auto.findAnyAndIdentifiable() YIELD anyNode
  MERGE p = (node)-[:SUBCLASS_OF]->(anyNode)
  RETURN p

  UNION

  WITH node
  MATCH (node: RelDef)
  CALL custom.designer.action.auto.findAnyAndIdentifiable() YIELD anyNode, identifiable
  MERGE p = (node)-[:HAS_TYPE]->(identifiable)
  RETURN p

  UNION

  WITH node
  MATCH p = (node)
  RETURN p
}

return count(p) AS modifiedPaths;



/*
@name designer.action.auto.findAnyAndIdentifiable

@mode read

@output anyNode, NODE
@output identifiable, NODE
*/

MATCH (anyNode: AbstractNodeDef {uuid: "7b762bee-df9b-48b7-bcce-54159f8fde8f"})-[:HAS_TYPE]->(identifiable:Type {uuid: "e0fb13f4-d35f-4b50-8f48-37f955540188"})
RETURN anyNode, identifiable;
