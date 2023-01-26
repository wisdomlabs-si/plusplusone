/*
@name util.getMapValues

@mode read

@input map, MAP

@return LIST
*/

RETURN [k IN keys($map) | $map[k]];