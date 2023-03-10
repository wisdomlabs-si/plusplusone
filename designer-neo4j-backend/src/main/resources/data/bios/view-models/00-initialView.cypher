MATCH path1 = (`263`:NodeDef {name: "Project", uuid: "e045565c-a449-42f2-ac15-e85f9c51f6da"})-[:HAS_TYPE]->(`266`:Type {name: "Named", uuid: "73c199cd-87ee-478d-86bb-61e85e67e371"}),
path2 = (`145`:Metagraph {name: "Graphview", uuid: "6d897e9c-066a-45b4-a3a2-6c3b7a2fa73e"})-[:DEFINES]->(`196`:NodeDef {name: "View", uuid: "b30e0e28-9b6c-4393-8d41-3f5f31664cec"}),
path3 = (`112`:Metagraph {name: "Meta", uuid: "d9262ce3-7847-4263-aa18-a27bcdc1f642"})-[:DEFINES]->(`116`:NodeDef {name: "Metagraph", uuid: "c130660a-4718-4136-8ed6-c8abd4556443"}),
path4 = (`116`)-[:HAS_TYPE]->(`266`),
path5 = (`266`)-[:HAS_PROPERTY]->(`194`:Property {name: "name", type: "String"}),
path6 = (`196`)-[:HAS_TYPE]->(`266`),
path7 = (`198`:NodeDef {name: "Functionality"})-[:HAS_TYPE]->(`266`),
path8 = (`200`:NodeDef {name: "Style"})-[:HAS_TYPE]->(`266`),
path9 = (`145`)-[:DEFINES]->(`200`),
path10 = (`145`)-[:DEFINES]->(`198`),
path11 = (`145`)-[:DEFINES]->(`263`),
path12 = (`112`)-[:DEFINES]->(`266`),
path13 = (`284`:Function {name: "run cypher file", uuid: "7b098148-d426-4bd5-88ef-61c8457af5ac"})-[:HAS_INPUT]->(`285`:Input {name: "fileName"})
CREATE (`82`:View:_Identifiable {name: "Home", uuid: "760ca33f-6251-3687-af51-2b2f3ec58aab"}),
(`84`:Project:_Identifiable {name: "Bios", uuid: "ba24ed50-0d89-3d9b-b7a6-4891381ed019"}),
(`86`:Style:_Identifiable {name: "Bios", uuid: "70f7fab0-5ae7-36e6-a07d-b3ec8fcd2c65"}),
(`87`:Functionality:_Identifiable {name: "Bios", uuid: "cf56b57f-1923-35cb-afa9-7ba2b6f812b3"}),
(`88`:RelStyle:_Identifiable {color: "#808080", lineStyle: "dashed", lineWidth: "1", uuid: "e91f9d3f-ac2c-3042-85af-79a410360f97"}),
(`89`:NodeStyle:_Identifiable {color: "#808080", icon: "question-mark-circle", size: "60", uuid: "f2e4c24e-9b6f-3658-a17c-a7136ed9d959"}),
(`94`:NodeStyle:_Identifiable {color: "#8338ec", size: "120", icon: "globe-alt", uuid: "26a44aed-4336-3d64-a1a3-d22fb2de2ecd"}),
(`106`:Function:_Identifiable {name: "List metagraphs, styles, functionalities", uuid: "2cdfc7d9-98a5-382d-97e2-d371a984b8af"}),
(`107`:NativeCall:_Identifiable {cypher: 'MATCH (node) WHERE node:Project OR node:Style OR node:Functionality OR node:View OR node:Metagraph RETURN node', uuid: "c637374d-dd67-3040-850d-8137f30e040b"}),
(`156`:Output:_Identifiable {name: "node", uuid: "58221f48-1ab6-33e9-9400-2efca2d93849"}),
(`189`:NodeStyle:_Identifiable {color: "#ffbe0b", size: "80", icon: "calculator", uuid: "93cc0aea-b243-31a7-badd-8ed96301c16b"}),
(`191`:NodeStyle:_Identifiable {color: "#ff006e", size: "120", icon: "presentation-chart-bar", uuid: "ca76b998-ea5d-3d0e-857f-dec97f3569a9"}),
(`260`:NodeStyle:_Identifiable {color: "#ade8f4", size: "120", icon: "archive", uuid: "14f614fa-a396-3a09-b4a8-a83879175ed7"}),
(`268`:Action:_Identifiable {name: "Run Cypher File", group: "I/O", icon: "cloud-upload", updateStrategy: "ignore", uuid: "92c3ca87-6eed-340a-b08b-68237a42a7ec"}),
(`269`:ActionParameter:_Identifiable {name: "fileName", uuid: "77a0e510-30a3-3314-b2f3-e41cf47aa1ad"}),
(`271`:Widget:_Identifiable {type: "textField", uuid: "2eed319c-bb3f-39b2-8ee1-bdf5b86185b0"}),
(`286`:NodeStyle:_Identifiable {color: "#5a8de0", size: "80", icon: "color-swatch", uuid: "1e20c3e0-26c6-3bdc-a078-0910861ded4f"}),
(`82`)-[:HAS_STYLE {uuid: "08da83e7-0d5f-31c8-bc3c-20a23a6aaf62"}]->(`86`),
(`82`)-[:HAS_FUNCTIONALITY {uuid: "d555857d-a260-3c76-bf2c-07aaadb03a7d"}]->(`87`),
(`84`)-[:HAS_VIEW {uuid: "911a7ea3-e679-37b5-bd23-115c748a18ac"}]->(`82`),
(`86`)-[:NODE_STYLE {uuid: "b520da8a-ac3c-36d5-b9a5-954c0e70da9f"}]->(`191`),
(`86`)-[:NODE_STYLE {uuid: "24a8ed68-1119-3933-b9e6-726bc74c0ec8"}]->(`189`),
(`86`)-[:NODE_STYLE {uuid: "d7fe4fec-31f7-380b-9cdd-048e92271ced"}]->(`260`),
(`86`)-[:NODE_STYLE {uuid: "7afb592f-9122-3ca7-96c6-437c8fd41da3"}]->(`286`),
(`87`)-[:HAS_ACTION {uuid: "6d779f73-dc55-3098-8688-7925fc7fbb57"}]->(`268`),
(`87`)-[:AUTOGENERATED_FROM {uuid: "92519c16-2844-32ba-a27b-01cd93dff097"}]->(`112`),
(`86`)-[:DEFAULT_NODE_STYLE {uuid: "56fb760b-1751-3aa1-8382-013086d39ec0"}]->(`89`),
(`87`)-[:AUTOGENERATED_FROM {uuid: "2fb2b94a-4a2c-312b-8f67-fb2e508a2a3d"}]->(`145`),
(`86`)-[:NODE_STYLE {uuid: "9b36ab9d-bb02-3a9d-8d51-e0a1ba7f3eac"}]->(`94`),
(`94`)-[:FOR_NODE {uuid: "ea05a217-bd1a-379f-8602-f90c815aebaf"}]->(`116`),
(`86`)-[:DEFAULT_REL_STYLE {uuid: "1c4ea8e9-0560-3676-8241-b7d63812fb34"}]->(`88`),
(`82`)-[:QUERIES_WITH {uuid: "70d21aaa-79a3-3e15-8421-e760bdb06eff"}]->(`106`),
(`106`)-[:IMPLEMENTED {uuid: "0989d7a9-96c7-35de-b62f-b5eb97a074be"}]->(`107`),
(`94`)-[:HAS_CAPTION {uuid: "2bd5a144-436a-3558-984a-bea6625bb5f6"}]->(`194`),
(`106`)-[:HAS_OUTPUT {uuid: "9ecc56a5-d3eb-3e44-b7dd-af91525414ff"}]->(`156`),
(`189`)-[:FOR_NODE {uuid: "918e22f1-940b-3b68-8070-f94c29e6d7ad"}]->(`198`),
(`191`)-[:FOR_NODE {uuid: "fab8f7e5-9d9a-3962-a4fd-f565b127fc00"}]->(`196`),
(`191`)-[:HAS_CAPTION {uuid: "9a2cbce9-f6d0-3a55-a90a-5d58b02a6ae3"}]->(`194`),
(`260`)-[:FOR_NODE {uuid: "b1f94951-afc1-3f3f-bfb1-a318b767df05"}]->(`263`),
(`260`)-[:HAS_CAPTION {uuid: "7d6683ee-2430-38e0-8199-81636e2c2887"}]->(`194`),
(`268`)-[:WITH_PARAMETER {uuid: "ee143c63-9c52-3470-9a14-be90007e58da"}]->(`269`),
(`268`)-[:EXECUTES {uuid: "59a3728a-e317-3d75-a4c1-67ef49bf05aa"}]->(`284`),
(`269`)-[:RENDERED_WITH {uuid: "e6475f22-dc46-38d2-a5c9-04a64bc39e52"}]->(`271`),
(`269`)-[:PROVIDES_VALUE {uuid: "203e4576-e9e6-3a99-b94e-5b9d21ef0e1e"}]->(`285`),
(`286`)-[:FOR_NODE {uuid: "ff3963ea-079b-3981-98b5-bce139aa79c0"}]->(`200`),
(`286`)-[:HAS_CAPTION {uuid: "62cc374a-4fd9-3323-979c-8051e38ffaa8"}]->(`194`)
RETURN *