/*
@name designer.traverse.traverseStyle

@mode read
@input style, NODE

@output nodes, LIST OF NODE
@output relationships, LIST OF RELATIONSHIP
@output dependantNodes, LIST OF NODE
*/

WITH $style AS style

CALL apoc.log.debug("[designer.traverse.traverseStyle] Traverse Style with uuid %s and name %s", [style.uuid, style.name])


CALL {
    WITH style
    MATCH (style)-[:DEFAULT_NODE_STYLE|DEFAULT_REL_STYLE|NODE_STYLE|REL_STYLE]->(styleNode)
      WHERE styleNode:NodeStyle OR styleNode:RelStyle
    RETURN styleNode
}

WITH style,
     collect(styleNode) AS nodes

CALL {
    WITH style
    MATCH (style)-[rel:DEFAULT_NODE_STYLE|DEFAULT_REL_STYLE|NODE_STYLE|REL_STYLE]->(styleNode)
      WHERE styleNode:NodeStyle OR styleNode:RelStyle
    RETURN rel

    UNION

    WITH style
    MATCH (style)-[:DEFAULT_NODE_STYLE|DEFAULT_REL_STYLE|NODE_STYLE|REL_STYLE]->(styleNode)-[rel:FOR_NODE|FOR_REL|HAS_CAPTION]->()
      WHERE styleNode:NodeStyle OR styleNode:RelStyle
    RETURN rel
}
WITH style,
     nodes,
     collect(rel) AS relationships

CALL {
    WITH style
    OPTIONAL MATCH (style)-[:DEFAULT_NODE_STYLE|DEFAULT_REL_STYLE|NODE_STYLE|REL_STYLE]->(styleNode)-[:FOR_NODE|FOR_REL|HAS_CAPTION]->(dependantNode)
      WHERE styleNode:NodeStyle OR styleNode:RelStyle
    RETURN dependantNode
}

RETURN  style + nodes AS nodes,
        relationships,
        collect(dependantNode) AS dependantNodes
