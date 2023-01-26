/*
@name v9.designer.import.importMetagraph

@mode write
@input metagraph, NODE
@input version, INTEGER
@input metagraphFile, STRING
@input refactoringFile, STRING

@output metagraph, NODE
@output message, STRING
@output reason, STRING
*/

WITH $metagraph AS metagraph,
     $version  AS version,
     $metagraphFile AS metagraphFile,
     $refactoringFile AS refactoringFile

CALL {
    WITH metagraph, version
    WITH NOT version - metagraph.version = 1 AS versionDifferenceIsNot1
    CALL apoc.log.debug("[v3.designer.import.importMetagraph] Validating version difference.")
    CALL apoc.util.validate(versionDifferenceIsNot1, "Metagraph version is not correct. You can only update/import metagraph by one version.", [])
    RETURN count(*) AS _
}

// traverse current metagraph and set `_Deprecated` label
CALL custom.designer.traverse.traverseMetagraph(metagraph) YIELD nodes

CALL {
    // mark previous nodes as deprecated
    WITH nodes
    CALL apoc.log.debug("[v3.designer.import.importMetagraph] Tagging  previous nodes as deprecated.")
    UNWIND nodes AS node
    WITH node
      WHERE NOT node:Metagraph
    SET node:_Deprecated
}

WITH metagraph, version, metagraphFile, refactoringFile
CALL {
    // change version of metagraph to 2
    // set previous version
    // import new version of metagraph
    WITH metagraph, version, metagraphFile
    WITH metagraph, version, metagraphFile
    SET metagraph += {version: version, status: 'migrating', previousVersion: version - 1}

    WITH metagraph, metagraphFile
      WHERE NOT metagraphFile  = ""
    WITH *
    CALL apoc.log.debug("[v3.designer.import.importMetagraph] Importing newer version of metagraph.")
    CALL apoc.cypher.runFile("file:///" + metagraphFile) YIELD result
    RETURN count(*) AS _

}
// TODO: run data migration scripts
CALL apoc.log.debug("[v3.designer.import.importMetagraph] Running migration scripts.")


// traverse the combined metagraph and check if there are any deprecated nodes left
CALL custom.designer.traverse.traverseMetagraph(metagraph) YIELD nodes AS newNodes, relationships AS newRelationships

WITH metagraph AS metagraphNode, newNodes
CALL {
    WITH metagraphNode, newNodes
    WITH metagraphNode, newNodes

    // there are no deprecated nodes left  update status of metagraph
    WHERE NOT any(node IN newNodes WHERE node:_Deprecated)
    WITH metagraphNode
    SET metagraphNode.status='current'
    RETURN metagraphNode AS metagraph,
           'Metagraph succesfully updated to newer version' AS message,
            [] AS reason

    UNION

    WITH metagraphNode, newNodes
    WITH metagraphNode, newNodes

    // there are still some deprecated nodes left
    WHERE any(node IN newNodes WHERE node:_Deprecated)
    WITH metagraphNode, newNodes
    RETURN metagraphNode AS metagraph,
           'Metagraph failed to update to newer version' AS message,
            [node IN newNodes WHERE node:_Deprecated | node] AS reason
    }

RETURN metagraph, message, reason;