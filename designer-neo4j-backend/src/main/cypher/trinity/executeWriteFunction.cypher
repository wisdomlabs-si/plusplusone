/*
@name tnt.executeWriteFunction

@mode write
@input function, NODE
@input parameters, MAP

@output value, MAP
@output error, STRING
*/

WITH $function AS function,
     $parameters AS parameters,
      false AS failOnError
CALL tnt.compileFunction(function, false) YIELD cypher, error AS compilationError

WITH cypher, compilationError, parameters
CALL {
      WITH cypher, compilationError, parameters
      WITH cypher, compilationError, parameters
      WHERE compilationError IS NULL
      CALL apoc.cypher.doIt(cypher, parameters) YIELD value
      RETURN value, null AS error

      UNION

      WITH cypher, compilationError, parameters
      WITH cypher, compilationError, parameters
        WHERE NOT compilationError IS NULL
      RETURN null AS value, compilationError AS error
}
RETURN value, error;
