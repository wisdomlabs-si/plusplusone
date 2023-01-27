# ++.1

## Pre-requisites 

## Build
### Designer Neo4j backend:

- build jar
```
mvn -f designer-neo4j-backend/pom.xml clean package
```

- build the docker image
```
docker build -t designer-neo4j -f designer-neo4j-backend/docker/neo4j/Dockerfile ./designer-neo4j-backend
```

### Designer Quarkus proxy

- build jar
```
mvn -f designer-quarkus-proxy/pom.xml clean package
```

- build docker image
```
mvn -f designer-quarkus-proxy/pom.xml clean package -Dquarkus.container-image.build=true -Dquarkus.container-image.name=designer-proxy -Dquarkus.container-image.tag=latest -Dquarkus.container-image.group=
```

### Designer React frontend

- build the designer frontend:
```
npm i --prefix ./designer-react-frontend
npm run --prefix ./designer-react-frontend build
```

- build the designer frontend docker image:
```
docker build -t designer-frontend -f designer-react-frontend/Dockerfile ./designer-react-frontend
```

## Setup & demos

### Setup

When you have built all the required images, move to `docker` directory and first reset the volume by running.
```
./resetVolume.sh
```

Run docker-compose
```
docker-compose up -d
```

Docker logs
```
docker-compose logs -f
```

Access Neo4j on http://localhost:7474
Username: `neo4j`
Password: `pass`

Import data into Neo4j by running

```cypher
CALL apoc.cypher.runFile("file:///main/bios/initBios.cypher")
```
After the scripts have loaded access graph designer application on  `http://localhost:3000`.

### Demos

Specific demonstrations for the Designer must be located in the `demos` directory because the directory is then mounted inside the Neo4j docker container.
The structure of demos must follow a certain convention to make deployment easier.

Each demo must be contained in a separate directory under `demos` (for example demo movies is located under `demos/movies`).

Cypher files that contain meta structures (metagraph, functions, views ...) can be prepended with
`metagraph_`, `graphlet_`, `function_`, `job_`, `functionality_`, `style_`, `view_` or `project_` to make use of the
`custom.designer.import.importFromDirectory` procedure that executes cypher files in the correct order.

Instructions on how to import data sets and schemas must be provided for each demo.

For example on how to load the Movies demo into designer one would run the following in the Neo4j browser:

- Import meta structures:
```cypher
CALL custom.designer.import.importFromDirectory("demos/movies");
```
- Import data set:
```cypher
CALL apoc.cypher.runFile("demos/movies/movies_dataset.cypher");
```
