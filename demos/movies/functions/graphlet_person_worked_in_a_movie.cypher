 MATCH (node1263:_Identifiable {uuid: "7d910985-fbd4-4ff3-8e26-887b03a400f5"})
 MATCH (node1261:_Identifiable {uuid: "3b3d215c-d907-456e-bf7f-169b075e15ea"})
                MERGE (node1282:_Identifiable {uuid: "0002a590-3647-4508-98fe-873397633080"})
                ON CREATE SET node1282:Graphlet
                ON CREATE SET node1282 += {name: "Person worked in a Movie"}
                MERGE (node1283:_Identifiable {uuid: "9c544185-abff-423e-9368-20ba3d94ef37"})
                ON CREATE SET node1283:Rel
                ON CREATE SET node1283 += {}
                MERGE (node1285:_Identifiable {uuid: "4604ea81-3217-4010-bfe6-468986705c58"})
                ON CREATE SET node1285:Node
                ON CREATE SET node1285 += {}
                MERGE (node1284:_Identifiable {uuid: "a5ea1ab7-7365-417d-a9af-601a44ba6eea"})
                ON CREATE SET node1284:Node
                ON CREATE SET node1284 += {}
MERGE (node1285)-[rel1471: DEFINED_BY {uuid: "db3fe3ca-8cc2-4ca6-91a9-f4464a94f84a"}]->(node1263)
ON CREATE SET rel1471 += {}
MERGE (node1284)-[rel1470: DEFINED_BY {uuid: "0a4ed908-efc3-427e-ace6-14d1051b8d09"}]->(node1261)
ON CREATE SET rel1470 += {}
MERGE (node1282)-[rel1472: CONTAINS {uuid: "43fcf03a-756f-4f53-a53c-59ce7921a0b8"}]->(node1283)
ON CREATE SET rel1472 += {}
MERGE (node1282)-[rel1474: CONTAINS {uuid: "b71c29c9-26ad-4c5b-997f-31ebd1faafbd"}]->(node1285)
ON CREATE SET rel1474 += {}
MERGE (node1282)-[rel1473: CONTAINS {uuid: "f405aec8-8dcc-42ba-9e46-d4b7efb1540b"}]->(node1284)
ON CREATE SET rel1473 += {}
MERGE (node1283)-[rel1476: REL_SOURCE {uuid: "66892e12-095d-4b58-89a5-f157fd0363be"}]->(node1285)
ON CREATE SET rel1476 += {}
MERGE (node1283)-[rel1475: REL_TARGET {uuid: "4fe4dc99-2e84-4c0a-8c6a-b54c9e04ea6f"}]->(node1284)
ON CREATE SET rel1475 += {}
