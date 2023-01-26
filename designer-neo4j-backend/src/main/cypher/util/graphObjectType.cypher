/*
@name util.graphObjectType

@mode read

@input graphObject, ANY

@return STRING
*/

WITH $graphObject AS graphObject

RETURN CASE WHEN apoc.meta.type(graphObject) = 'NODE'
THEN head([x IN labels(graphObject) WHERE x <> "_Identifiable" | x])
         ELSE type(graphObject)
         END;