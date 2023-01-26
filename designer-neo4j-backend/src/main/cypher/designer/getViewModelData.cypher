/*
@name designer.getViewModelData

@mode write
@input params, STRING

@output result, STRING
*/

WITH apoc.convert.fromJsonMap($params).params AS viewModelUuid
CALL apoc.log.info('[designer.getViewModelData] Retrieving data for view model: %s', [$params])

MATCH (view:View {uuid: viewModelUuid})
CALL custom.designer.view.executeViewQueries(view) YIELD nodes, relationships
CALL custom.designer.view.getViewsOfNodes(view, null, nodes) YIELD viewsOfNodes

WITH {
       viewModelDef:  {uuid: view.uuid,
                       name: view.name},
       nodes:         viewsOfNodes,
       relationships: custom.designer.view.getViewsOfRelationships(view, relationships),
       actionDefs:    custom.designer.action.global.getGlobalActions(view)
     } AS viewModelData

// workaround for apoc.convert.toJson()
RETURN apoc.convert.toSortedJsonMap(viewModelData) AS result;