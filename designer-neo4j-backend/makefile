build-cypher:
	mvn clean package

build-docker:
	mvn clean package -DskipTests=true
	docker build -t designer-neo4j -f docker/neo4j/Dockerfile .