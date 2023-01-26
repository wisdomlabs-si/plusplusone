/*
@name designer.export.exportDashboard

@input dashboard, NODE

@return STRING
*/

WITH $dashboard AS dashboard

CALL apoc.path.subgraphAll(dashboard,
{
  relationshipFilter: 'DISPLAYS_PAGE>|DISPLAYS_REPORT>|EXECUTES>|DISPLAYS_VALUE>|DISPLAYS_VALUES>|INDEX_BY>|GROUP_BY>|DISPLAYS_VALUES_ON_X_AXIS>|DISPLAYS_VALUES_ON_Y_AXIS>|PROVIDES_PARAMETER>|PROVIDES_VALUE>|FOR_NODE>|FOR_PROPERTY>',
  labelFilter: 'Dashboard|Page|BarReport|GraphReport|LineReport|MarkdownReport|PieReport|SingleValueReport|TableReport|TextParameter|NodePropertyParameter|Function|Output|Input',
  maxLevel: 4
}) YIELD nodes, relationships

WITH dashboard,
     [node IN nodes WHERE node:Function OR node:Output OR node:Input OR node:NodeDef OR node:Property | node] AS dependantNodes,
     [node IN nodes WHERE NOT (node:Function OR node:Output) | node] AS nodesToExport,
     [rel IN relationships WHERE NOT type(rel) IN ["HAS_OUTPUT", "HAS_INPUT"]] AS relsToExport

WITH custom.util.toSnakeCase(dashboard.title) AS dashboardName,
     dependantNodes,
     nodesToExport,
     relsToExport

RETURN tnt.export.toCypher("/import/dashboard_" + dashboardName + ".cypher", dependantNodes, nodesToExport, relsToExport);