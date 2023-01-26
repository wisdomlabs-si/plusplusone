/*
@name designer.action.serialize.serializeResult

@mode write

@input viewId, STRING
@input executionId, STRING
@input context, MAP
@input result, LIST OF MAP

@output result, MAP
*/

WITH $viewId AS viewId,
     $executionId AS executionId,
     $context AS context,
     $result AS result

CALL custom.designer.action.serialize.resultToNodesAndRelationships(result) YIELD nodes, relationships

WITH CASE WHEN result = [] OR result[0] IS NULL THEN {}
       ELSE result[0]
       END AS firstRow,
     nodes,
     relationships,
     executionId,
     viewId,
     context

WITH apoc.map.get(firstRow, 'statusCode', 0, false) AS statusCode,
     apoc.map.get(firstRow, 'message', '', false) AS message,
     apoc.map.get(firstRow, 'strategy', 'APPEND', false) AS strategy,
     nodes,
     relationships,
     executionId,
     viewId,
     context

CALL {
        WITH viewId, context, strategy, nodes, relationships
        MATCH (view:View:_Identifiable {uuid: viewId})
        CALL custom.designer.view.getViewsOfNodes(view, {strategy: strategy, selectionContext: context}, nodes) YIELD viewsOfNodes
        WITH viewsOfNodes, custom.designer.view.getViewsOfRelationships(view, relationships) AS viewOfRelationships
        RETURN viewsOfNodes, viewOfRelationships LIMIT 1

        UNION

        RETURN [] AS viewsOfNodes, [] AS viewOfRelationships
}

WITH statusCode, message, strategy,
     viewsOfNodes, viewOfRelationships,
     executionId AS actionExecUuid LIMIT 1

RETURN {
        statusCode: CASE WHEN statusCode IS NULL THEN 0
          ELSE statusCode
          END,
        message: CASE WHEN message IS NULL THEN ''
          ELSE message
          END,
        strategy: CASE WHEN strategy IS NULL THEN 'APPEND'
          ELSE strategy
          END,
        data: {nodes: viewsOfNodes,
               relationships: viewOfRelationships},
        actionExecUuid: actionExecUuid
        } AS result;
