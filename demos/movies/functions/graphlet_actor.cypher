 MATCH (node1390:_Identifiable {uuid: "8a0acc34-d891-4dd9-ba00-15f07da4b23b"})
 MATCH (node1399:_Identifiable {uuid: "7d910985-fbd4-4ff3-8e26-887b03a400f5"})
                MERGE (node1410:_Identifiable {uuid: "92d795d3-4d19-4ffe-8f65-2fa4861b9e3b"})
                ON CREATE SET node1410:Graphlet
                ON CREATE SET node1410 += {name: "Actor"}
                MERGE (node1413:_Identifiable {uuid: "b128010a-4d25-4c2c-be38-e8f1c6a769eb"})
                ON CREATE SET node1413:Rel
                ON CREATE SET node1413 += {}
                MERGE (node1412:_Identifiable {uuid: "036fcb40-ad91-4143-bc6c-c7cae80ffe0b"})
                ON CREATE SET node1412:Node
                ON CREATE SET node1412 += {}
                MERGE (node1411:_Identifiable {uuid: "7601f1dd-7706-463d-b29c-c3e028ce696c"})
                ON CREATE SET node1411:Node
                ON CREATE SET node1411 += {}
MERGE (node1413)-[rel2826: DEFINED_BY {uuid: "2fb40fc7-083e-4a27-a79b-eabec00ed49d"}]->(node1390)
ON CREATE SET rel2826 += {}
MERGE (node1411)-[rel2824: DEFINED_BY {uuid: "e599ef2d-04ac-4598-9870-6c14f29c6dfe"}]->(node1399)
ON CREATE SET rel2824 += {}
MERGE (node1410)-[rel2819: CONTAINS {uuid: "31563aae-7219-42b1-b1ab-4acec2f44a18"}]->(node1413)
ON CREATE SET rel2819 += {}
MERGE (node1410)-[rel2817: CONTAINS {uuid: "d517f7e1-92a5-4a71-8d80-6fa90998d582"}]->(node1412)
ON CREATE SET rel2817 += {}
MERGE (node1410)-[rel2815: CONTAINS {uuid: "96cb6e8d-d3c1-4e55-83c2-7b78052ba2b5"}]->(node1411)
ON CREATE SET rel2815 += {}
MERGE (node1413)-[rel2822: REL_TARGET {uuid: "b2b1b2f7-9683-444a-8140-7b7c040bdd61"}]->(node1412)
ON CREATE SET rel2822 += {}
MERGE (node1413)-[rel2821: REL_SOURCE {uuid: "701f183f-2d85-4a34-aa5d-57120677c350"}]->(node1411)
ON CREATE SET rel2821 += {}
