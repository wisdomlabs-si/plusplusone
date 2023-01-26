/*
@name designer.export.exportView

@input view, NODE

@return STRING
*/

WITH $view AS view

CALL apoc.log.debug("[designer.export.exportView] Exporting View with uuid %s and name %s", [view.uuid, view.name])


OPTIONAL MATCH (view)-[hasStyle:HAS_STYLE]->(style:Style)
OPTIONAL MATCH (view)-[hasFunctionality:HAS_FUNCTIONALITY]->(functionality:Functionality)
OPTIONAL MATCH (view)-[queriesWith:QUERIES_WITH]->(function:Function)

WITH view,

     collect(hasStyle) AS hasStyles,
     collect(hasFunctionality) AS hasFunctionalities,
     collect(queriesWith) AS queriesWiths,

     collect(style) AS styles,
     collect(functionality) AS functionalities,
     collect(function) AS functions

CALL {
        WITH view,
             styles

        WITH custom.util.toSnakeCase(view.name) AS viewName,
            styles

        UNWIND range(1, size(styles)) AS index
        WITH viewName, index, styles[index - 1] AS style
        WITH custom.designer.export.exportStyle(style) AS cypher
        RETURN count(*) AS _

        UNION

        WITH view,
             functionalities

        WITH custom.util.toSnakeCase(view.name) AS viewName,
             functionalities

        UNWIND range(1, size(functionalities)) AS index
        WITH viewName, index, functionalities[index - 1] AS functionality
        WITH custom.designer.export.exportFunctionality(functionality) AS cypher
        RETURN count(*) AS _

        UNION

        WITH view,
             functions

        WITH custom.util.toSnakeCase(view.name) AS viewName,
             functions

        UNWIND range(1, size(functions)) AS index
        WITH viewName, index, functions[index - 1] AS function
        WITH custom.designer.export.exportFunction(function) AS cypher
        RETURN count(*) AS _
}

WITH view,
     styles + functionalities + functions AS dependantNodes,
     [view] AS nodes,
     hasStyles + hasFunctionalities + queriesWiths AS relationships,
     count(*) AS _

RETURN tnt.export.toCypher("/import/view_" + custom.util.toSnakeCase(view.name) + ".cypher", dependantNodes, nodes, relationships);