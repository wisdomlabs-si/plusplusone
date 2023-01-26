/*
@name designer.action.parameters.mapParametersToArguments

@mode read
@input action, NODE
@input parameters, MAP

@output arguments, MAP
*/

WITH $action AS action,
      $parameters AS parameters

// map contextual parameters
CALL {
    WITH action, parameters
    MATCH (action)-[:PROVIDES_CONTEXT]->(taskInput:Input)
    RETURN apoc.map.setEntry({}, taskInput.name, custom.util.findNode(parameters['contextUuid']).node) AS input

    UNION

    WITH action, parameters
    MATCH (action)-[:WITH_PARAMETER]->(actionParameter:ActionParameter)-[:PROVIDES_VALUE]->(taskInput:Input)
    CALL custom.designer.view.convertPropertyValue(taskInput.type, apoc.map.get(parameters, actionParameter.name)) YIELD propertyValueConverted
    RETURN apoc.map.setEntry({}, taskInput.name, propertyValueConverted) AS input
    }

WITH collect(input) AS inputs
RETURN apoc.map.mergeList(inputs) AS arguments;
