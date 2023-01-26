/*
@name designer.view.style.getNodeStyle

@mode read

@input view, NODE
@input nodeType, STRING

@return MAP
*/

WITH $view AS view,
      $nodeType AS nodeType

CALL {
      WITH view, nodeType
      MATCH (view)-[:HAS_STYLE]->(:Style)-[:NODE_STYLE]->(nodeStyle:NodeStyle)-[:FOR_NODE]->(:NodeDef {name: nodeType})
      RETURN nodeStyle.color AS color,
             nodeStyle.icon AS icon,
             nodeStyle.size AS size

      UNION

      WITH view
      MATCH (view)-[:HAS_STYLE]->(:Style)-[:DEFAULT_NODE_STYLE]->(nodeStyle:NodeStyle)
      RETURN nodeStyle.color AS color,
             nodeStyle.icon AS icon,
             nodeStyle.size AS size

      UNION

      RETURN "#7a7a7a" AS color,
             null AS icon,
             50 AS size
      }

RETURN color, icon, size LIMIT 1;

