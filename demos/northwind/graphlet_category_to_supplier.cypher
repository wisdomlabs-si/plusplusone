 MATCH (node618:_Identifiable {uuid: "29309c8a-5229-4942-b8fb-d50194970fc5"})
 MATCH (node611:_Identifiable {uuid: "1ded82b7-ccfa-4433-8d95-98b39b79efd9"})
 MATCH (node607:_Identifiable {uuid: "e7118ffa-0e18-41c3-895b-f9f96afe9238"})
                MERGE (node680:_Identifiable {uuid: "1e4fa5c6-a5aa-4955-a39d-c101d7f120e4"})
                ON CREATE SET node680:Graphlet
                ON CREATE SET node680 += {name: "Category to Supplier"}
                MERGE (node681:_Identifiable {uuid: "c35f8939-fc3f-4b75-b2cb-603f94024415"})
                ON CREATE SET node681:Rel
                ON CREATE SET node681 += {}
                MERGE (node683:_Identifiable {uuid: "ea66e85d-f87b-493e-ba31-a67414fa1187"})
                ON CREATE SET node683:Node
                ON CREATE SET node683 += {}
                MERGE (node684:_Identifiable {uuid: "a7e46368-b2f2-4694-869a-5182f9685e30"})
                ON CREATE SET node684:Node
                ON CREATE SET node684 += {}
                MERGE (node685:_Identifiable {uuid: "8ec05069-07c7-4f21-934e-34d32c79a413"})
                ON CREATE SET node685:Node
                ON CREATE SET node685 += {}
                MERGE (node682:_Identifiable {uuid: "fd5eb236-8920-4f14-90fd-78079ba272af"})
                ON CREATE SET node682:Rel
                ON CREATE SET node682 += {}
MERGE (node683)-[rel5773: DEFINED_BY {uuid: "5b0f462a-15a0-4a7a-8dff-0fc35eab9b95"}]->(node618)
ON CREATE SET rel5773 += {}
MERGE (node684)-[rel1375: DEFINED_BY {uuid: "3bb7f174-50a8-4b3b-adda-35230a572a1e"}]->(node611)
ON CREATE SET rel1375 += {}
MERGE (node685)-[rel1376: DEFINED_BY {uuid: "d48f6b13-d1ea-442a-ab66-64fea861cbcd"}]->(node607)
ON CREATE SET rel1376 += {}
MERGE (node680)-[rel1377: CONTAINS {uuid: "2e59be43-3c16-4a31-b9cc-a5b5cd0ae155"}]->(node681)
ON CREATE SET rel1377 += {}
MERGE (node680)-[rel1379: CONTAINS {uuid: "65027f71-ea99-4636-9ed7-921844598f62"}]->(node683)
ON CREATE SET rel1379 += {}
MERGE (node680)-[rel1380: CONTAINS {uuid: "51b88987-3085-48af-bbd4-24f1ab8ed15d"}]->(node684)
ON CREATE SET rel1380 += {}
MERGE (node680)-[rel1381: CONTAINS {uuid: "7a00c22f-5c0a-4d6d-b813-1f47e8746b5d"}]->(node685)
ON CREATE SET rel1381 += {}
MERGE (node680)-[rel1378: CONTAINS {uuid: "ec8e2454-5bc3-43c4-ba7f-8e6d2b8c788a"}]->(node682)
ON CREATE SET rel1378 += {}
MERGE (node681)-[rel1383: REL_SOURCE {uuid: "c4122e4b-2e46-486f-befd-6c5fc7f726db"}]->(node683)
ON CREATE SET rel1383 += {}
MERGE (node681)-[rel1382: REL_TARGET {uuid: "5852c271-16d9-4b35-80ee-5ccd9d87cb40"}]->(node684)
ON CREATE SET rel1382 += {}
MERGE (node682)-[rel1384: REL_SOURCE {uuid: "bc28fd44-5da5-4580-9fe0-2ddda71b1224"}]->(node684)
ON CREATE SET rel1384 += {}
MERGE (node682)-[rel1385: REL_TARGET {uuid: "23da58ad-47f8-4107-961a-4dd6f2dbad61"}]->(node685)
ON CREATE SET rel1385 += {}
