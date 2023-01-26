/*
@name designer.view.convertPropertyValue
@mode read

@input propType, STRING
@input propValue, ANY

@output propertyValueConverted, ANY
*/

WITH $propType AS propType, $propValue AS propValue

RETURN CASE toLower(propType)
       WHEN 'string' THEN apoc.convert.toString(propValue)
       WHEN 'integer' THEN apoc.convert.toInteger(propValue)
       WHEN 'float' THEN apoc.convert.toFloat(propValue)
       WHEN 'boolean' THEN apoc.convert.toBoolean(propValue)
       WHEN 'date' THEN date(propValue)
       WHEN 'datetime' THEN datetime(propValue)
       WHEN 'localdatetime' THEN localdatetime(propValue)
       WHEN 'localtime' THEN localtime(propValue)
       WHEN 'time' THEN time(propValue)
       WHEN 'duration' THEN duration(propValue)
       ELSE propValue
       END AS propertyValueConverted;
