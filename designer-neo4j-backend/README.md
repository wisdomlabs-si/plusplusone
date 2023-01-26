# Designer Tool

## Build

https://plusplus1.atlassian.net/wiki/spaces/KENstack/pages/1955102723/Simple+KENstack+Graph+Designer

## How to start the designer

To or start using the designer stack you first have to run

```
CALL apoc.cypher.runFile("file:///main/bios/initBios.cypher");
```

If you wish to update your current version of designer you must execute cypher scripts located
in `src/main/resources/data/migrations` in a correct order.

## Ping Pong

Before continuing with the Ping-pong demo make sure that you have correctly loaded the BIOS.

```
CALL custom.designer.import.importFromDirectory("main/pingpong")
```