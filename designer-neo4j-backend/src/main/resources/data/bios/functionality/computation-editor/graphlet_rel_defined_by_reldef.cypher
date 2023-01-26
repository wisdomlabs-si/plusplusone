 MATCH (node98:_Identifiable {uuid: "1a6ad23d-9e27-3d82-ba16-b392086b738c"})
 MATCH (node10:_Identifiable {uuid: "e255a339-9763-48b0-9ba8-e4de15160da3"})
 MATCH (node90:_Identifiable {uuid: "025d677e-6c95-4cb4-83a3-ec83e8b7fbae"})
                MERGE (node495:_Identifiable {uuid: "01656f32-243a-4ee2-bd5a-6411a950d812"})
                ON CREATE SET node495:Graphlet
                ON CREATE SET node495 += {name: "Rel defined by RelDef"}
                MERGE (node497:_Identifiable {uuid: "3003a0eb-f4a3-4003-8af7-0c2d0d6edf70"})
                ON CREATE SET node497:Rel
                ON CREATE SET node497 += {}
                MERGE (node496:_Identifiable {uuid: "40d056f9-ec35-427c-82d1-e41f826995d0"})
                ON CREATE SET node496:Node
                ON CREATE SET node496 += {}
                MERGE (node498:_Identifiable {uuid: "65b8b182-a44f-4938-84fe-81c4177549fa"})
                ON CREATE SET node498:Node
                ON CREATE SET node498 += {}
MERGE (node497)-[rel1057: DEFINED_BY {uuid: "090cb260-e795-41e0-8d58-1789303e30a9"}]->(node98)
ON CREATE SET rel1057 += {}
MERGE (node496)-[rel1056: DEFINED_BY {uuid: "24a20c67-2b30-4716-bc68-46c6b995b212"}]->(node10)
ON CREATE SET rel1056 += {}
MERGE (node498)-[rel1058: DEFINED_BY {uuid: "6e33f177-7247-42b5-8adb-239cc3d974f5"}]->(node90)
ON CREATE SET rel1058 += {}
MERGE (node495)-[rel1060: CONTAINS {uuid: "90c81831-c264-4689-a1a8-bc5f0fc5d5c8"}]->(node497)
ON CREATE SET rel1060 += {}
MERGE (node495)-[rel1059: CONTAINS {uuid: "acbd2fad-a132-4aca-b8fc-6954de84f9c8"}]->(node496)
ON CREATE SET rel1059 += {}
MERGE (node495)-[rel1061: CONTAINS {uuid: "64efad00-9a7a-44d6-8978-64d719ce7a65"}]->(node498)
ON CREATE SET rel1061 += {}
MERGE (node497)-[rel1062: REL_TARGET {uuid: "22847eee-b1f6-4092-a433-9e7ee9a3b21a"}]->(node496)
ON CREATE SET rel1062 += {}
MERGE (node497)-[rel1063: REL_SOURCE {uuid: "9ffd28f7-338c-4745-bd93-212c934b9ca5"}]->(node498)
ON CREATE SET rel1063 += {}
