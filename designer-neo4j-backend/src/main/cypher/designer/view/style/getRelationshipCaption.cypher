/*
@name designer.view.style.getRelationshipCaption

@mode read

@input view, NODE
@input relation, REL

@return STRING
*/

WITH $view AS view,
     $relation AS relation

WITH view, relation, custom.util.graphObjectType(relation) AS relType

OPTIONAL MATCH (view)-[:HAS_STYLE]->(:Style)-[:REL_STYLE]->(:RelStyle)-[:HAS_CAPTION]->
                (property:Property)<-[:HAS_PROPERTY]-(:Type)<-[:HAS_TYPE]-(:RelDef {name: relType})

RETURN CASE WHEN property IS NULL THEN relType
         ELSE properties(relation)[property.name]
         END;



