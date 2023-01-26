/*
@name trigger.createEvent

@mode write
@input epochMillis, NUMBER

@output event, NODE
*/

WITH $epochMillis AS epochMillis

CREATE (event:Event:_Identifiable {uuid: randomUUID(), timestamp: datetime({epochMillis: epochMillis})})
WITH event
CALL apoc.log.debug("[trigger.createEvent] Created event: %s", [event.uuid])

// link new event
CALL {
    WITH event
    MATCH (lastEvent:Event)
    WHERE event <> lastEvent AND NOT (lastEvent)-[:NEXT]->(:Event)
    CREATE (lastEvent)-[:NEXT]->(event)
}

RETURN event;
