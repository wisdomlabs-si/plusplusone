 MATCH (node9:_Identifiable {uuid: "065067f4-06e0-4ff0-b49e-9eeaa6ff8f8a"})
                MERGE (node493:_Identifiable {uuid: "0ff62f3f-c2d1-424c-be3e-6fde4cae8b1e"})
                ON CREATE SET node493:Graphlet
                ON CREATE SET node493 += {name: "NodeDef node"}
                MERGE (node494:_Identifiable {uuid: "0ff846b9-c48f-4730-8d21-60af9b24c950"})
                ON CREATE SET node494:Node
                ON CREATE SET node494 += {}
MERGE (node494)-[rel1054: DEFINED_BY {uuid: "55e10c9e-3908-47c9-b5cf-ee1925bfb01f"}]->(node9)
ON CREATE SET rel1054 += {}
MERGE (node493)-[rel1055: CONTAINS {uuid: "e3972875-7ddb-47ce-88f9-938b56a410a7"}]->(node494)
ON CREATE SET rel1055 += {}
