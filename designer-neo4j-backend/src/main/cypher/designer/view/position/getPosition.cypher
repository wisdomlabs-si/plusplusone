/*
@name designer.view.position.getPosition

@mode read

@input view, NODE
@input node, NODE
@input generatePosition, MAP

@output position, MAP
*/

WITH $view AS view,
     $node AS node,
     $generatePosition AS generatePosition

WITH view, node,
CASE WHEN generatePosition IS NULL THEN {x: 0, y: 0, limitX: 1000, limitY: 1000}
ELSE generatePosition END AS genPos

OPTIONAL MATCH (view)-[position:DISPLAY_NODE]->(node)

RETURN CASE WHEN position IS NULL THEN {x: genPos.x + rand() * genPos.limitX - genPos.limitX / 2, y: genPos.y + rand() * genPos.limitY - genPos.limitY / 2, visible: true}
         ELSE {x: position.x, y: position.y, visible: position.visible}
         END AS position;
