 MATCH (node190:_Identifiable {uuid: "e0fb13f4-d35f-4b50-8f48-37f955540188"})
 MATCH (node194:_Identifiable {uuid: "7b762bee-df9b-48b7-bcce-54159f8fde8f"})
                MERGE (node770:_Identifiable {uuid: "41bb90a9-23c1-45d9-af78-88456518e1ba"})
                ON CREATE SET node770:Metagraph
                ON CREATE SET node770 += {name: "Movies"}
                MERGE (node786:_Identifiable {uuid: "8a0acc34-d891-4dd9-ba00-15f07da4b23b"})
                ON CREATE SET node786:RelDef
                ON CREATE SET node786 += {name: "ACTED_IN"}
                MERGE (node783:_Identifiable {uuid: "51a45ff4-593a-44d2-982c-c50cf6f51503"})
                ON CREATE SET node783:Type
                ON CREATE SET node783 += {name: "Review"}
                MERGE (node782:_Identifiable {uuid: "3c5dab39-4d14-496e-978b-9ebfb40b12f0"})
                ON CREATE SET node782:RelDef
                ON CREATE SET node782 += {name: "REVIEWED"}
                MERGE (node781:_Identifiable {uuid: "c9d9fdd9-e398-4cd8-ae92-cb28bfa76fd1"})
                ON CREATE SET node781:RelDef
                ON CREATE SET node781 += {name: "WROTE"}
                MERGE (node780:_Identifiable {uuid: "385a8efd-a82f-4f16-91d9-c4f4c18c7ed4"})
                ON CREATE SET node780:RelDef
                ON CREATE SET node780 += {name: "PRODUCED"}
                MERGE (node779:_Identifiable {uuid: "a68defe9-768b-404f-8d2e-d1f5b04bc8b4"})
                ON CREATE SET node779:RelDef
                ON CREATE SET node779 += {name: "DIRECTED"}
                MERGE (node775:_Identifiable {uuid: "b814216e-41e4-4934-bd7c-c75090423ef4"})
                ON CREATE SET node775:Type
                ON CREATE SET node775 += {name: "Movie"}
                MERGE (node774:_Identifiable {uuid: "3b3d215c-d907-456e-bf7f-169b075e15ea"})
                ON CREATE SET node774:NodeDef
                ON CREATE SET node774 += {name: "Movie"}
                MERGE (node772:_Identifiable {uuid: "2042cf2e-05f6-4b84-a4e1-928753a20b3c"})
                ON CREATE SET node772:Type
                ON CREATE SET node772 += {name: "Person"}
                MERGE (node771:_Identifiable {uuid: "7d910985-fbd4-4ff3-8e26-887b03a400f5"})
                ON CREATE SET node771:NodeDef
                ON CREATE SET node771 += {name: "Person"}
                MERGE (node785:_Identifiable {uuid: "74e7b5b1-3e93-491b-9720-80547a08bbfc"})
                ON CREATE SET node785:Property
                ON CREATE SET node785 += {name: "rating", type: "integer"}
                MERGE (node784:_Identifiable {uuid: "6d0dbf48-7115-4140-9635-f5c65b380090"})
                ON CREATE SET node784:Property
                ON CREATE SET node784 += {name: "summary", type: "string"}
                MERGE (node778:_Identifiable {uuid: "04e3c6ff-bee0-490b-a36f-8d2f9c8eb52a"})
                ON CREATE SET node778:Property
                ON CREATE SET node778 += {name: "tagline", type: "string"}
                MERGE (node777:_Identifiable {uuid: "931ee4b0-1d0a-4b51-88d1-147fa22a5469"})
                ON CREATE SET node777:Property
                ON CREATE SET node777 += {name: "title", type: "string"}
                MERGE (node776:_Identifiable {uuid: "f877c260-3fc9-4853-ab08-889fdfc0f11c"})
                ON CREATE SET node776:Property
                ON CREATE SET node776 += {name: "released", type: "integer"}
                MERGE (node773:_Identifiable {uuid: "7085c565-b902-43ad-9e8c-6eb0fc1ce9e1"})
                ON CREATE SET node773:Property
                ON CREATE SET node773 += {name: "name", type: "string"}
MERGE (node770)-[rel1575: DEFINES {uuid: "fffdac4d-11ed-4e4d-8170-177f415db5c9"}]->(node786)
ON CREATE SET rel1575 += {}
MERGE (node770)-[rel1559: DEFINES {uuid: "1be41adc-f9de-4ad3-8130-0ba6b7b56bf3"}]->(node783)
ON CREATE SET rel1559 += {}
MERGE (node770)-[rel1557: DEFINES {uuid: "04ee1fee-a3be-42cd-92df-7beca9269386"}]->(node782)
ON CREATE SET rel1557 += {}
MERGE (node770)-[rel1554: DEFINES {uuid: "49a03c41-343a-4859-90ef-5833114ade7e"}]->(node781)
ON CREATE SET rel1554 += {}
MERGE (node770)-[rel1551: DEFINES {uuid: "9af45f61-c562-44cb-937e-92946a69a93f"}]->(node780)
ON CREATE SET rel1551 += {}
MERGE (node770)-[rel1548: DEFINES {uuid: "44749c1b-c6be-4b99-ac6b-d97b9bb726c3"}]->(node779)
ON CREATE SET rel1548 += {}
MERGE (node770)-[rel1538: DEFINES {uuid: "4a79ad7b-d8f1-4708-be61-7b7ce8a1b92b"}]->(node775)
ON CREATE SET rel1538 += {}
MERGE (node770)-[rel1536: DEFINES {uuid: "38cebac0-bb3a-418a-84e3-b6e8d808a59c"}]->(node774)
ON CREATE SET rel1536 += {}
MERGE (node770)-[rel1530: DEFINES {uuid: "94c06cc1-c75a-443d-be5d-9c292e7bb05f"}]->(node772)
ON CREATE SET rel1530 += {}
MERGE (node770)-[rel1527: DEFINES {uuid: "c71c45ab-f133-4405-94df-e8bfe54245d1"}]->(node771)
ON CREATE SET rel1527 += {}
MERGE (node786)-[rel1574: HAS_TYPE {uuid: "098f0f7a-a85f-46dd-9c06-2c43d32af6fd"}]->(node190)
ON CREATE SET rel1574 += {}
MERGE (node782)-[rel1561: HAS_TYPE {uuid: "e92ee4d1-0fe7-4915-94ec-9be44ea20e2b"}]->(node783)
ON CREATE SET rel1561 += {}
MERGE (node782)-[rel1556: HAS_TYPE {uuid: "d8ed69b2-1133-4006-9d01-07761b7c0b57"}]->(node190)
ON CREATE SET rel1556 += {}
MERGE (node781)-[rel1553: HAS_TYPE {uuid: "2367da6f-8b1c-498c-83eb-15c2b0a915fb"}]->(node190)
ON CREATE SET rel1553 += {}
MERGE (node780)-[rel1550: HAS_TYPE {uuid: "7b88a541-6a30-4f8f-a7ed-58c52315283c"}]->(node190)
ON CREATE SET rel1550 += {}
MERGE (node779)-[rel1547: HAS_TYPE {uuid: "82952f43-c0b0-4c5e-8737-215c1c4f75b5"}]->(node190)
ON CREATE SET rel1547 += {}
MERGE (node774)-[rel1540: HAS_TYPE {uuid: "fa7e0d1e-f17c-4847-9552-28e56c8606ce"}]->(node775)
ON CREATE SET rel1540 += {}
MERGE (node771)-[rel1532: HAS_TYPE {uuid: "b432e941-5622-4775-93a2-e6f7c4f96ef8"}]->(node772)
ON CREATE SET rel1532 += {}
MERGE (node190)-[rel309: HAS_PROPERTY {uuid: "297cbbda-871b-3add-aedd-c8ba0814bba0"}]->(node191)
ON CREATE SET rel309 += {}
MERGE (node783)-[rel1564: HAS_PROPERTY {uuid: "3c2d011f-8035-4826-98f1-a3d3b6628722"}]->(node785)
ON CREATE SET rel1564 += {}
MERGE (node783)-[rel1562: HAS_PROPERTY {uuid: "b25f9d8d-efc0-4d6b-89dc-b6d4fa37ae8e"}]->(node784)
ON CREATE SET rel1562 += {}
MERGE (node775)-[rel1545: HAS_PROPERTY {uuid: "28544fea-20ab-4bd8-8cbc-1feee0104880"}]->(node778)
ON CREATE SET rel1545 += {}
MERGE (node775)-[rel1543: HAS_PROPERTY {uuid: "e3b3f434-70d8-46a3-9fb5-6604f43fc49b"}]->(node777)
ON CREATE SET rel1543 += {}
MERGE (node775)-[rel1541: HAS_PROPERTY {uuid: "9e6a6c98-07af-41ef-8271-23ae4e795eaa"}]->(node776)
ON CREATE SET rel1541 += {}
MERGE (node772)-[rel1533: HAS_PROPERTY {uuid: "fbde633b-1514-45a4-9e8b-94de2027d22f"}]->(node773)
ON CREATE SET rel1533 += {}
MERGE (node786)-[rel1577: REL_SOURCE {uuid: "5467cd15-c036-4e2e-acc2-375cfd48bcf5"}]->(node771)
ON CREATE SET rel1577 += {}
MERGE (node782)-[rel1572: REL_SOURCE {uuid: "8142056f-f237-4f9d-8864-de5a4463eac0"}]->(node771)
ON CREATE SET rel1572 += {}
MERGE (node781)-[rel1570: REL_SOURCE {uuid: "dfbcba2d-7978-4b82-a035-e4db022af2be"}]->(node771)
ON CREATE SET rel1570 += {}
MERGE (node780)-[rel1566: REL_SOURCE {uuid: "508a6d69-a52f-4e20-8409-e32834d140b7"}]->(node771)
ON CREATE SET rel1566 += {}
MERGE (node779)-[rel1568: REL_SOURCE {uuid: "e895918a-35a3-4587-97fc-bfc7f60a09bc"}]->(node771)
ON CREATE SET rel1568 += {}
MERGE (node786)-[rel1578: REL_TARGET {uuid: "48a72bfd-d6ed-4e1d-b498-2b50c8b60d75"}]->(node774)
ON CREATE SET rel1578 += {}
MERGE (node782)-[rel1573: REL_TARGET {uuid: "cbc118a7-2e55-479b-bd5f-23ee5d674896"}]->(node774)
ON CREATE SET rel1573 += {}
MERGE (node781)-[rel1571: REL_TARGET {uuid: "6b3953fd-23c3-455d-974d-faf15de76fef"}]->(node774)
ON CREATE SET rel1571 += {}
MERGE (node780)-[rel1567: REL_TARGET {uuid: "78ef191c-24d0-4848-91c9-9301c7810ac2"}]->(node774)
ON CREATE SET rel1567 += {}
MERGE (node779)-[rel1569: REL_TARGET {uuid: "391ce409-700f-47ff-a8a5-b0de96df0c71"}]->(node774)
ON CREATE SET rel1569 += {}
MERGE (node774)-[rel1535: SUBCLASS_OF {uuid: "9cd212c1-777f-48bc-a84a-7b4a69c4f745"}]->(node194)
ON CREATE SET rel1535 += {}
MERGE (node771)-[rel1526: SUBCLASS_OF {uuid: "b7784b0b-ff03-4b91-9393-43ebe73e90e8"}]->(node194)
ON CREATE SET rel1526 += {}
