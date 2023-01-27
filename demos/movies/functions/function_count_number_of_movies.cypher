 MATCH (node540:_Identifiable {uuid: "88b91724-f289-4863-8b59-0d9e17f4306f"})
 MATCH (node1730:_Identifiable {uuid: "d9dc6fc0-cccf-3bff-a670-6446f210fa60"})
 MATCH (node1728:_Identifiable {uuid: "36f1848e-970d-4349-940a-199bfbff5fff"})
 MATCH (node541:_Identifiable {uuid: "1cce97e7-3a88-4938-a2fa-c94509d2407d"})
 MATCH (node1729:_Identifiable {uuid: "7607113d-14d7-3a14-86a4-1cca984ec5e6"})
                MERGE (node596:_Identifiable {uuid: "9130d126-60d2-4603-9750-8466165fdffb"})
                ON CREATE SET node596:Function
                ON CREATE SET node596 += {name: "Count number of movies"}
                MERGE (node599:_Identifiable {uuid: "7ff2b3c9-caee-480d-bca9-dd3eba809719"})
                ON CREATE SET node599:Output
                ON CREATE SET node599 += {name: "numberOfMovies", type: "integer"}
                MERGE (node597:_Identifiable {uuid: "ef3e4050-3391-4343-b156-31453acb4ae1"})
                ON CREATE SET node597:Map
                ON CREATE SET node597 += {}
                MERGE (node600:_Identifiable {uuid: "204de9b8-d927-4196-a096-788bbc171d12"})
                ON CREATE SET node600:Reduce
                ON CREATE SET node600 += {}
                MERGE (node598:_Identifiable {uuid: "ac35200c-6908-4a1d-bf07-78e2c214c4af"})
                ON CREATE SET node598:Match
                ON CREATE SET node598 += {optional: false}
                MERGE (node603:_Identifiable {uuid: "f53ce6f7-96cf-4e46-bf37-cbb7af43053e"})
                ON CREATE SET node603:Binding
                ON CREATE SET node603 += {}
                MERGE (node601:_Identifiable {uuid: "86f3d6c9-36f3-4a03-80fc-f316670b270b"})
                ON CREATE SET node601:Aggregation
                ON CREATE SET node601 += {}
                MERGE (node602:_Identifiable {uuid: "452cdae5-e1ea-427f-8c60-91600d26e710"})
                ON CREATE SET node602:Binding
                ON CREATE SET node602 += {}
MERGE (node596)-[rel4736: IMPLEMENTED {uuid: "96064202-51a3-434f-8777-64f0ec35e4cf"}]->(node597)
ON CREATE SET rel4736 += {}
MERGE (node597)-[rel4745: NEXT {uuid: "0f1ffed3-0c53-47b2-9fd2-592c94f37f2c"}]->(node600)
ON CREATE SET rel4745 += {}
MERGE (node597)-[rel4738: EXECUTES {uuid: "948ad2d7-e6dc-4607-87fb-68a97fa719b7"}]->(node598)
ON CREATE SET rel4738 += {}
MERGE (node600)-[rel4758: HAS_OUTPUT_BINDING {uuid: "bdf9c03d-75e4-4a97-91c9-54c744f0a7c7"}]->(node603)
ON CREATE SET rel4758 += {}
MERGE (node600)-[rel4747: EXECUTES {uuid: "d5a5bda1-3e09-4fd1-a375-ccfe66a73d6e"}]->(node601)
ON CREATE SET rel4747 += {}
MERGE (node598)-[rel4741: USING {uuid: "cffbb629-5855-436e-8713-0865efea85f0"}]->(node540)
ON CREATE SET rel4741 += {}
MERGE (node603)-[rel4762: BINDS_TO {uuid: "c497ef77-2fcb-48ba-9012-5a458ab4db9f"}]->(node599)
ON CREATE SET rel4762 += {}
MERGE (node603)-[rel4761: BINDS_FROM {uuid: "f5741f8b-765f-4516-9938-cd10cc019bd9"}]->(node1730)
ON CREATE SET rel4761 += {}
MERGE (node603)-[rel4760: SCOPED {uuid: "e3a4e109-0275-4fb8-89b3-ef3d6ed1e4fb"}]->(node601)
ON CREATE SET rel4760 += {}
MERGE (node601)-[rel4751: HAS_BINDING {uuid: "3d4e5695-c4f3-45b5-a925-668df7f622b0"}]->(node602)
ON CREATE SET rel4751 += {}
MERGE (node601)-[rel4750: USING {uuid: "ce5605ea-ed16-4728-a39e-43286fbe79c4"}]->(node1728)
ON CREATE SET rel4750 += {}
MERGE (node602)-[rel4757: BINDS_TO {uuid: "dcb78337-ae1e-49ff-ab86-4906576def9d"}]->(node1729)
ON CREATE SET rel4757 += {}
MERGE (node602)-[rel4756: BINDS_FROM {uuid: "af3cf83d-4f51-4a5c-bc93-178296aa0159"}]->(node541)
ON CREATE SET rel4756 += {}
MERGE (node602)-[rel4753: SCOPED {uuid: "38846f81-9637-47c9-88d0-09e7ce088c5d"}]->(node598)
ON CREATE SET rel4753 += {}
MERGE (node1728)-[rel3618: HAS_INPUT {uuid: "2460319c-8dd2-311f-9560-55973cf15778"}]->(node1729)
ON CREATE SET rel3618 += {}
MERGE (node1728)-[rel3619: HAS_OUTPUT {uuid: "5c8d813d-4497-3837-a778-3bbcf66abf8b"}]->(node1730)
ON CREATE SET rel3619 += {}
MERGE (node596)-[rel4743: HAS_OUTPUT {uuid: "f6d94ab6-ae21-4841-aa74-5d5187e0fdb0"}]->(node599)
ON CREATE SET rel4743 += {}
