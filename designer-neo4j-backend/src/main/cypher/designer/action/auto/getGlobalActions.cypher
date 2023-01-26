/*
@name designer.action.auto.getGlobalActions

@mode read
@input view, NODE

@output uuid, STRING
@output name, STRING
@output group, STRING
@output icon, STRING
@output params, LIST OF MAP
*/

WITH $view AS view

CALL apoc.custom.list() YIELD name AS procedureName, mode
  WHERE procedureName STARTS WITH 'designer.action.auto.global.'
  AND NOT procedureName ENDS WITH '_do'
  AND mode = 'read'

WITH procedureName, view
CALL apoc.cypher.run('
                      CALL custom.' + procedureName + '($view) YIELD name, group, icon, params, implicitParams, hidden
                      RETURN name, group, icon, params, implicitParams, hidden
                     ', {view: view}) YIELD value

RETURN custom.util.joinText(substring(procedureName, 16) + value.implicitParams, '$') AS uuid,
       value.name AS name,
       value.group AS group,
       value.params AS params,
       value.icon AS icon,
       value.hidden AS hidden;
