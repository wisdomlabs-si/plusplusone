// create meta graph
MERGE (metagraph:Metagraph {name: 'Northwind'})
MERGE (identifiable:Type {name: 'Identifiable'})
MERGE (anyNode:AbstractNodeDef {name: 'Any'})

WITH metagraph, identifiable, anyNode
CALL apoc.meta.subGraph({includeLabels: ['Category', 'Customer', 'Employee', 'Order', 'Product',
                                          'Supplier']}) YIELD nodes, relationships

WITH metagraph,
     identifiable,
     anyNode,
     nodes, relationships

FOREACH (node IN nodes |
  MERGE (nodeDef:NodeDef {name: apoc.any.property(node,'name')})
  MERGE (nodeType:Type {name: apoc.any.property(node,'name')})
  MERGE (nodeDef)-[:HAS_TYPE]->(nodeType)
  MERGE (nodeDef)-[:SUBCLASS_OF]->(anyNode)
  MERGE (metagraph)-[:DEFINES]->(nodeDef)
  MERGE (metagraph)-[:DEFINES]->(nodeType)
)

FOREACH (relationship IN relationships |
  MERGE (relDef:RelDef {name: apoc.any.property(relationship,'type')})
  MERGE (relType:Type {name: apoc.any.property(relationship,'type')})
  MERGE (relDef)-[:HAS_TYPE]->(relType)
  MERGE (relDef)-[:HAS_TYPE]->(identifiable)

  MERGE (metagraph)-[:DEFINES]->(relDef)
  MERGE (metagraph)-[:DEFINES]->(relType)

  MERGE (startNodeDef:NodeDef {name: apoc.any.property(startNode(relationship),'name')})
  MERGE (endNodeDef:NodeDef {name: apoc.any.property(endNode(relationship),'name')})

  MERGE (startNodeDef)<-[:REL_SOURCE]-(relDef)
  MERGE (endNodeDef)<-[:REL_TARGET]-(relDef)
)

WITH COUNT(*) AS _

CALL apoc.meta.nodeTypeProperties() YIELD nodeLabels, propertyName, propertyTypes
WITH nodeLabels[0] AS nodeType, propertyName, propertyTypes[0] AS propertyType
  WHERE NOT propertyName='uuid'

MERGE (type:Type {name: nodeType})
MERGE (type)-[:HAS_PROPERTY]->(property:Property {name: propertyName})
  ON CREATE SET property.type = propertyType

WITH COUNT(*) AS _
CALL apoc.meta.relTypeProperties() YIELD relType, propertyName, propertyTypes
WITH substring(replace(relType,'`',''),1) AS relationshipType, propertyName, propertyTypes[0] AS propertyType
  WHERE NOT propertyName='uuid'

MERGE (type:Type {name: relationshipType})
MERGE (type)-[:HAS_PROPERTY]->(property:Property {name: propertyName})
  ON CREATE SET property.type = propertyType;
