package ken.graph.designer.service.neo4j;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import ken.graph.designer.model.ViewModel;
import ken.graph.query.ParameterizedQueryCypherProcedure;

/**
 * @author Tomo Cesnik
 */
public final class QueryGetViewModelData extends ParameterizedQueryCypherProcedure<String, ViewModel> {
    protected QueryGetViewModelData(ObjectMapper objectMapper) {
        super("custom.designer.getViewModelData", objectMapper);
    }

    @Override
    protected TypeReference<ViewModel> getResultTypeReference() {
        return new TypeReference<ViewModel>() {
        };
    }
}
