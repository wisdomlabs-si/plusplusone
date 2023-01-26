// refactor all constants
MATCH (c:Constant)
SET c.type = toLower(apoc.meta.type(c.value)),
c.value = toStringOrNull(c.value);
