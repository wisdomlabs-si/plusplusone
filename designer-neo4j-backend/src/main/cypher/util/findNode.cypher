/*
@name util.findNode

@mode read
@input uuid, STRING

@return NODE
*/

WITH 'MATCH (graphObject {uuid: $uuid}) RETURN graphObject' AS query
CALL apoc.cypher.run(query, {uuid: $uuid}) YIELD value
WITH value.graphObject AS node return node;
