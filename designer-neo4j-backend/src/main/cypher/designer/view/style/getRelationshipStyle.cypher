/*
@name designer.view.style.getRelationshipStyle

@mode read

@input view, NODE
@input relationshipType, STRING

@return MAP
*/

WITH $view AS view,
     $relationshipType AS relationshipType

CALL {
      WITH view, relationshipType
      MATCH (view)-[:HAS_STYLE]->(:Style)-[:REL_STYLE]->(relStyle:RelStyle)-[:FOR_REL]->(:RelDef {name: relationshipType})
      RETURN relStyle.color AS color,
             relStyle.lineStyle AS lineStyle,
             relStyle.lineWidth AS lineWidth

      UNION

      WITH view
      MATCH (view)-[:HAS_STYLE]->(:Style)-[:DEFAULT_REL_STYLE]->(relStyle:RelStyle)
      RETURN relStyle.color AS color,
             relStyle.lineStyle AS lineStyle,
             relStyle.lineWidth AS lineWidth


      UNION

      RETURN "#808080" AS color,
             "solid" AS lineStyle,
             1 AS lineWidth
}

RETURN color, lineStyle, lineWidth LIMIT 1;

