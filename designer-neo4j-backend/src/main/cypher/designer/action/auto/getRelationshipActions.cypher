/*
@name designer.action.auto.getRelationshipActions

@mode read
@input view, NODE
@input relation, REL

@output uuid, STRING
@output name, STRING
@output group, STRING
@output icon, STRING
@output params, LIST OF MAP
@output hidden, BOOLEAN
*/

WITH $view AS view,
     $relation AS relation

CALL apoc.custom.list() YIELD name AS procedureName, mode
  WHERE procedureName STARTS WITH 'designer.action.auto.relationship.'
  AND NOT procedureName ENDS WITH '_do'
  AND mode = 'read'

WITH procedureName, view, relation
CALL apoc.cypher.run('
                      CALL custom.' + procedureName + '($view, $relation) YIELD name, group, icon, params, implicitParams, hidden
                      RETURN name, group, icon, params, implicitParams, hidden
                     ',
                      {view: view,
                       relation: relation}) YIELD value

RETURN custom.util.joinText(substring(procedureName, 16) + value.implicitParams, '$') AS uuid,
       value.name AS name,
       value.group AS group,
       value.params AS params,
       value.icon AS icon,
       value.hidden AS hidden;
