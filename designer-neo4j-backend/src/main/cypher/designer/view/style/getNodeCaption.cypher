/*
@name designer.view.style.getNodeCaption

@mode read

@input view, NODE
@input node, NODE

@return STRING
*/

WITH $view AS view,
     $node AS node

WITH view, node, custom.util.graphObjectType(node) AS nodeType

OPTIONAL MATCH (view)-[:HAS_STYLE]->(:Style)-[:NODE_STYLE]->(:NodeStyle)-[:HAS_CAPTION]->
                (property:Property)<-[:HAS_PROPERTY]-(:Type)<-[:HAS_TYPE]-(nd)<-[:SUBCLASS_OF*0..]-(:NodeDef {name: nodeType})
WHERE nd:AbstractNodeDef OR nd:NodeDef
RETURN CASE WHEN property IS NULL THEN nodeType
         ELSE properties(node)[property.name]
         END;



