/*
@name designer.action.global.getGlobalActions

@mode read
@input view, NODE

@return LIST OF MAP
*/

WITH $view AS view

CALL {
      WITH view
      MATCH (view)-[:HAS_FUNCTIONALITY]->(func:Functionality)-[:HAS_ACTION]->(action:Action)
      WHERE NOT (action)-[:FOR_NODE|FOR_REL]->()
      RETURN action.uuid AS uuid,
             action.name AS name,
             action.group AS group,
             action.icon AS icon,
             custom.designer.action.parameters.retrieveParameters(action) AS params

      UNION

      WITH view
      CALL custom.designer.action.auto.getGlobalActions(view) YIELD uuid, name, group, icon, params
      RETURN uuid, name, group, icon, params
}

WITH {uuid:   uuid,
      name:   name,
      group:  group,
      icon:   icon,
      params: apoc.coll.sortMulti(params, ["^name"])} AS actionDefinition
ORDER BY actionDefinition.name

RETURN collect(actionDefinition);