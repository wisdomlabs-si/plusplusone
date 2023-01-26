MATCH (anyNode: AbstractNodeDef {uuid: "7b762bee-df9b-48b7-bcce-54159f8fde8f"})-[:HAS_TYPE]->(identifiable:Type {uuid: "e0fb13f4-d35f-4b50-8f48-37f955540188"})

OPTIONAL MATCH (nd:NodeDef)
OPTIONAL MATCH (rd:RelDef)

MERGE (nd)-[:SUBCLASS_OF]->(anyNode)
MERGE (rd)-[:HAS_TYPE]->(identifiable);

MATCH (n)
WHERE NOT n:_Identifiable
SET n:_Identifiable;
