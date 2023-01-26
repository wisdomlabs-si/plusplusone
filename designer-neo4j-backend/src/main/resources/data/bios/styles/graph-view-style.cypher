MATCH (node160:_Identifiable {uuid: '432a309d-8d21-3389-a4b9-384c3485904b'})
MATCH (node27:_Identifiable {uuid: 'ecb7ba7f-dd0b-3563-8235-77628d657268'})
MATCH (node121:_Identifiable {uuid: 'e75c8d70-9226-3a99-8c01-d427dd898265'})
MATCH (node165:_Identifiable {uuid: '0fdb6369-ceec-3cf6-a7fb-207133ecdbc4'})
MATCH (node167:_Identifiable {uuid: 'ce4c57a5-7265-3f4a-b96f-4eaa65598ce4'})
MATCH (node162:_Identifiable {uuid: '7ba526ec-38fc-3857-823c-4799f12b79a5'})
MATCH (node127:_Identifiable {uuid: '01df95e4-39da-3c8c-b20c-51130abfec7b'})
MATCH (node155:_Identifiable {uuid: 'af88d21b-3715-37b3-bdd5-fa03af63ffc6'})
MATCH (node122:_Identifiable {uuid: 'e4743369-8f32-3a5e-bce8-5cfd8b8814b3'})
MATCH (node164:_Identifiable {uuid: '6dc04b46-1de4-3031-b950-b947631f0494'})
MATCH (node149:_Identifiable {uuid: '9944ed93-c532-37be-a171-fd5ffed1d974'})
MATCH (node150:_Identifiable {uuid: '48143797-b34e-3b56-938b-259e7aec43a4'})
MATCH (node171:_Identifiable {uuid: '075ef725-2161-30b2-ad52-6b0d4ec831b6'})
MATCH (node142:_Identifiable {uuid: 'cf2afec0-213f-3877-8fff-dcdf8691a481'})
MATCH (node138:_Identifiable {uuid: '670d5741-6c6a-32ef-a268-629a25465bee'})
MATCH (node170:_Identifiable {uuid: '240e2bff-504c-32ed-96ef-da110d643565'})
MATCH (node123:_Identifiable {uuid: '1ff9c94b-9d04-316d-b5d2-c97d3188cc11'})
MATCH (node158:_Identifiable {uuid: 'b30e0e28-9b6c-4393-8d41-3f5f31664cec'})
MATCH (node137:_Identifiable {uuid: 'c7c7976f-db04-3da8-8c9b-f3b2729e6186'})
MATCH (node136:_Identifiable {uuid: '2437fb55-5462-3f7f-8699-4c6619c181c2'})
MERGE (node449:_Identifiable {uuid: '4d0bd949-4c74-4f8f-84e1-37ca8678a552'})
  ON CREATE SET node449:Style
  ON CREATE SET node449 += {name: 'Graph View Style'}
MERGE (node451:_Identifiable {uuid: '9d2e0548-8be8-41dd-bcd1-6d8a45fa65ca'})
  ON CREATE SET node451:NodeStyle
  ON CREATE SET node451 += {size: 75, color: '#588B8B', icon: 'adjustments'}
MERGE (node456:_Identifiable {uuid: '7860318f-9030-45af-94ee-4a3afc337866'})
  ON CREATE SET node456:NodeStyle
  ON CREATE SET node456 += {color: '#E09F7D', size: 35}
MERGE (node457:_Identifiable {uuid: '0d890ea0-4b3b-4546-ba48-7c38d6e0215b'})
  ON CREATE SET node457:RelStyle
  ON CREATE SET node457 += {color: '#C8553D', lineStyle: 'solid', lineWidth: 2}
MERGE (node460:_Identifiable {uuid: 'af4068df-a528-40e6-9183-653272b87ad3'})
  ON CREATE SET node460:NodeStyle
  ON CREATE SET node460 += {size: 75, color: '#C8553D', icon: 'color-swatch'}
MERGE (node463:_Identifiable {uuid: '9ae7d006-7c4d-4e53-9eb3-283a94d032d0'})
  ON CREATE SET node463:NodeStyle
  ON CREATE SET node463 += {size: 50, color: '#EF5D60', icon: 'template'}
MERGE (node455:_Identifiable {uuid: '3e667f79-ce8d-4fd8-8791-b6a4750ccba0'})
  ON CREATE SET node455:NodeStyle
  ON CREATE SET node455 += {size: 80, color: '#A01A7D', icon: 'cursor-click'}
MERGE (node453:_Identifiable {uuid: '734f0178-e529-4f5b-a347-7ab1631ce37e'})
  ON CREATE SET node453:RelStyle
  ON CREATE SET node453 += {color: '#aaa9a9', lineStyle: 'dashed', lineWidth: 1}
MERGE (node459:_Identifiable {uuid: '2029232d-17f0-481d-b29a-b85f6f270c27'})
  ON CREATE SET node459:RelStyle
  ON CREATE SET node459 += {color: '#F28F3B', lineStyle: 'solid', lineWidth: 2}
MERGE (node464:_Identifiable {uuid: '383a9bad-5b19-4dec-b1be-f31aa4852296'})
  ON CREATE SET node464:NodeStyle
  ON CREATE SET node464 += {color: '#F28F3B', size: 35}
MERGE (node458:_Identifiable {uuid: '9dc8d81a-2da0-4c90-95bb-1e934dfbb844'})
  ON CREATE SET node458:NodeStyle
  ON CREATE SET node458 += {color: '#b5a9a9', size: 50, icon: 'question-mark-circle'}
MERGE (node454:_Identifiable {uuid: '083a8015-24ee-410c-bf56-aad71f7569fb'})
  ON CREATE SET node454:RelStyle
  ON CREATE SET node454 += {color: '#7D82B8', lineStyle: 'dashed', lineWidth: 1}
MERGE (node462:_Identifiable {uuid: 'fc75f78b-f4a9-42d2-bab2-15830b795f3a'})
  ON CREATE SET node462:NodeStyle
  ON CREATE SET node462 += {color: '#A01A7D', size: 50}
MERGE (node450:_Identifiable {uuid: 'b4ec260f-a0d7-42ca-8dc9-d92983403c3a'})
  ON CREATE SET node450:NodeStyle
  ON CREATE SET node450 += {color: '#494b8d', size: 85}
MERGE (node452:_Identifiable {uuid: 'af7b6507-4588-4cbc-a459-1b5382727165'})
  ON CREATE SET node452:RelStyle
  ON CREATE SET node452 += {color: '#FF3864', lineStyle: 'dashed', lineWidth: 1}
MERGE (node449)-[rel937:NODE_STYLE {uuid: '2d3e5463-fcb1-45fa-87e4-e5cd7b61b3a3'}]->(node451)
  ON CREATE SET rel937 += {}
MERGE (node449)-[rel942:NODE_STYLE {uuid: '44752635-5847-423e-a04e-6bd05bcfc627'}]->(node456)
  ON CREATE SET rel942 += {}
MERGE (node449)-[rel943:REL_STYLE {uuid: 'e3c8a9c1-bb4f-496e-8121-1c8b40734fca'}]->(node457)
  ON CREATE SET rel943 += {}
MERGE (node449)-[rel946:NODE_STYLE {uuid: '3ac99150-bc8e-4139-90bd-f9733ab9fe7e'}]->(node460)
  ON CREATE SET rel946 += {}
MERGE (node449)-[rel949:NODE_STYLE {uuid: '89b80da6-da35-4b9a-a43c-52a4024498d5'}]->(node463)
  ON CREATE SET rel949 += {}
MERGE (node449)-[rel941:NODE_STYLE {uuid: 'abe48310-9022-49b2-970d-3c824b956d0b'}]->(node455)
  ON CREATE SET rel941 += {}
MERGE (node449)-[rel939:DEFAULT_REL_STYLE {uuid: 'f91fad6a-5e95-4ef8-bbfc-30d97cb32cfb'}]->(node453)
  ON CREATE SET rel939 += {}
MERGE (node449)-[rel945:REL_STYLE {uuid: '0e4f445d-3170-43e9-8485-a55cf585e074'}]->(node459)
  ON CREATE SET rel945 += {}
MERGE (node449)-[rel950:NODE_STYLE {uuid: '15be4606-5cd9-4af5-840e-9fa3fa1e13c6'}]->(node464)
  ON CREATE SET rel950 += {}
MERGE (node449)-[rel944:DEFAULT_NODE_STYLE {uuid: '92d1da85-208d-4c82-90eb-77cd851a8854'}]->(node458)
  ON CREATE SET rel944 += {}
MERGE (node449)-[rel940:REL_STYLE {uuid: 'eeeebc65-47ed-4e7f-9479-ce847c4e0540'}]->(node454)
  ON CREATE SET rel940 += {}
MERGE (node449)-[rel948:NODE_STYLE {uuid: 'c62b003c-e74b-4164-9468-5fb1743a6eaf'}]->(node462)
  ON CREATE SET rel948 += {}
MERGE (node449)-[rel936:NODE_STYLE {uuid: '14f2b8fb-b883-4bd2-b2f0-74c15b5005c6'}]->(node450)
  ON CREATE SET rel936 += {}
MERGE (node449)-[rel938:REL_STYLE {uuid: 'fb92f09d-2a64-4c0b-b1a1-b1737fd77384'}]->(node452)
  ON CREATE SET rel938 += {}
MERGE (node451)-[rel967:FOR_NODE {uuid: 'da51d9eb-2aae-48a5-9c0a-47b5a361faea'}]->(node160)
  ON CREATE SET rel967 += {}
MERGE (node451)-[rel953:HAS_CAPTION {uuid: '4418834a-ede8-4415-8368-cfed129a5e9b'}]->(node27)
  ON CREATE SET rel953 += {}
MERGE (node456)-[rel966:FOR_NODE {uuid: '43d28d19-d723-4049-a11a-8519a2dca0b0'}]->(node121)
  ON CREATE SET rel966 += {}
MERGE (node457)-[rel968:FOR_REL {uuid: '4f23e2e1-fc8b-4e5a-b5c9-4ce618ae9d27'}]->(node165)
  ON CREATE SET rel968 += {}
MERGE (node457)-[rel969:FOR_REL {uuid: 'a4622fdb-374c-441b-8bda-6c8123b598b5'}]->(node167)
  ON CREATE SET rel969 += {}
MERGE (node460)-[rel971:HAS_CAPTION {uuid: 'ad0c18f7-911b-4098-bb60-9e3733c4fd4b'}]->(node27)
  ON CREATE SET rel971 += {}
MERGE (node460)-[rel972:FOR_NODE {uuid: '6e982e8e-6930-4a7e-99d0-1ae7868a5e0f'}]->(node162)
  ON CREATE SET rel972 += {}
MERGE (node463)-[rel977:HAS_CAPTION {uuid: '7711d5a7-58cc-4f7e-8ab0-e9b606cf29d3'}]->(node127)
  ON CREATE SET rel977 += {}
MERGE (node463)-[rel1029:FOR_NODE {uuid: '6e25df6b-dfa8-42c0-a82a-ef8261da80ca'}]->(node155)
  ON CREATE SET rel1029 += {}
MERGE (node455)-[rel963:FOR_NODE {uuid: '0b3a262e-1855-402a-b4c1-205455d6bf43'}]->(node122)
  ON CREATE SET rel963 += {}
MERGE (node455)-[rel965:HAS_CAPTION {uuid: '5134cdcd-5b81-4145-b524-bd7457c2bd35'}]->(node27)
  ON CREATE SET rel965 += {}
MERGE (node459)-[rel970:FOR_REL {uuid: 'd17b824a-33bf-46c6-8d3e-8cc6538037b3'}]->(node164)
  ON CREATE SET rel970 += {}
MERGE (node464)-[rel980:HAS_CAPTION {uuid: 'c13fa182-6819-44a8-8ed7-b9aee17d754c'}]->(node27)
  ON CREATE SET rel980 += {}
MERGE (node464)-[rel979:FOR_NODE {uuid: '679c531d-aca9-4219-948f-57d7ade8e3b5'}]->(node149)
  ON CREATE SET rel979 += {}
MERGE (node464)-[rel981:FOR_NODE {uuid: '679c531d-aca9-4219-948f-57d7ade8e3b5'}]->(node150)
  ON CREATE SET rel981 += {}
MERGE (node454)-[rel1040:FOR_REL {uuid: 'fe77bb48-c9f2-44f4-a853-e3a3f5be5fac'}]->(node171)
  ON CREATE SET rel1040 += {}
MERGE (node454)-[rel959:FOR_REL {uuid: 'f9916ea1-208c-4e0d-86c9-abc2186c8201'}]->(node142)
  ON CREATE SET rel959 += {}
MERGE (node454)-[rel960:FOR_REL {uuid: 'f9916ea1-208c-4e0d-86c9-abc2186c8201'}]->(node171)
  ON CREATE SET rel960 += {}
MERGE (node454)-[rel961:FOR_REL {uuid: 'e283a4b3-7e23-4ec7-9741-c4857365f11b'}]->(node138)
  ON CREATE SET rel961 += {}
MERGE (node454)-[rel962:FOR_REL {uuid: 'e283a4b3-7e23-4ec7-9741-c4857365f11b'}]->(node170)
  ON CREATE SET rel962 += {}
MERGE (node462)-[rel974:FOR_NODE {uuid: '5cea6d6a-d521-4d21-bb7e-69e9b8b1451d'}]->(node123)
  ON CREATE SET rel974 += {}
MERGE (node462)-[rel975:HAS_CAPTION {uuid: 'dd6c32c5-212f-47e9-affe-4f4d9b20d488'}]->(node27)
  ON CREATE SET rel975 += {}
MERGE (node450)-[rel951:HAS_CAPTION {uuid: 'db387c1c-ad4d-48cc-9f7b-64c6060bb208'}]->(node27)
  ON CREATE SET rel951 += {}
MERGE (node450)-[rel952:FOR_NODE {uuid: '1a0662f6-cf9e-4bec-bb00-272839fccb0f'}]->(node158)
  ON CREATE SET rel952 += {}
MERGE (node452)-[rel958:FOR_REL {uuid: 'cc511db3-1426-4bff-a62d-629fa2a674fc'}]->(node137)
  ON CREATE SET rel958 += {}
MERGE (node452)-[rel955:FOR_REL {uuid: 'a25267b0-0b9c-4ff9-8015-8bbbd29708e9'}]->(node136)
  ON CREATE SET rel955 += {}
MERGE (node452)-[rel957:FOR_REL {uuid: 'cc511db3-1426-4bff-a62d-629fa2a674fc'}]->(node136)
  ON CREATE SET rel957 += {}
MERGE (node452)-[rel956:FOR_REL {uuid: 'a25267b0-0b9c-4ff9-8015-8bbbd29708e9'}]->(node137)
  ON CREATE SET rel956 += {};