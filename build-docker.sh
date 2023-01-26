#!/bin/bash
## Frontend
rm -rf dist
docker run -it -v ${PWD}:/designer-morpheus-frontend/project -w /project --rm --user $(id -u) --name node-devenv node:14 ./build.sh

docker build ./designer-morpheus-frontend -t designer-basic


## Backend
#!/bin/bash

./mvnw -f ./designer-quarkus-proxy clean package -Dquarkus.container-image.build=true -Dquarkus.container-image.name=kenstack-graph-designer-backend -Dquarkus.container-image.tag=latest -Dquarkus.container-image.group=

## Neo4j

mvn -f ./designer-neo4j-backend/pom.xml clean package -DskipTests=true
