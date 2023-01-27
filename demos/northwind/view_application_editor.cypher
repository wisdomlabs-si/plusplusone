 MATCH (node432:_Identifiable {uuid: "e5fbb66b-923a-44af-8478-a16fd109798a"})
 MATCH (node465:_Identifiable {uuid: "4d0bd949-4c74-4f8f-84e1-37ca8678a552"})
 MATCH (node452:_Identifiable {uuid: "f17fc242-b08d-436d-8fb0-29ae04b9a224"})
 MATCH (node707:_Identifiable {uuid: "5da2a7d2-273e-4386-89fb-2dc94dce9b1d"})
                MERGE (node1758:_Identifiable {uuid: "5a3a3449-c494-4c69-8006-5d00ec9a3cd4"})
                ON CREATE SET node1758:View
                ON CREATE SET node1758 += {name: "Application Editor"}
MERGE (node1758)-[rel5465: HAS_STYLE {uuid: "79020971-932b-4da6-8292-697c43f3f6e0"}]->(node432)
ON CREATE SET rel5465 += {}
MERGE (node1758)-[rel5464: HAS_STYLE {uuid: "9229f08a-68ab-4674-9759-3c761c9b751a"}]->(node465)
ON CREATE SET rel5464 += {}
MERGE (node1758)-[rel5463: HAS_STYLE {uuid: "0843c08e-62bb-48d9-97c9-62896ff4ec94"}]->(node452)
ON CREATE SET rel5463 += {}
MERGE (node1758)-[rel5462: HAS_FUNCTIONALITY {uuid: "96e0e507-b60a-48d9-8d57-66dc9602f40b"}]->(node707)
ON CREATE SET rel5462 += {}
