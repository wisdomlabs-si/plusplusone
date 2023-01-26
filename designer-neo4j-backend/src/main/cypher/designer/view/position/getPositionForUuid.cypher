/*
@name designer.view.position.getPositionForUuid
@mode read

@input view, NODE
@input uuid, STRING
@forceSingle true

@return MAP
*/

WITH $view AS view,
     $uuid AS uuid

MATCH (node:_Identifiable {uuid: uuid})
CALL custom.designer.view.position.getPosition(view, node, null) YIELD position
RETURN position.x AS x, position.y AS y

UNION

RETURN 0 AS x, 0 AS y;
