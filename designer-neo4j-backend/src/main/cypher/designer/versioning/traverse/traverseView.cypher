/*
@name designer.traverse.traverseView

@mode read
@input view, NODE

@output nodes, LIST OF NODE
@output relationships, LIST OF RELATIONSHIP
@output dependantNodes, LIST OF NODE
*/

WITH $view AS view

CALL apoc.log.debug("[designer.traverse.traverseView] Traverse View with uuid %s and name %s", [view.uuid, view.name])


OPTIONAL MATCH (view)-[hasStyle:HAS_STYLE]->(style:Style)
OPTIONAL MATCH (view)-[hasFunctionality:HAS_FUNCTIONALITY]->(functionality:Functionality)
OPTIONAL MATCH (view)-[queriesWith:QUERIES_WITH]->(job:Job)

WITH view,

     collect(hasStyle) AS hasStyles,
     collect(hasFunctionality) AS hasFunctionalities,
     collect(queriesWith) AS queriesWiths,

     collect(style) AS styles,
     collect(functionality) AS functionalities,
     collect(job) AS jobs


RETURN [view] AS nodes,
       hasStyles + hasFunctionalities + queriesWiths AS relationships,
       styles + functionalities + jobs AS dependantNodes