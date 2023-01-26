// allow chaining ReduceStep with NEXT relationship
MATCH (mgComputation:Metagraph:_Identifiable {name: "Computation", uuid: "2377b64e-6d8b-4837-bee6-dd59f1330251"})
MATCH (ndReduceStep:NodeDef:_Identifiable {name: "Reduce", uuid: "66aed9a2-eebc-33c3-8234-8de5afe759df"})
MATCH (tNext:Type:_Identifiable {name: "NEXT", uuid: "c967cae8-f7f4-36d4-9d4f-5281b9413a9c"})
MATCH (rStyle:RelStyle:_Identifiable {uuid: "33ae9d91-da48-4f05-95b0-f4473158d591"})

MERGE (rdSelfNext:RelDef:_Identifiable {name: "NEXT", uuid: "64df5d4e-5ef5-49f9-810e-c8ad71568933"})
MERGE (rdSelfNext)-[:HAS_TYPE {uuid: "dd65a3c0-9fac-4cbd-97d4-bcd4022d8036"}]->(tNext)
MERGE (rdSelfNext)-[:REL_SOURCE {uuid: "f7a7f49d-d902-4ad8-b797-31d2f520b894"}]->(ndReduceStep)
MERGE (rdSelfNext)-[:REL_TARGET {uuid: "91a5afee-98e5-4780-9101-685f97d775dd"}]->(ndReduceStep)
MERGE (mgComputation)-[:DEFINES {uuid: "738c2aab-42fd-4884-ac46-afc3e0f9b981"}]->(rdSelfNext)
MERGE (rStyle)-[:FOR_REL {uuid: "00c561d8-6627-4551-8049-aa32a1826517"}]->(rdSelfNext);

// correct Var to subclass ValueSource instead of ValueTarget
MATCH (ndVar:NodeDef:_Identifiable {name: "Var", uuid: "c1d9a14b-43a3-3833-8df2-bc4d197cabbb"})
MATCH (ndVar)-[rSubclass:SUBCLASS_OF {uuid: "002115dc-73f8-3e65-b556-8eae629000cf"}]->()
MATCH (andValSrc:AbstractNodeDef:_Identifiable {name: "ValueSource", uuid: "9075479a-0b65-32a9-92f1-a7ded9bb6524"})
MERGE (ndVar)-[:SUBCLASS_OF {uuid: "6538f0b2-cee3-4d11-95fc-027976ca93a4"}]->(andValSrc)
DELETE rSubclass;

// add type to Constant
MATCH (nodeDefinition_Constant:NodeDef:_Identifiable {name: 'Constant', uuid: '4a26e6f9-676e-35f0-b72c-9f6af1aaefb1'})
MATCH (type_Typed:Type:_Identifiable {name: 'Typed', uuid: '19d03562-b92d-4754-a84a-961ec8f4023c'})
MERGE (nodeDefinition_Constant)-[:HAS_TYPE {uuid: 'ab2bc63c-1b8e-4ef0-87b5-a39ada21d89f'}]->(type_Typed);

// generic update
CALL apoc.cypher.runFile("file:///main/bios/connectAllNodeDefToAny.cypher") YIELD result
WITH count(result) AS _;
