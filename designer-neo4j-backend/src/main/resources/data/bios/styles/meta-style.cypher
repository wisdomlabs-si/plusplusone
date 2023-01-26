MATCH (node8:_Identifiable {uuid: "b9c5f145-dfa5-3e51-8d03-0b2cda2ee429"})
MATCH (node1:_Identifiable {uuid: "c130660a-4718-4136-8ed6-c8abd4556443"})
MATCH (node29:_Identifiable {uuid: "ecb7ba7f-dd0b-3563-8235-77628d657268"})
MATCH (node10:_Identifiable {uuid: "e255a339-9763-48b0-9ba8-e4de15160da3"})
MATCH (node5:_Identifiable {uuid: "c44baf47-7a11-42a5-98eb-0df8989339c6"})
MATCH (node9:_Identifiable {uuid: "065067f4-06e0-4ff0-b49e-9eeaa6ff8f8a"})
MATCH (node16:_Identifiable {uuid: "1a1565c8-9f6f-4391-a7b4-0aa98c778e51"})
MATCH (node21:_Identifiable {uuid: "3cf2886a-1f74-4c58-9778-bb8d934b46fb"})
MATCH (node103:_Identifiable {uuid: "29e9a72f-526e-38ff-bf9b-5b81b2d51873"})
MATCH (node104:_Identifiable {uuid: "5938fb37-0c57-3774-aa26-193de41e6049"})
MATCH (node15:_Identifiable {uuid: "ff2249b2-6227-3a4c-bdfa-8e0545193572"})
MATCH (node14:_Identifiable {uuid: "822223af-6acf-3694-bd09-c352d69f8f1f"})
MATCH (node4:_Identifiable {uuid: "6b8f35a3-98a7-39d2-bd60-7ab05d50da7c"})
MATCH (node3:_Identifiable {uuid: "300d0216-2771-3465-986d-cd2e5550f826"})
MATCH (node2:_Identifiable {uuid: "62504cb2-ccec-31d8-b845-f4ab7b377916"})
MATCH (node23:_Identifiable {uuid: "7dd36551-04c4-347c-9b71-d853e8f7f90b"})
MATCH (node24:_Identifiable {uuid: "f8066179-61a2-33d5-ac11-ec0f143636ec"})
MATCH (node25:_Identifiable {uuid: "2943c588-61cb-3405-9fe7-4943b895f72b"})
MERGE (node435:_Identifiable {uuid: "f17fc242-b08d-436d-8fb0-29ae04b9a224"})
  ON CREATE SET node435:Style
  ON CREATE SET node435 += {name: "Metagraph Style"}
MERGE (node436:_Identifiable {uuid: "740f158b-042a-43b7-b6e0-cb5fe4052b8b"})
  ON CREATE SET node436:RelStyle
  ON CREATE SET node436 += {color: "#837f7f", lineStyle: "dashed", lineWidth: 1}
MERGE (node445:_Identifiable {uuid: "bae26ffe-fdd3-47d3-b026-0eba404fef85"})
  ON CREATE SET node445:RelStyle
  ON CREATE SET node445 += {color: "#875C74", lineStyle: "solid", lineWidth: 2}
MERGE (node437:_Identifiable {uuid: "ecdd78ae-83f2-4ee6-baac-b1a879a9bc88"})
  ON CREATE SET node437:NodeStyle
  ON CREATE SET node437 += {color: "#3066BE", size: 100}
MERGE (node446:_Identifiable {uuid: "4bf4a70e-bcf3-49bf-b6e6-f63c309f9e77"})
  ON CREATE SET node446:NodeStyle
  ON CREATE SET node446 += {color: "#6D9DC5", size: 60}
MERGE (node443:_Identifiable {uuid: "f980c373-766c-411c-9d9b-709347b0a2c3"})
  ON CREATE SET node443:NodeStyle
  ON CREATE SET node443 += {color: "#A790A5", size: 65}
MERGE (node441:_Identifiable {uuid: "67dca3b1-0f73-410d-a58b-b3556c26cf49"})
  ON CREATE SET node441:NodeStyle
  ON CREATE SET node441 += {color: "#4EBDB8", size: 80}
MERGE (node442:_Identifiable {uuid: "3d76e30f-683b-49d4-a8c1-4a896b611e39"})
  ON CREATE SET node442:NodeStyle
  ON CREATE SET node442 += {color: "#bcbbbb", size: 50}
MERGE (node444:_Identifiable {uuid: "53a7a1bb-59c9-44f4-8118-f67eee0c12e0"})
  ON CREATE SET node444:NodeStyle
  ON CREATE SET node444 += {color: "#875C74", size: 85}
MERGE (node439:_Identifiable {uuid: "4afd3e03-cbbb-4402-878d-e287ee1899b9"})
  ON CREATE SET node439:NodeStyle
  ON CREATE SET node439 += {color: "#119DA4", size: 80}
MERGE (node438:_Identifiable {uuid: "374dd80d-d8a1-4b27-b528-bf71b374f79c"})
  ON CREATE SET node438:RelStyle
  ON CREATE SET node438 += {color: "#6D9DC5", lineStyle: "solid", lineWidth: 2}
MERGE (node440:_Identifiable {uuid: "81a074df-4c4e-436f-a656-8437bff2a0d5"})
  ON CREATE SET node440:RelStyle
  ON CREATE SET node440 += {color: "#b1c7ea", lineStyle: "dashed", lineWidth: 1}
MERGE (node447:_Identifiable {uuid: "8186b5ad-b326-489d-be3f-66a5bf214cf2"})
  ON CREATE SET node447:RelStyle
  ON CREATE SET node447 += {color: "#119DA4", lineStyle: "solid", lineWidth: 2}
MERGE (node435)-[rel898: DEFAULT_REL_STYLE {uuid: "320378fc-efe2-43e9-9aaa-d643bf7947a1"}]->(node436)
  ON CREATE SET rel898 += {}
MERGE (node435)-[rel907: REL_STYLE {uuid: "de1b2641-4f43-47bc-b134-f60eb952e29d"}]->(node445)
  ON CREATE SET rel907 += {}
MERGE (node435)-[rel899: NODE_STYLE {uuid: "af4383c2-5e1a-42b4-9249-2a742dfb7389"}]->(node437)
  ON CREATE SET rel899 += {}
MERGE (node435)-[rel908: NODE_STYLE {uuid: "26ca44e7-fa6b-4daf-bc23-18ddd8e42119"}]->(node446)
  ON CREATE SET rel908 += {}
MERGE (node435)-[rel905: NODE_STYLE {uuid: "7fe163a5-8da9-4e79-811f-dd195838ca7f"}]->(node443)
  ON CREATE SET rel905 += {}
MERGE (node435)-[rel903: NODE_STYLE {uuid: "0611c729-ecd1-432a-bcdb-e2f2f6e60e3c"}]->(node441)
  ON CREATE SET rel903 += {}
MERGE (node435)-[rel904: DEFAULT_NODE_STYLE {uuid: "a09bc507-20e4-403b-a6fe-ac2aa9fc43b9"}]->(node442)
  ON CREATE SET rel904 += {}
MERGE (node435)-[rel906: NODE_STYLE {uuid: "070316b8-69b3-4044-a539-ff5db4558bd1"}]->(node444)
  ON CREATE SET rel906 += {}
MERGE (node435)-[rel901: NODE_STYLE {uuid: "7b3c805b-49ed-4c77-851c-8fa340ead637"}]->(node439)
  ON CREATE SET rel901 += {}
MERGE (node435)-[rel900: REL_STYLE {uuid: "8fe45111-37c2-4221-aea3-91700327966f"}]->(node438)
  ON CREATE SET rel900 += {}
MERGE (node435)-[rel902: REL_STYLE {uuid: "2cf064ee-3cf7-4bb1-b3fb-9881faadae64"}]->(node440)
  ON CREATE SET rel902 += {}
MERGE (node435)-[rel909: REL_STYLE {uuid: "8074e200-4d81-4eaa-a68a-9ce2775b8daa"}]->(node447)
  ON CREATE SET rel909 += {}
MERGE (node445)-[rel926: FOR_REL {uuid: "a70c18d0-cda2-4100-bc03-4f74e33a7130"}]->(node8)
  ON CREATE SET rel926 += {}
MERGE (node437)-[rel911: FOR_NODE {uuid: "08d0973e-2f1b-4ff7-b5c7-aab4c557125d"}]->(node1)
  ON CREATE SET rel911 += {}
MERGE (node437)-[rel910: HAS_CAPTION {uuid: "eb6934a9-1fbb-4852-80ba-2e2b0e9865e7"}]->(node29)
  ON CREATE SET rel910 += {}
MERGE (node446)-[rel928: FOR_NODE {uuid: "3d3d9709-293a-47df-ae0e-e86decbf5002"}]->(node10)
  ON CREATE SET rel928 += {}
MERGE (node446)-[rel929: HAS_CAPTION {uuid: "0378ca91-98bb-4ee9-a579-b593e9a84d93"}]->(node29)
  ON CREATE SET rel929 += {}
MERGE (node443)-[rel983: HAS_CAPTION {uuid: "1e2caf3d-6da4-48ee-a3b7-070257e81ad7"}]->(node29)
  ON CREATE SET rel983 += {}
MERGE (node443)-[rel923: FOR_NODE {uuid: "a413190f-eb29-43a3-b2bc-067dbdfce178"}]->(node5)
  ON CREATE SET rel923 += {}
MERGE (node441)-[rel922: FOR_NODE {uuid: "8cf81d80-ed9f-45a3-8c77-684c6893cab6"}]->(node9)
  ON CREATE SET rel922 += {}
MERGE (node441)-[rel921: HAS_CAPTION {uuid: "1cafa6e3-35c9-43cd-b5c0-1d9b31fcbc2a"}]->(node29)
  ON CREATE SET rel921 += {}
MERGE (node444)-[rel978: HAS_CAPTION {uuid: "b245ab98-e388-476b-9c48-5784894cd3e8"}]->(node29)
  ON CREATE SET rel978 += {}
MERGE (node444)-[rel924: FOR_NODE {uuid: "acdf8fcf-2b37-4703-ac9a-e17717044d90"}]->(node16)
  ON CREATE SET rel924 += {}
MERGE (node439)-[rel917: FOR_NODE {uuid: "4ff8c9ec-ea7b-4a4e-a47b-af9353e859aa"}]->(node21)
  ON CREATE SET rel917 += {}
MERGE (node439)-[rel916: HAS_CAPTION {uuid: "4f3d544f-f893-4670-870a-29c18ed8192c"}]->(node29)
  ON CREATE SET rel916 += {}
MERGE (node438)-[rel927: FOR_REL {uuid: "630fe6fa-aead-4133-a43b-573ce92fbc24"}]->(node103)
  ON CREATE SET rel927 += {}
MERGE (node438)-[rel957: FOR_REL {uuid: "1df39412-f4c6-4089-8d10-18d3fcb9cbf4"}]->(node104)
  ON CREATE SET rel957 += {}
MERGE (node438)-[rel914: FOR_REL {uuid: "498a699e-5d10-48a6-ba2b-8d6f7cd06082"}]->(node15)
  ON CREATE SET rel914 += {}
MERGE (node438)-[rel912: FOR_REL {uuid: "2a3e342d-afe3-46d7-8662-43a7c7030380"}]->(node14)
  ON CREATE SET rel912 += {}
MERGE (node438)-[rel913: FOR_REL {uuid: "2a3e342d-afe3-46d7-8662-43a7c7030380"}]->(node104)
  ON CREATE SET rel913 += {}
MERGE (node438)-[rel915: FOR_REL {uuid: "498a699e-5d10-48a6-ba2b-8d6f7cd06082"}]->(node103)
  ON CREATE SET rel915 += {}
MERGE (node440)-[rel919: FOR_REL {uuid: "fb6887dd-e5f6-4a8b-a8ba-6a8813d71106"}]->(node4)
  ON CREATE SET rel919 += {}
MERGE (node440)-[rel918: FOR_REL {uuid: "c6f67fe0-28a4-4044-a6d9-496620876b16"}]->(node3)
  ON CREATE SET rel918 += {}
MERGE (node440)-[rel920: FOR_REL {uuid: "18d72f98-12d6-4f3e-a26e-875440d3a0a2"}]->(node2)
  ON CREATE SET rel920 += {}
MERGE (node447)-[rel987: FOR_REL {uuid: "58d87de3-b3db-4d3a-a6ec-e5a1d431a18e"}]->(node23)
  ON CREATE SET rel987 += {}
MERGE (node447)-[rel931: FOR_REL {uuid: "2a882873-e119-470d-8e84-2684de6e776a"}]->(node24)
  ON CREATE SET rel931 += {}
MERGE (node447)-[rel930: FOR_REL {uuid: "2a882873-e119-470d-8e84-2684de6e776a"}]->(node23)
  ON CREATE SET rel930 += {}
MERGE (node447)-[rel932: FOR_REL {uuid: "2a882873-e119-470d-8e84-2684de6e776a"}]->(node25)
  ON CREATE SET rel932 += {}
