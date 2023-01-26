/*
@name util.getElementaryProperties

@mode read
@input graphObject, ANY

@return LIST OF MAP
*/

WITH $graphObject AS graphObject
WITH properties(graphObject) AS properties
RETURN [key IN apoc.coll.sort(keys(properties)) WHERE NOT key = 'uuid' | {name: key, value: properties[key]}];
