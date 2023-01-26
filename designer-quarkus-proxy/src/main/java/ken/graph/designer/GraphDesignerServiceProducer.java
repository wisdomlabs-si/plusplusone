package ken.graph.designer;

import javax.enterprise.context.Dependent;
import javax.enterprise.inject.Produces;

import org.neo4j.driver.Driver;

import com.fasterxml.jackson.databind.ObjectMapper;

import io.quarkus.arc.DefaultBean;
import io.quarkus.arc.profile.IfBuildProfile;
import ken.graph.designer.service.GraphDesignerService;
import ken.graph.designer.service.mock.GraphDesignerServiceMock;
import ken.graph.designer.service.neo4j.GraphDesignerServiceNeo4j;

/**
 * @author Tomo Cesnik
 */
@Dependent
public final class GraphDesignerServiceProducer {
    @Produces
    @DefaultBean
    public GraphDesignerService createNeo4j(Driver neoDriver, ObjectMapper objectMapper) {
        return new GraphDesignerServiceNeo4j(neoDriver, objectMapper);
    }

    @Produces
    @IfBuildProfile("mock")
    public GraphDesignerService createMock() {
        return new GraphDesignerServiceMock();
    }
}
