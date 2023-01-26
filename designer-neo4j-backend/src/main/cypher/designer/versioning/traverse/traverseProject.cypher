/*
@name designer.traverse.traverseProject

@mode read
@input project, NODE

@output nodes, LIST OF NODE
@output relationships, LIST OF RELATIONSHIP
@output dependantNodes, LIST OF NODE
*/

WITH $project AS project

CALL apoc.log.debug("[designer.traverse.traverseProject] Traverse Project with uuid %s and name %s", [project.uuid, project.name])

OPTIONAL MATCH (project)-[hasView:HAS_VIEW]->(view:View)

WITH project,
     collect(hasView) AS hasViews,
     collect(view) AS views

RETURN [project] AS nodes,
       hasViews AS relationships,
       views AS dependantNodes