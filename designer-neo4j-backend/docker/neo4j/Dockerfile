FROM neo4j:4.4.6-community

RUN wget https://github.com/wisdomlabs-si/plusplusone/releases/download/v0.0.1/apoc-4.4.0.3-modified-all.jar -P /var/lib/neo4j/plugins/
RUN wget https://github.com/wisdomlabs-si/plusplusone/releases/download/v0.0.1/kenstack-cypher-project-loader-2.0.0.jar -P /var/lib/neo4j/plugins/
RUN wget https://github.com/wisdomlabs-si/plusplusone/releases/download/v0.0.1/merovingian-job-scheduler-1.1.0-jar-with-dependencies.jar -P /var/lib/neo4j/plugins/
RUN wget https://github.com/wisdomlabs-si/plusplusone/releases/download/v0.0.1/trinity-graph-compiler-0.5.0-jar-with-dependencies.jar -P /var/lib/neo4j/plugins/

COPY docker/neo4j/conf/*.conf /conf/
COPY target/designer-tool-*.jar /var/lib/neo4j/plugins/cypher/
