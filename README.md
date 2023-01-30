# ++.1

++.1 repository is home to the prototype of our graph designing application. The goal of the application is to be a
general and comprehensive tool for exploring and transforming datasets, building applications, dashboards, and even
developing ML models all by simply creating and editing graph models.

The idea behind Graph Designer is to use graph models to describe everything from meta models, code, dashboards to
applications, making them understandable for both humans and machines.

To start using Graph Designer, simply follow the instructions below:

- Pre-requisites
- Build
- Setup & demos

By following these steps, you'll be able to build the necessary jars, docker images, and run the application on your
local machine. You'll also be able to import data sets and schemas to explore different demos.

## Pre-requisites

## Build

### Make File
You can start your project with the makefile that we created for you. 

To use it run
```
make build-all   
```

This will build all the docker images for you and start docker containers. 

> **_NOTE:_**  If You use this approach, pleas skipp all steps till Import data into Neo4J! 

Alternatively you could build one image after another with below steps:

### Designer Neo4j backend:

- build jar

```
mvn -f designer-neo4j-backend/pom.xml clean package
```

- build docker image

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

- build docker image:

```
docker build -t designer-frontend -f designer-react-frontend/Dockerfile ./designer-react-frontend
```

## Setup & demos

### Setup

When you have built all the required images, move to `docker` directory and first reset the volume by running.

```
./resetVolume.sh
```

You can then run docker-compose with:

```
docker-compose up -d
```

(if you wish to attach to the docker logs run: `docker-compose logs -f`).

After the containers have successfully, we must now import the metadata into the Neo4j database to make the designer
functional. Access Neo4j browser on http://localhost:7474
Username: `neo4j`
Password: `pass`

Import data into Neo4j by running

```cypher
CALL apoc.cypher.runFile('file:///main/bios/initBios.cypher')
```

After the scripts have loaded, you can access the graph designer application on  `http://localhost:3000`. 
You now have a graph designer with the basic functionalities to build other projects, if you wish to import some demo projects read the
following section.

### Demos

Specific demonstrations for the Graph designer are located in the `demos` directory because the directory is then
mounted inside the Neo4j docker container. The structure of demos must follow a certain convention to make deployment
easier.

Each demo contains a separate directory under `demos` (for example demo movies is located under `demos/movies`).

Cypher files that contain meta structures (metagraph, functions, views ...) can be prepended with
`metagraph_`, `graphlet_`, `function_`, `job_`, `functionality_`, `style_`, `view_` or `project_` to make use of the
`custom.designer.import.importFromDirectory` procedure that executes cypher files in the correct order.

Instructions on how to import data sets and schemas should be provided for each demo.
For example on how to load the Northwind demo into designer, one would run the following cypher in Neo4j browser:

```cypher
CALL custom.designer.import.importFromDirectory("demos/northwind");
CALL apoc.cypher.runSchemaFile("demos/northwind/northwind_schema.cypher");
CALL apoc.cypher.runFile("demos/northwind/northwind_dataset.cypher");
```
