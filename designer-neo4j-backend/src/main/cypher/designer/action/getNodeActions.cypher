/*
@name designer.action.getNodeActions

@mode read

@input view, NODE
@input node, NODE

@return LIST OF MAP
*/

WITH $view AS view,
        $node AS node,
        custom.util.graphObjectType($node) AS nodeType

CALL {
    WITH view, nodeType

    MATCH (view)-[:HAS_FUNCTIONALITY]->(:Functionality)-[:HAS_ACTION]->(action:Action)-[:FOR_NODE]->(:NodeDef {name: nodeType})
    RETURN action.uuid AS uuid,
           action.name AS name,
           action.group AS group,
           action.icon AS icon,
           custom.designer.action.parameters.retrieveParameters(action) AS params

    UNION

    WITH view

    MATCH (view)-[:HAS_FUNCTIONALITY]->(:Functionality)-[:DEFAULT_NODE_ACTION]->(action:Action)
    RETURN action.uuid AS uuid,
           action.name AS name,
           action.group AS group,
           action.icon AS icon,
           custom.designer.action.parameters.retrieveParameters(action) AS params

    UNION

    WITH view, node
    CALL custom.designer.action.auto.getNodeActions(view, node) YIELD uuid, name, group, icon, params
    RETURN uuid, name, group, icon, params
}

WITH {uuid:   uuid,
      name:   name,
      group:  group,
      icon:   icon,
      params: apoc.coll.sortMulti(params, ["^name"])} AS actionDefinition
ORDER BY actionDefinition.name

RETURN collect(actionDefinition);