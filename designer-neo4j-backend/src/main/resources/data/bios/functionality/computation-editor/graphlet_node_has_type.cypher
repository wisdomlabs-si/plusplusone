 MATCH (node16:_Identifiable {uuid: "1a1565c8-9f6f-4391-a7b4-0aa98c778e51"})
 MATCH (node100:_Identifiable {uuid: "fa6f5f4b-bfe2-396c-8f44-c81a1627fe12"})
 MATCH (node96:_Identifiable {uuid: "1e5aeb35-243d-4126-9e61-ed08fc8a6cea"})
                MERGE (node487:_Identifiable {uuid: "58f36d5f-7ddd-46df-a469-5f349e7f0f6e"})
                ON CREATE SET node487:Graphlet
                ON CREATE SET node487 += {name: "Node has Type"}
                MERGE (node490:_Identifiable {uuid: "0973a38d-b84e-4ab1-99a0-7d02029ae58c"})
                ON CREATE SET node490:Node
                ON CREATE SET node490 += {}
                MERGE (node489:_Identifiable {uuid: "90d042e9-7981-4da5-9d9b-72bd72c29511"})
                ON CREATE SET node489:Rel
                ON CREATE SET node489 += {}
                MERGE (node488:_Identifiable {uuid: "716fe8be-abb0-4eab-b693-337da963a879"})
                ON CREATE SET node488:Node
                ON CREATE SET node488 += {}
MERGE (node490)-[rel1046: DEFINED_BY {uuid: "9f131f43-30c6-4a8c-b9b2-19cf1475dfb7"}]->(node16)
ON CREATE SET rel1046 += {}
MERGE (node489)-[rel1045: DEFINED_BY {uuid: "e630b768-64be-4733-975d-d622ec46975a"}]->(node100)
ON CREATE SET rel1045 += {}
MERGE (node488)-[rel1044: DEFINED_BY {uuid: "5c256462-e2f9-4ff2-9129-42f5714a0b82"}]->(node96)
ON CREATE SET rel1044 += {}
MERGE (node487)-[rel1049: CONTAINS {uuid: "e3d6c4a7-e4a2-4867-bc69-05597e29ea9a"}]->(node490)
ON CREATE SET rel1049 += {}
MERGE (node487)-[rel1048: CONTAINS {uuid: "86ec030a-0b02-4755-a322-dfff3b9d1603"}]->(node489)
ON CREATE SET rel1048 += {}
MERGE (node487)-[rel1047: CONTAINS {uuid: "85501776-c882-4dfc-a8fb-fda84850d54f"}]->(node488)
ON CREATE SET rel1047 += {}
MERGE (node489)-[rel1050: REL_SOURCE {uuid: "50741d28-bb21-4cca-b407-dfcf66d11e42"}]->(node488)
ON CREATE SET rel1050 += {}
MERGE (node489)-[rel1051: REL_TARGET {uuid: "23ca2b6c-d272-44b6-9b82-d3da55b633d8"}]->(node490)
ON CREATE SET rel1051 += {}
