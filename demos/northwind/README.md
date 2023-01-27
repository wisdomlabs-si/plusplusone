# Northwind

Northwind is a sample dataset to demonstrate how to explore data using our graph designer.

## Setup

In Neo4j browser run following commands:

``` cypher
CALL custom.designer.import.importFromDirectory("demos/northwind");
CALL apoc.cypher.runSchemaFile("demos/northwind/northwind_schema.cypher");
CALL apoc.cypher.runFile("demos/northwind/northwind_dataset.cypher");
```