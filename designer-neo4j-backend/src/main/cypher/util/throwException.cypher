/*
@name util.throwException

@input message, STRING
@input inputs, LIST OF STRING
@return string
*/
WITH $message AS message,
      $inputs AS inputs
CALL apoc.util.validate(true,message,inputs)
RETURN '';
