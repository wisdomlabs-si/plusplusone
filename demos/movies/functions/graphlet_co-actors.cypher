 MATCH (node1254:_Identifiable {uuid: "8a0acc34-d891-4dd9-ba00-15f07da4b23b"})
 MATCH (node1263:_Identifiable {uuid: "7d910985-fbd4-4ff3-8e26-887b03a400f5"})
 MATCH (node1261:_Identifiable {uuid: "3b3d215c-d907-456e-bf7f-169b075e15ea"})
                MERGE (node1274:_Identifiable {uuid: "31b51b66-c83f-4dd6-8c41-bc1ce1b50da1"})
                ON CREATE SET node1274:Graphlet
                ON CREATE SET node1274 += {name: "Co-Actors"}
                MERGE (node1275:_Identifiable {uuid: "e8d0a674-3383-4813-8eab-c40fcfd8f884"})
                ON CREATE SET node1275:Rel
                ON CREATE SET node1275 += {}
                MERGE (node1279:_Identifiable {uuid: "603090f0-a8bc-4944-96ed-5630cfd04fae"})
                ON CREATE SET node1279:Node
                ON CREATE SET node1279 += {}
                MERGE (node1278:_Identifiable {uuid: "142c51e7-bfb6-45f7-966f-64faa0913c5f"})
                ON CREATE SET node1278:Node
                ON CREATE SET node1278 += {}
                MERGE (node1277:_Identifiable {uuid: "9ac0e670-8765-40c5-a739-94bc62918a4f"})
                ON CREATE SET node1277:Node
                ON CREATE SET node1277 += {}
                MERGE (node1276:_Identifiable {uuid: "de43fdf6-43a0-4fd6-afb2-36bbdff65b55"})
                ON CREATE SET node1276:Rel
                ON CREATE SET node1276 += {}
MERGE (node1275)-[rel1454: DEFINED_BY {uuid: "9bf72fcd-904a-4646-b9ee-fa5638cb4538"}]->(node1254)
ON CREATE SET rel1454 += {}
MERGE (node1279)-[rel1458: DEFINED_BY {uuid: "f66466f0-fd60-4427-8a02-c7157ea0bc02"}]->(node1263)
ON CREATE SET rel1458 += {}
MERGE (node1278)-[rel1457: DEFINED_BY {uuid: "33aa4983-1ce8-4956-8049-37097141e953"}]->(node1261)
ON CREATE SET rel1457 += {}
MERGE (node1277)-[rel1456: DEFINED_BY {uuid: "b7f04e3e-6fd8-4693-9a33-d0081aaa830c"}]->(node1263)
ON CREATE SET rel1456 += {}
MERGE (node1276)-[rel1455: DEFINED_BY {uuid: "fda7f670-10c4-4c93-a20e-fa89281b16f6"}]->(node1254)
ON CREATE SET rel1455 += {}
MERGE (node1274)-[rel1459: CONTAINS {uuid: "50596866-46ec-46ef-a90b-ea7d239bc2aa"}]->(node1275)
ON CREATE SET rel1459 += {}
MERGE (node1274)-[rel1463: CONTAINS {uuid: "4dbb0467-e98b-4b90-8417-66e0c9c5eb5b"}]->(node1279)
ON CREATE SET rel1463 += {}
MERGE (node1274)-[rel1462: CONTAINS {uuid: "e577a962-fafb-4afc-8d2c-7a022fcfd8f9"}]->(node1278)
ON CREATE SET rel1462 += {}
MERGE (node1274)-[rel1461: CONTAINS {uuid: "99db354a-1451-43ca-9b1d-a07cf066096b"}]->(node1277)
ON CREATE SET rel1461 += {}
MERGE (node1274)-[rel1460: CONTAINS {uuid: "4cfbea65-c722-447e-a7c2-25b5fb1322b4"}]->(node1276)
ON CREATE SET rel1460 += {}
MERGE (node1275)-[rel1464: REL_TARGET {uuid: "dc1315ea-7f3f-483c-9f9c-5094a44774b0"}]->(node1278)
ON CREATE SET rel1464 += {}
MERGE (node1275)-[rel1465: REL_SOURCE {uuid: "aeca8fa7-8ef5-4aa6-afad-f66b7a5ced53"}]->(node1277)
ON CREATE SET rel1465 += {}
MERGE (node1276)-[rel1466: REL_TARGET {uuid: "76011324-aab9-4bfd-9be5-99764d36f551"}]->(node1278)
ON CREATE SET rel1466 += {}
MERGE (node1276)-[rel1467: REL_SOURCE {uuid: "639dbeaf-4ffa-4ddc-aadb-5abac113033c"}]->(node1279)
ON CREATE SET rel1467 += {}
