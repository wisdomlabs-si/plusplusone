/*
@name designer.action.serialize.resultToNodesAndRelationships

@mode read
@input result, LIST OF ANY

@output nodes, LIST OF NODE
@output relationships, LIST OF RELATIONSHIP
*/

// list of maps
WITH $result AS result

// list of flat maps
WITH [resultElement IN result | apoc.map.flatten(resultElement)] AS resultMaps

// list of list
WITH [resultMap IN resultMaps | custom.util.getMapValues(resultMap)] AS resultRows

// list of values
WITH apoc.coll.flatten(resultRows) AS allRows

RETURN apoc.coll.toSet([result IN allRows WHERE apoc.meta.isType(result, 'NODE') | result]) AS nodes,
       apoc.coll.toSet([result IN allRows WHERE apoc.meta.isType(result, 'RELATIONSHIP') | result]) AS relationships;
