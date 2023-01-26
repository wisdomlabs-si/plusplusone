package ken.graph.designer.service.neo4j;

import java.util.List;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import ken.graph.designer.model.ActionExec;
import ken.graph.designer.model.ActionExecResult;
import ken.graph.query.ParameterizedQueryCypherProcedure;

/**
 * @author Tomo Cesnik
 */
public final class QueryExecuteActions
        extends ParameterizedQueryCypherProcedure<List<ActionExec>, List<ActionExecResult>> {
    protected QueryExecuteActions(ObjectMapper objectMapper) {
        super("custom.designer.executeActions", objectMapper);
    }

    @Override
    protected TypeReference<List<ActionExecResult>> getResultTypeReference() {
        return new TypeReference<List<ActionExecResult>>() {
        };
    }
}
