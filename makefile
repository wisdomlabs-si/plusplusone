build-all-docker-images:
	./build-docker.sh
	docker-compose -f ./designer-neo4j-backend/docker/docker-compose.yaml build

run-docker:
	docker-compose -f ./designer-neo4j-backend/docker/docker-compose.yaml up -d
	docker-compose -f ./designer-neo4j-backend/docker/docker-compose.yaml logs -f


restart-docker:
	docker-compose -f ./designer-neo4j-backend/docker/docker-compose.yaml down -v
	mvn -f ./designer-neo4j-backend/pom.xml clean package -DskipTests=true
	docker-compose -f ./designer-neo4j-backend/docker/docker-compose.yaml build
	docker-compose -f ./designer-neo4j-backend/docker/docker-compose.yaml up -d
	docker-compose -f ./designer-neo4j-backend/docker/docker-compose.yaml logs -f