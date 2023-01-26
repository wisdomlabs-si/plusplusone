/*
@name designer.view.position.setPosition

@mode write

@input view, NODE
@input node, NODE
@input x, NUMBER
@input y, NUMBER
@input visible, BOOLEAN

@output position, REL
*/

WITH $view AS view,
     $node AS node

CALL {
  WITH node, view
  MATCH (node)
    WHERE id(node) >= 0
  MERGE (view)-[position:DISPLAY_NODE]->(node)
  SET position.x = $x, position.y = $y, position.visible = $visible
  RETURN position

  UNION
  // this is needed for virtual nodes -> they have negative id and can't create rel to view
  WITH node, view
  MATCH (node)
    WHERE id(node) < 0
  RETURN null as position
}

RETURN position;
