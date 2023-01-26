package ken.graph.designer.service.neo4j;

import java.util.List;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import ken.graph.designer.model.ViewModelDef;
import ken.graph.query.ParameterizedQueryCypherProcedure;

/**
 * @author Tomo Cesnik
 */
public final class QueryListViewModels extends ParameterizedQueryCypherProcedure<Void, List<ViewModelDef>> {
    protected QueryListViewModels(ObjectMapper objectMapper) {
        super("custom.designer.listViewModels", objectMapper);
    }

    @Override
    protected TypeReference<List<ViewModelDef>> getResultTypeReference() {
        return new TypeReference<List<ViewModelDef>>() {
        };
    }
}
