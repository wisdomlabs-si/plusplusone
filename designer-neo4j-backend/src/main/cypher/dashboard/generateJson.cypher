/*
@name dashboard.v1.generateJson

@mode read
@input dashboard, NODE
@return STRING
*/

WITH $dashboard AS dashboard
WITH {
       `title`:      dashboard.title,
       `version`:    "2.1",
       `settings`:   {
                       `pagenumber`:        0,
                       `editable`:          false,
                       `fullscreenEnabled`: false,
                       `parameters`:        {}
                     },
       `pages`:      [(dashboard)-[:DISPLAYS_PAGE]->(page:Page) | custom.dashboard.v1.page.parsePage(page)],
       `parameters`: {}
     } AS dashboardMap

RETURN apoc.convert.toJson(dashboardMap) AS json;