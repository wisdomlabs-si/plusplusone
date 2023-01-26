build-cypher:
	mvn clean package

build-docker:
	mvn clean package -DskipTests=true
	docker-compose -f docker/docker-compose.yaml build

run-docker:
	docker-compose -f docker/docker-compose.yaml up -d
	docker-compose -f docker/docker-compose.yaml logs -f

run-neo4j:
	docker-compose -f docker/docker-compose.yaml up -d designer-neo4j
	docker-compose -f docker/docker-compose.yaml logs -f

stop-docker:
	docker-compose -f docker/docker-compose.yaml down -v

restart-docker:
	docker-compose -f docker/docker-compose.yaml down -v
	mvn clean package -DskipTests=true
	docker-compose -f docker/docker-compose.yaml build
	docker-compose -f docker/docker-compose.yaml up -d
	docker-compose -f docker/docker-compose.yaml logs -f