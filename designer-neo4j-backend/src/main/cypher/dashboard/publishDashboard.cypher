/*
@name dashboard.v1.publishDashboard

@mode write
@input dashboard, NODE
@output dashboard, NODE
*/

WITH $dashboard AS dashboard
MERGE (dash:`_Neodash_Dashboard` {title: dashboard.title})
SET
dash += {uuid:    randomUUID(),
         user:    'neo4j',
         version: '2.1',
         content: custom.dashboard.v1.generateJson(dashboard),
         date:    datetime()
}
RETURN dashboard;

