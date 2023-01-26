 MATCH (node97:_Identifiable {uuid: "68d3c0bd-1230-3945-8cc7-6a16b6beda19"})
 MATCH (node9:_Identifiable {uuid: "065067f4-06e0-4ff0-b49e-9eeaa6ff8f8a"})
 MATCH (node96:_Identifiable {uuid: "1e5aeb35-243d-4126-9e61-ed08fc8a6cea"})
                MERGE (node483:_Identifiable {uuid: "dbceb27e-bb27-41af-a4d3-a6801aa5490b"})
                ON CREATE SET node483:Graphlet
                ON CREATE SET node483 += {name: "Node defined by NodeDef"}
                MERGE (node484:_Identifiable {uuid: "f1916d53-ae9e-45b9-bfc4-30b091dc2079"})
                ON CREATE SET node484:Rel
                ON CREATE SET node484 += {}
                MERGE (node485:_Identifiable {uuid: "2126a871-14c3-4241-91ca-ca499fbf4b2d"})
                ON CREATE SET node485:Node
                ON CREATE SET node485 += {}
                MERGE (node486:_Identifiable {uuid: "ba98aea7-bcd2-42ef-8704-37e3b5177881"})
                ON CREATE SET node486:Node
                ON CREATE SET node486 += {}
MERGE (node484)-[rel1036: DEFINED_BY {uuid: "5e3d0961-2bf1-4bb9-a47a-8092a6915d22"}]->(node97)
ON CREATE SET rel1036 += {}
MERGE (node485)-[rel1037: DEFINED_BY {uuid: "7ad976ca-c208-4183-9679-b18bb6b392b3"}]->(node9)
ON CREATE SET rel1037 += {}
MERGE (node486)-[rel1038: DEFINED_BY {uuid: "90ddd764-622b-4171-8125-0c52bc15a29c"}]->(node96)
ON CREATE SET rel1038 += {}
MERGE (node483)-[rel1039: CONTAINS {uuid: "77422e5f-f0cd-400d-9841-e3f0136774c0"}]->(node484)
ON CREATE SET rel1039 += {}
MERGE (node483)-[rel1040: CONTAINS {uuid: "0aed3290-dce9-4589-85ca-a3cc736e20b4"}]->(node485)
ON CREATE SET rel1040 += {}
MERGE (node483)-[rel1041: CONTAINS {uuid: "0ad43625-7cb0-4d98-b2e9-f5acab0d25b3"}]->(node486)
ON CREATE SET rel1041 += {}
MERGE (node484)-[rel1271: REL_TARGET {uuid: "ab8c78fd-5af2-43b2-b5ff-4fdf27eb915a"}]->(node485)
ON CREATE SET rel1271 += {}
MERGE (node484)-[rel1107: REL_SOURCE {uuid: "5df1ecd2-5ec5-43af-8ca1-1f929ac483fb"}]->(node486)
ON CREATE SET rel1107 += {}
