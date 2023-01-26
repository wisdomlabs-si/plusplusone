/*
@name util.toSnakeCase

@input string, STRING
@return string
*/

RETURN replace(toLower($string), " ", "_");
