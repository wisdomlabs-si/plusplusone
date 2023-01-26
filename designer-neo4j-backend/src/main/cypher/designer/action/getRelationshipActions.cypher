/*
@name designer.action.getRelationshipActions

@mode read

@input view, NODE
@input relation, REL

@return LIST OF MAP
*/

WITH $view AS view,
     $relation AS relation,
     custom.util.graphObjectType($relation) AS relationType

CALL {
        WITH view, relationType

        MATCH (view)-[:HAS_FUNCTIONALITY]->(:Functionality)-[:HAS_ACTION]->(action:Action)-[:FOR_REL]->(:RelDef {name: relationType})
        RETURN action.uuid AS uuid,
               action.name AS name,
               action.group AS group,
               action.icon AS icon,
               custom.designer.action.parameters.retrieveParameters(action) AS params

        UNION

        WITH view

        MATCH (view)-[:HAS_FUNCTIONALITY]->(:Functionality)-[:DEFAULT_REL_ACTION]->(action:Action)
        RETURN action.uuid AS uuid,
               action.name AS name,
               action.group AS group,
               action.icon AS icon,
               custom.designer.action.parameters.retrieveParameters(action) AS params

        UNION

        WITH view, relation
        CALL custom.designer.action.auto.getRelationshipActions(view, relation) YIELD uuid, name, group, icon, params
        RETURN uuid, name, group, icon, params
}

WITH {uuid:   uuid,
      name:   name,
      group:  group,
      icon:   icon,
      params: apoc.coll.sortMulti(params, ["^name"])} AS actionDefinition
ORDER BY actionDefinition.name

RETURN collect(actionDefinition);