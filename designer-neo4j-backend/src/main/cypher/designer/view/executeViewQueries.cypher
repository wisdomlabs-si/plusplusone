/*
@name designer.view.executeViewQueries

@mode read
@input view, NODE

@output nodes, LIST OF NODE
@output relationships, LIST OF REL
*/

WITH $view AS view

CALL {
    WITH view
    MATCH (view)-[:QUERIES_WITH]->(function:Function)
    CALL custom.tnt.executeReadFunction(function, {}) YIELD value
    WITH collect(value) AS result
    CALL custom.designer.action.serialize.resultToNodesAndRelationships(result) YIELD nodes, relationships
    RETURN nodes, relationships
}
   
CALL {
    WITH view
    MATCH (view)-[vr:DISPLAY_NODE]->(viewedNode)
    RETURN collect({rel: vr, node: viewedNode}) AS displayTraversals
}

WITH nodes, relationships,
[dt IN displayTraversals WHERE dt.rel.visible = false | dt.node] AS hiddenNodes,
[dt IN displayTraversals WHERE dt.rel.visible <> false | dt.node] AS visibleNodes
WITH apoc.coll.toSet(apoc.coll.removeAll(nodes, hiddenNodes) + visibleNodes) AS retNodes, relationships

CALL {
        WITH retNodes
        UNWIND retNodes AS viewedNode
        MATCH (viewedNode)-[viewedRel]-(otherViewedNode)
            WHERE NOT viewedRel:DISPLAY_NODE AND otherViewedNode IN retNodes
        RETURN collect(viewedRel) AS vrels
}
WITH retNodes, relationships, vrels
WITH retNodes, apoc.coll.toSet(relationships + vrels) AS retRels
RETURN retNodes AS nodes, retRels AS relationships;
