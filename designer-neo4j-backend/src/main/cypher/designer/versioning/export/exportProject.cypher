/*
@name designer.export.exportProject

@input project, NODE

@return STRING
*/

WITH $project AS project

CALL apoc.log.debug("[designer.export.exportProject] Exporting Project with uuid %s and name %s", [project.uuid, project.name])

OPTIONAL MATCH (project)-[hasView:HAS_VIEW]->(view:View)

WITH project,
     collect(hasView) AS hasViews,
     collect(view) AS views

CALL {
      WITH project,
           views

      WITH custom.util.toSnakeCase(project.name) AS projectName,
           views

      UNWIND range(1, size(views)) AS index
      WITH projectName, index, views[index - 1] AS view
      WITH custom.designer.export.exportView(view) AS cypher
      RETURN count(*) AS _
}

WITH project,
     views AS dependantNodes,
     [project] AS nodes,
     hasViews AS relationships,
     count(*) AS _

RETURN tnt.export.toCypher("/import/project_" + custom.util.toSnakeCase(project.name) + ".cypher", dependantNodes, nodes, relationships);