MERGE (metagraph:Metagraph {name: "Northwind"})
ON CREATE SET metagraph.uuid = randomUUID()

WITH metagraph
CALL apoc.meta.nodeTypeProperties({includeLabels: ["Category", "Customer", "Order", "Employee", "Product", "Supplier"]}) YIELD nodeLabels, propertyName, propertyTypes

WITH metagraph, head(nodeLabels) AS nodeType, propertyName, head(propertyTypes) AS propertyType

MERGE (an:AbstractNodeDef {name: "Any"})
MERGE (nd:NodeDef {name: nodeType})
ON CREATE SET nd.uuid = randomUUID()

MERGE (metagraph)-[def_nd:DEFINES]->(nd)
ON CREATE SET def_nd.uuid = randomUUID()

MERGE (nd)-[sc:SUBCLASS_OF]->(an)
ON CREATE SET sc.uuid = randomUUID()

MERGE (nt:Type {name: nodeType})
ON CREATE SET nt.uuid = randomUUID()

MERGE (metagraph)-[def_nt:DEFINES]->(nt)
ON CREATE SET def_nt.uuid = randomUUID()

MERGE (nd)-[ht:HAS_TYPE]->(nt)
ON CREATE SET ht.uuid = randomUUID()

MERGE (nt)-[hp:HAS_PROPERTY]->(prop:Property {name: propertyName})
ON CREATE SET hp.uuid = randomUUID(), prop.uuid = randomUUID(), prop.type = toLower(propertyType);

MERGE (metagraph:Metagraph {name: "Northwind"})
MERGE (ident:Type {name: "Identifiable"})

WITH *
CALL apoc.meta.relTypeProperties({rels: ["ORDERS", "PART_OF", "PURCHASED", "REPORTS_TO", "SOLD", "SUPPLIES"]}) YIELD relType, sourceNodeLabels, targetNodeLabels, propertyName, propertyTypes
WHERE NOT propertyName = "uuid"
WITH ident, metagraph, replace(substring(relType, 2),"`","") AS relType, head(sourceNodeLabels) AS source, head(targetNodeLabels) AS target, propertyName, head(propertyTypes) AS propertyType

MERGE (relDef:RelDef {name: relType})
ON CREATE SET relDef.uuid = randomUUID()

MERGE (metagraph)-[defRd:DEFINES]->(relDef)
ON CREATE SET defRd.uuid = randomUUID()

MERGE (relDef)-[hi:HAS_TYPE]->(ident)
ON CREATE SET hi.uuid = randomUUID()

MERGE (sourceDef:NodeDef {name: source})
MERGE (targetDef: NodeDef {name: target})

MERGE (sourceDef)<-[rs:REL_SOURCE]-(relDef)
ON CREATE SET rs.uuid = randomUUID()

MERGE (relDef)-[rt:REL_TARGET]->(targetDef)
ON CREATE SET rt.uuid = randomUUID()

MERGE (rdtype:Type {name: relType})
ON CREATE SET rdtype.uuid = randomUUID()

MERGE (metagraph)-[deft:DEFINES]->(rdtype)
ON CREATE SET deft.uuid = randomUUID()

MERGE (rdtype)-[hp:HAS_PROPERTY]->(prop:Property {name: propertyName})
ON CREATE SET hp.uuid = randomUUID(), prop.uuid = randomUUID(), prop.type = toLower(propertyType)

MERGE (relDef)-[hasType:HAS_TYPE]->(rdtype)
ON CREATE SET hasType.uuid = randomUUID();





