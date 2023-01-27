 MATCH (node103:_Identifiable {uuid: "d53395e3-4eca-42f3-97d0-13436cadece9"})
 MATCH (node105:_Identifiable {uuid: "ed65f403-acaf-4a82-aab0-586805ef24c6"})
 MATCH (node104:_Identifiable {uuid: "079ce655-2edf-45b8-9a4d-c4d845583d6e"})
 MATCH (node1333:_Identifiable {uuid: "ec19f239-3ae1-45db-92eb-27e0dc2cdb21"})
 MATCH (node1334:_Identifiable {uuid: "b6a08326-9895-4b86-94f0-3c69662c56b1"})
 MATCH (node1336:_Identifiable {uuid: "f996b984-b7cf-40f6-860b-fe2f6f422f83"})
 MATCH (node1335:_Identifiable {uuid: "60edd9bd-6dd1-41a9-aa0c-5643b4785187"})
 MATCH (node1318:_Identifiable {uuid: "84de16ed-4b79-46ad-a0b3-6395aaf73347"})
 MATCH (node1319:_Identifiable {uuid: "2c5ca76b-49e6-474e-acf7-1551494d31ae"})
 MATCH (node1320:_Identifiable {uuid: "6a9e60e7-ce8d-4c75-b2cf-2d1e686dfee3"})
 MATCH (node1294:_Identifiable {uuid: "33651066-6342-4079-8361-f8527a5d1c9d"})
 MATCH (node1296:_Identifiable {uuid: "4639d63f-4fe3-4d7f-820e-e99d9d82f7c2"})
 MATCH (node1295:_Identifiable {uuid: "57fc68bb-f87e-4dfc-84b2-72bd6799a9d0"})
 MATCH (node1286:_Identifiable {uuid: "9130d126-60d2-4603-9750-8466165fdffb"})
 MATCH (node1287:_Identifiable {uuid: "7ff2b3c9-caee-480d-bca9-dd3eba809719"})
 MATCH (node133:_Identifiable {uuid: "e19b0c75-a1d0-4ca7-89dd-eae4820d3baf"})
 MATCH (node1263:_Identifiable {uuid: "7d910985-fbd4-4ff3-8e26-887b03a400f5"})
 MATCH (node1269:_Identifiable {uuid: "7085c565-b902-43ad-9e8c-6eb0fc1ce9e1"})
                MERGE (node80:_Identifiable {uuid: "86846500-c3cc-4a8b-b2fd-e9876460fd1a"})
                ON CREATE SET node80:Dashboard
                ON CREATE SET node80 += {title: "Movies"}
                MERGE (node82:_Identifiable {uuid: "f3606273-64b6-49be-afd7-cfae2c2e3fe2"})
                ON CREATE SET node82:Page
                ON CREATE SET node82 += {title: "Actors"}
                MERGE (node121:_Identifiable {uuid: "2700a8cf-762e-429a-9650-7670dd71de14"})
                ON CREATE SET node121:LineReport
                ON CREATE SET node121 += {refreshRate: 100, title: "Number of movies through the years"}
                MERGE (node94:_Identifiable {uuid: "b4e57591-d902-4a9e-9c9d-c51b022a309f"})
                ON CREATE SET node94:PieReport
                ON CREATE SET node94 += {refreshRate: 100, title: "Percentage of movies per year"}
                MERGE (node92:_Identifiable {uuid: "3f649abe-7058-4f95-9a44-6bdf0815aa58"})
                ON CREATE SET node92:GraphReport
                ON CREATE SET node92 += {refreshRate: 100, title: "Actor Movies"}
                MERGE (node90:_Identifiable {uuid: "aa4ed653-56b4-47c5-879b-2b28b76db486"})
                ON CREATE SET node90:BarReport
                ON CREATE SET node90 += {refreshRate: 100, hideSelections: true, showLegend: true, title: "Tom Hanks co-actors"}
                MERGE (node88:_Identifiable {uuid: "6ec3b930-78cd-4b2f-b730-e45a4c50b2e9"})
                ON CREATE SET node88:TableReport
                ON CREATE SET node88 += {transposed: false, refreshRate: 200, title: "Movies released after 1990", allowDownload: false}
                MERGE (node86:_Identifiable {uuid: "c8b3d93a-05ec-4930-83c4-35c58f308da0"})
                ON CREATE SET node86:MarkdownReport
                ON CREATE SET node86 += {refreshRate: 100, text: "This dashboard give you a basic understanding of how dashboard are built using our graph designer.", title: "Movies Demo"}
                MERGE (node84:_Identifiable {uuid: "f9a49cba-1d9a-4469-a9e5-01db605f5f0e"})
                ON CREATE SET node84:SingleValueReport
                ON CREATE SET node84 += {refreshRate: 0, title: "Number of movies"}
                MERGE (node135:_Identifiable {uuid: "7ba94da4-18ea-4b9e-add6-06f85ece25f0"})
                ON CREATE SET node135:NodePropertyParameter
                ON CREATE SET node135 += {refreshRate: 0, name: "actorName", title: "Select Actor name"}
                MERGE (node96:_Identifiable {uuid: "4b3491cc-7fc3-4032-8547-43d8fb602a38"})
                ON CREATE SET node96:TextParameter
                ON CREATE SET node96 += {refreshRate: 0, name: "Actor name", title: "Input Actor"}
                MERGE (node133:_Identifiable {uuid: "e19b0c75-a1d0-4ca7-89dd-eae4820d3baf"})
                ON CREATE SET node133:Input
                ON CREATE SET node133 += {name: "actorName", type: "string"}
                MERGE (node1263:_Identifiable {uuid: "7d910985-fbd4-4ff3-8e26-887b03a400f5"})
                ON CREATE SET node1263:NodeDef
                ON CREATE SET node1263 += {name: "Person"}
                MERGE (node1269:_Identifiable {uuid: "7085c565-b902-43ad-9e8c-6eb0fc1ce9e1"})
                ON CREATE SET node1269:Property
                ON CREATE SET node1269 += {name: "name", type: "string"}
MERGE (node80)-[rel1962: DISPLAYS_PAGE {uuid: "b5a13dce-41ff-445a-a135-eb50bcd4a78a"}]->(node82)
ON CREATE SET rel1962 += {}
MERGE (node82)-[rel145: PROVIDES_PARAMETER {uuid: "276327b7-8c82-4fce-8744-e29a6cc469d6"}]->(node135)
ON CREATE SET rel145 += {positionY: 3, width: 3, positionX: 0, height: 1}
MERGE (node82)-[rel43: PROVIDES_PARAMETER {uuid: "1e6b89e5-7c15-4d67-80b4-0c78eebe2782"}]->(node96)
ON CREATE SET rel43 += {positionY: 5, width: 1, positionX: 2, height: 1}
MERGE (node82)-[rel99: DISPLAYS_REPORT {uuid: "2bdaa9d6-e383-4fd2-b671-03031e9a71ba"}]->(node121)
ON CREATE SET rel99 += {positionY: 4, width: 5, positionX: 2, height: 3}
MERGE (node82)-[rel64: DISPLAYS_REPORT {uuid: "6853ec0b-0268-4db6-8dc5-4cc1b3d87256"}]->(node94)
ON CREATE SET rel64 += {positionY: 3, width: 3, positionX: 0, height: 2}
MERGE (node82)-[rel51: DISPLAYS_REPORT {uuid: "0644921a-8a2f-4865-93ee-d18b4e81f856"}]->(node92)
ON CREATE SET rel51 += {positionY: 1, width: 3, positionX: 2, height: 2}
MERGE (node82)-[rel2017: DISPLAYS_REPORT {uuid: "2d973d61-91e4-448e-ac9f-0878304c662d"}]->(node90)
ON CREATE SET rel2017 += {positionY: 3, width: 4, positionX: 3, height: 2}
MERGE (node82)-[rel2002: DISPLAYS_REPORT {uuid: "413f1a0b-2c4e-452c-bea2-eb85fc4f476b"}]->(node88)
ON CREATE SET rel2002 += {positionY: 2, width: 2, positionX: 2, height: 2}
MERGE (node82)-[rel1994: DISPLAYS_REPORT {uuid: "43debcf7-56b4-4f9e-a45c-a9dee12e6fd2"}]->(node86)
ON CREATE SET rel1994 += {positionY: 1, width: 1, positionX: 1, height: 1}
MERGE (node82)-[rel1978: DISPLAYS_REPORT {uuid: "f49abf3c-6e4c-4c37-a75f-039caa1df093"}]->(node84)
ON CREATE SET rel1978 += {positionY: 0, width: 1, positionX: 0, height: 1}
MERGE (node121)-[rel98: DISPLAYS_VALUES_ON_Y_AXIS {uuid: "cf5f331e-162f-45b8-98da-a1234c46bcf6"}]->(node104)
ON CREATE SET rel98 += {}
MERGE (node121)-[rel97: DISPLAYS_VALUES_ON_X_AXIS {uuid: "8e9221b2-13e9-4bf8-bf58-1f221ab6f340"}]->(node105)
ON CREATE SET rel97 += {}
MERGE (node121)-[rel95: EXECUTES {uuid: "a89b78bc-2704-400f-a0c3-11417ece0e05"}]->(node103)
ON CREATE SET rel95 += {}
MERGE (node94)-[rel68: INDEX_BY {uuid: "7b577d3c-fc64-46ae-93c3-76c8f7a5f49d"}]->(node105)
ON CREATE SET rel68 += {}
MERGE (node94)-[rel67: DISPLAYS_VALUES {uuid: "8e3c302e-e6cd-4bbb-a03e-0d4ad7cbb646"}]->(node104)
ON CREATE SET rel67 += {}
MERGE (node94)-[rel66: EXECUTES {uuid: "8e3d0968-8176-4f6e-9290-78eb0486bea4"}]->(node103)
ON CREATE SET rel66 += {}
MERGE (node92)-[rel63: DISPLAYS_VALUES {uuid: "caa2aa90-3429-4253-91c9-d466191a7729"}]->(node1334)
ON CREATE SET rel63 += {}
MERGE (node92)-[rel62: DISPLAYS_VALUES {uuid: "b596d954-93b9-46c5-9380-283721c19848"}]->(node1336)
ON CREATE SET rel62 += {}
MERGE (node92)-[rel61: DISPLAYS_VALUES {uuid: "7fbb04ff-885c-44bd-b461-f095356f9218"}]->(node1335)
ON CREATE SET rel61 += {}
MERGE (node92)-[rel56: EXECUTES {uuid: "bbeec3a7-d3cd-4857-8dea-2b2621a4d569"}]->(node1333)
ON CREATE SET rel56 += {}
MERGE (node90)-[rel2027: INDEX_BY {uuid: "68d54471-c18c-47d9-a8c4-4d7b5ab9caaf"}]->(node1320)
ON CREATE SET rel2027 += {}
MERGE (node90)-[rel2026: DISPLAYS_VALUES {uuid: "8f51dafe-b69c-40ed-acaa-3d195dd5e04a"}]->(node1319)
ON CREATE SET rel2026 += {}
MERGE (node90)-[rel2025: EXECUTES {uuid: "28047e8f-8fa3-4c3a-b7eb-c51563391317"}]->(node1318)
ON CREATE SET rel2025 += {}
MERGE (node88)-[rel2016: DISPLAYS_VALUES {uuid: "bc2382de-b21a-4477-b2c7-98e37d97e1b5"}]->(node1296)
ON CREATE SET rel2016 += {}
MERGE (node88)-[rel2015: DISPLAYS_VALUES {uuid: "934a6159-e3f6-4896-b44a-1b584ac88400"}]->(node1295)
ON CREATE SET rel2015 += {}
MERGE (node88)-[rel2014: EXECUTES {uuid: "3f8c8f65-382f-424c-9f64-9970fc57da51"}]->(node1294)
ON CREATE SET rel2014 += {}
MERGE (node84)-[rel1993: DISPLAYS_VALUE {uuid: "9ce3c0a1-feeb-4693-90de-d5649697060c"}]->(node1287)
ON CREATE SET rel1993 += {}
MERGE (node84)-[rel1990: EXECUTES {uuid: "b6a742b0-12fc-4198-8b53-8e6310eefcb5"}]->(node1286)
ON CREATE SET rel1990 += {}
MERGE (node135)-[rel1979: FOR_PROPERTY {uuid: "03332039-ca7a-499d-95f9-a92e2cca37ee"}]->(node1269)
ON CREATE SET rel1979 += {}
MERGE (node135)-[rel1974: FOR_NODE {uuid: "3f4f044c-b9bc-4b91-98df-c9150cd41502"}]->(node1263)
ON CREATE SET rel1974 += {}
MERGE (node135)-[rel1968: PROVIDES_VALUE {uuid: "bd310ee4-ce41-4bab-b6eb-743362b6b867"}]->(node133)
ON CREATE SET rel1968 += {}
