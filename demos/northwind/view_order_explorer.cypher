 MATCH (node694:_Identifiable {uuid: "07b64f9b-eb43-411c-b1d7-cf9617e0fb16"})
 MATCH (node708:_Identifiable {uuid: "f2244590-6ea6-4f8a-b013-96f1e764889d"})
                MERGE (node1754:_Identifiable {uuid: "a989fe4d-6f61-4ab2-b043-3ccd6adc8c45"})
                ON CREATE SET node1754:View
                ON CREATE SET node1754 += {name: "Order Explorer"}
MERGE (node1754)-[rel5429: HAS_STYLE {uuid: "e3afe040-e057-4fe0-9709-6bbdaa3160be"}]->(node694)
ON CREATE SET rel5429 += {}
MERGE (node1754)-[rel5430: HAS_FUNCTIONALITY {uuid: "0d847dd2-3913-4652-8a4a-0d72413425e4"}]->(node708)
ON CREATE SET rel5430 += {}
