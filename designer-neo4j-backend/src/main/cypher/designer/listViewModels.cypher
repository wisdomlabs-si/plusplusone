/*
@name designer.listViewModels

@mode read
@input params, STRING

@output result, STRING
*/
MATCH (project:Project)-[:HAS_VIEW]->(view:View)
WITH project, view ORDER BY project.name, view.name

WITH project, view

WITH {uuid: view.uuid, name: project.name + ' - ' + view.name  } AS viewMap

WITH collect(viewMap) as viewMaps

RETURN apoc.convert.toJson(viewMaps) AS result;
