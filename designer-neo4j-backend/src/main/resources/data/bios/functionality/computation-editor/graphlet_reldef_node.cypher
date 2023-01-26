 MATCH (node10:_Identifiable {uuid: "e255a339-9763-48b0-9ba8-e4de15160da3"})
                MERGE (node481:_Identifiable {uuid: "cb98b6ad-c48e-4800-a9e8-1314091b1167"})
                ON CREATE SET node481:Graphlet
                ON CREATE SET node481 += {name: "RelDef node"}
                MERGE (node482:_Identifiable {uuid: "df0f32ae-bb6c-4282-8dde-77cca5bc2469"})
                ON CREATE SET node482:Node
                ON CREATE SET node482 += {}
MERGE (node482)-[rel1034: DEFINED_BY {uuid: "f04b13a5-f40e-4d04-a3a3-4a2df303fe3a"}]->(node10)
ON CREATE SET rel1034 += {}
MERGE (node481)-[rel1035: CONTAINS {uuid: "e94c1f00-3d15-4f3b-bb9b-5dd985247192"}]->(node482)
ON CREATE SET rel1035 += {}
