 MATCH (node452:_Identifiable {uuid: "f17fc242-b08d-436d-8fb0-29ae04b9a224"})
 MATCH (node1756:_Identifiable {uuid: "789be2cd-4f87-4f43-a865-18f0ae1293db"})
                MERGE (node1755:_Identifiable {uuid: "543b84db-dc2a-4f05-9e05-34fffe7ddf5a"})
                ON CREATE SET node1755:View
                ON CREATE SET node1755 += {name: "Schema"}
MERGE (node1755)-[rel5432: HAS_STYLE {uuid: "da5053da-fdc7-4850-8e0a-6c32a26fe9cc"}]->(node452)
ON CREATE SET rel5432 += {}
MERGE (node1755)-[rel5436: HAS_FUNCTIONALITY {uuid: "422f1c51-7992-468c-a5ef-6186a07fcf2b"}]->(node1756)
ON CREATE SET rel5436 += {}
