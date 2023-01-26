/*
@name designer.action.parameters.retrieveParameters

@mode read
@input action, NODE

@return LIST OF MAP
*/

WITH $action AS action

OPTIONAL MATCH (action)-[:WITH_PARAMETER]->(actionParameter:ActionParameter)-[:RENDERED_WITH]->(widget:Widget)
WITH actionParameter, widget
  WHERE NOT (actionParameter IS NULL AND widget IS NULL)

WITH actionParameter,
     widget,
     custom.designer.action.parameters.retrieveInitialValuesForWidgets(widget) AS initValues

WITH {name:   actionParameter.name,
      widget: widget.type,
      initValues: initValues } AS parameterDefinition

RETURN collect(parameterDefinition);