/*
@name tnt.executeReadFunction

@mode read
@input function, NODE
@input parameters, MAP

@output value, MAP
*/

WITH $function AS function,
     $parameters AS parameters
CALL tnt.compileFunction(function) YIELD cypher, error
CALL apoc.cypher.run(cypher, parameters) YIELD value
RETURN value;
