# KENstack Graph Designer Backend

This is a REST API that serves KENstack graph designer.

This project uses Quarkus, the Supersonic Subatomic Java Framework.

## Running the application in dev mode

You can run your application in dev mode that enables live coding using:
```shell script
./mvnw compile quarkus:dev
```

> **_NOTE:_**  Quarkus now ships with a Dev UI, which is available in dev mode only at http://localhost:8080/q/dev/.

## Packaging and running the application

The application can be packaged using:
```shell script
./mvnw package
```
It produces the `quarkus-run.jar` file in the `target/quarkus-app/` directory.
Be aware that it’s not an _über-jar_ as the dependencies are copied into the `target/quarkus-app/lib/` directory.

The application is now runnable using `java -jar target/quarkus-app/quarkus-run.jar`.

If you want to build an _über-jar_, execute the following command:
```shell script
./mvnw package -Dquarkus.package.type=uber-jar
```

The application, packaged as an _über-jar_, is now runnable using `java -jar target/*-runner.jar`.

## Creating a native executable

You can create a native executable using: 
```shell script
./mvnw package -Pnative
```

Or, if you don't have GraalVM installed, you can run the native executable build in a container using: 
```shell script
./mvnw package -Pnative -Dquarkus.native.container-build=true
```

You can then execute your native executable with: `./target/<SERVICE_NAME>-runner`

If you want to learn more about building native executables, please consult https://quarkus.io/guides/maven-tooling.html.

## Docker image creation

To create the docker image, use the command:
```shell script
./mvnw clean package -Dquarkus.container-image.build=true -Dquarkus.container-image.push=true -Dquarkus.container-image.registry=rg.fr-par.scw.cloud -Dquarkus.container-image.group=kenstack -Dquarkus.container-image.name=<service name> -Dquarkus.container-image.tag=<version> -Dquarkus.container-image.additional-tags=latest
```

## Configuration
Configurable application parameters:
| Property | Environment variable | Default value |
| --- | --- | --- |
| quarkus.neo4j.uri | NEO4J_URI | bolt://localhost:7687 |
| quarkus.neo4j.authentication.username | NEO4J_USER | neo4j |
| quarkus.neo4j.authentication.password | NEO4J_PASS | secret |

Use `-Dquarkus.http.host=0.0.0.0` when running in development mode on WSL 2, to access it successfully from local browser.