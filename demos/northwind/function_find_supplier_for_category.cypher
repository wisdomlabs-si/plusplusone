 MATCH (node681:_Identifiable {uuid: "c35f8939-fc3f-4b75-b2cb-603f94024415"})
 MATCH (node683:_Identifiable {uuid: "ea66e85d-f87b-493e-ba31-a67414fa1187"})
 MATCH (node680:_Identifiable {uuid: "1e4fa5c6-a5aa-4955-a39d-c101d7f120e4"})
 MATCH (node685:_Identifiable {uuid: "8ec05069-07c7-4f21-934e-34d32c79a413"})
                MERGE (node686:_Identifiable {uuid: "797fb6db-8f11-4813-ab53-cff696598a83"})
                ON CREATE SET node686:Function
                ON CREATE SET node686 += {name: "Find Supplier for Category"}
                MERGE (node687:_Identifiable {uuid: "2d2ace47-5e35-461e-877a-aa9892bf374d"})
                ON CREATE SET node687:Input
                ON CREATE SET node687 += {name: "category", type: "string"}
                MERGE (node689:_Identifiable {uuid: "8795344f-a346-470e-9be6-50fb18705740"})
                ON CREATE SET node689:Output
                ON CREATE SET node689 += {name: "supplier", type: "string"}
                MERGE (node688:_Identifiable {uuid: "5b32fb93-84cb-4147-b9f7-b7b008ce8d01"})
                ON CREATE SET node688:Output
                ON CREATE SET node688 += {name: "supplies", type: "string"}
                MERGE (node690:_Identifiable {uuid: "f6d7ca35-0276-4bf1-b8e5-7d209f26ce4c"})
                ON CREATE SET node690:Map
                ON CREATE SET node690 += {}
                MERGE (node692:_Identifiable {uuid: "b8fc7ef4-238c-41ef-a2f5-486b9e7b7796"})
                ON CREATE SET node692:Binding
                ON CREATE SET node692 += {}
                MERGE (node691:_Identifiable {uuid: "146a96c4-b374-4971-aafc-f788875d5d1f"})
                ON CREATE SET node691:Binding
                ON CREATE SET node691 += {}
                MERGE (node693:_Identifiable {uuid: "08c9801c-603e-40b7-a343-b2656130d284"})
                ON CREATE SET node693:Match
                ON CREATE SET node693 += {optional: false}
                MERGE (node694:_Identifiable {uuid: "c763ad2f-9213-428e-aa3e-66f99a8f8c48"})
                ON CREATE SET node694:Binding
                ON CREATE SET node694 += {}
MERGE (node686)-[rel1386: IMPLEMENTED {uuid: "9da1d08f-5865-4ac0-859f-a05334830c1c"}]->(node690)
ON CREATE SET rel1386 += {}
MERGE (node690)-[rel1388: HAS_OUTPUT_BINDING {uuid: "89156c34-6981-4d64-b676-6175c8464122"}]->(node692)
ON CREATE SET rel1388 += {}
MERGE (node690)-[rel1387: HAS_OUTPUT_BINDING {uuid: "eaec7617-1747-4285-8cee-69d290a5cd46"}]->(node691)
ON CREATE SET rel1387 += {}
MERGE (node690)-[rel1389: EXECUTES {uuid: "e3d5c0c5-f77d-41b0-86ec-f567730fd026"}]->(node693)
ON CREATE SET rel1389 += {}
MERGE (node692)-[rel1395: BINDS_FROM {uuid: "c32f3104-f3e6-40a4-b9d2-d717661338fc"}]->(node681)
ON CREATE SET rel1395 += {}
MERGE (node692)-[rel1394: BINDS_TO {uuid: "971f4eb1-b197-46b9-9c45-614aeccdd9f1"}]->(node688)
ON CREATE SET rel1394 += {}
MERGE (node692)-[rel1393: SCOPED {uuid: "b7a79b28-ffb1-4f45-9e82-62d0e61d4e8a"}]->(node693)
ON CREATE SET rel1393 += {}
MERGE (node691)-[rel1390: SCOPED {uuid: "7bf8b735-8d7f-4dff-9d7e-51ed621b2df8"}]->(node693)
ON CREATE SET rel1390 += {}
MERGE (node691)-[rel1391: BINDS_TO {uuid: "e27f18d0-660b-41f5-9634-01432715e05c"}]->(node689)
ON CREATE SET rel1391 += {}
MERGE (node691)-[rel1392: BINDS_FROM {uuid: "eca0b096-a315-4ebe-98e7-cedca0274928"}]->(node683)
ON CREATE SET rel1392 += {}
MERGE (node693)-[rel1397: USING {uuid: "919419a7-f1ec-439a-b2ed-ed098c9cce35"}]->(node680)
ON CREATE SET rel1397 += {}
MERGE (node693)-[rel1396: HAS_BINDING {uuid: "e44bbe41-00ab-48cd-8b79-bc784b98af24"}]->(node694)
ON CREATE SET rel1396 += {}
MERGE (node681)-[rel1383: REL_SOURCE {uuid: "c4122e4b-2e46-486f-befd-6c5fc7f726db"}]->(node683)
ON CREATE SET rel1383 += {}
MERGE (node694)-[rel1398: BINDS_TO {uuid: "c4980607-d58a-40c8-bbfa-f619aaaef95b"}]->(node685)
ON CREATE SET rel1398 += {}
MERGE (node694)-[rel1399: BINDS_FROM {uuid: "bd5e58d8-a24d-4080-b7eb-c0426468e41e"}]->(node687)
ON CREATE SET rel1399 += {}
MERGE (node686)-[rel1400: HAS_INPUT {uuid: "1e1392ec-38be-409c-b10a-5bdc4159d3a6"}]->(node687)
ON CREATE SET rel1400 += {}
MERGE (node686)-[rel1402: HAS_OUTPUT {uuid: "38419744-e64e-4205-92df-79a6dc7fe785"}]->(node689)
ON CREATE SET rel1402 += {}
MERGE (node686)-[rel1401: HAS_OUTPUT {uuid: "ad531b52-8083-4ab4-9075-5838e2dfcb5e"}]->(node688)
ON CREATE SET rel1401 += {}
