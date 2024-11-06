build-backend-docker:
	docker build -t designer-neo4j -f designer-neo4j-backend/docker/neo4j/Dockerfile ./designer-neo4j-backend

# todo: add to work with mvnw
build-proxy-docker:
	mvn -f designer-quarkus-proxy/pom.xml clean package -Dquarkus.container-image.build=true -Dquarkus.container-image.name=designer-proxy -Dquarkus.container-image.tag=latest -Dquarkus.container-image.group=

build-frontend-docker:
	npm i --prefix ./designer-react-frontend
	npm run --prefix ./designer-react-frontend build
	docker build -t designer-frontend -f designer-react-frontend/Dockerfile ./designer-react-frontend

run-docker:
	docker-compose -f ./docker/docker-compose.yaml up -d
	docker-compose -f ./docker/docker-compose.yaml logs -f

stop-docker:
	docker-compose -f ./docker/docker-compose.yaml down -v

restart-docker:
	docker-compose -f ./docker/docker-compose.yaml restart
	docker-compose -f ./docker/docker-compose.yaml logs -f

build-all:
	npm i --prefix ./designer-react-frontend
	npm run --prefix ./designer-react-frontend build
	docker build -t designer-frontend -f designer-react-frontend/Dockerfile ./designer-react-frontend

	mvn -f designer-quarkus-proxy/pom.xml clean package -Dquarkus.container-image.build=true -Dquarkus.container-image.name=designer-proxy -Dquarkus.container-image.tag=latest -Dquarkus.container-image.group=

	mvn -f designer-neo4j-backend/pom.xml clean package
	docker build -t designer-neo4j -f designer-neo4j-backend/docker/neo4j/Dockerfile ./designer-neo4j-backend

