 MATCH (node1261:_Identifiable {uuid: "3b3d215c-d907-456e-bf7f-169b075e15ea"})
                MERGE (node1280:_Identifiable {uuid: "88b91724-f289-4863-8b59-0d9e17f4306f"})
                ON CREATE SET node1280:Graphlet
                ON CREATE SET node1280 += {name: "Movie"}
                MERGE (node1281:_Identifiable {uuid: "1cce97e7-3a88-4938-a2fa-c94509d2407d"})
                ON CREATE SET node1281:Node
                ON CREATE SET node1281 += {}
MERGE (node1281)-[rel1468: DEFINED_BY {uuid: "e23c7035-8261-4704-93ca-7fbf064502f1"}]->(node1261)
ON CREATE SET rel1468 += {}
MERGE (node1280)-[rel1469: CONTAINS {uuid: "4ad40629-841a-49df-9429-e8af2f8dbc43"}]->(node1281)
ON CREATE SET rel1469 += {}
