/*
@name util.joinText

@input strings, LIST OF ANY
@input delimiter, STRING, ''
@return string
*/
WITH $strings AS strings, $delimiter AS delimiter
WITH delimiter, [string IN strings WHERE NOT (string = '' OR string IS NULL) | apoc.convert.toString(string)] AS strings
RETURN apoc.text.join(strings, delimiter);