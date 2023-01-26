 MATCH (node16:_Identifiable {uuid: "1a1565c8-9f6f-4391-a7b4-0aa98c778e51"})
                MERGE (node491:_Identifiable {uuid: "179b2a63-7cc5-4108-be48-e3bef99dbf8a"})
                ON CREATE SET node491:Graphlet
                ON CREATE SET node491 += {name: "Type node"}
                MERGE (node492:_Identifiable {uuid: "44cdb6e1-6910-40a9-b10b-001d2306f6f1"})
                ON CREATE SET node492:Node
                ON CREATE SET node492 += {}
MERGE (node492)-[rel1052: DEFINED_BY {uuid: "41de7c2d-1670-4e29-8382-633e365538f4"}]->(node16)
ON CREATE SET rel1052 += {}
MERGE (node491)-[rel1053: CONTAINS {uuid: "ba080a00-abe0-4e9c-b4ec-7231461c6b90"}]->(node492)
ON CREATE SET rel1053 += {}
