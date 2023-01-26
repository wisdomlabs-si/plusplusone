package ken.graph.designer.service.neo4j;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.neo4j.driver.Driver;
import org.neo4j.driver.Session;

import com.fasterxml.jackson.databind.ObjectMapper;

import ken.graph.designer.model.ActionExec;
import ken.graph.designer.model.ActionExecResult;
import ken.graph.designer.model.ViewModel;
import ken.graph.designer.model.ViewModelDef;
import ken.graph.designer.service.GraphDesignerService;

/**
 * Service for graph designer.
 *
 * @author Tomo Cesnik
 */
public final class GraphDesignerServiceNeo4j implements GraphDesignerService {
    private final Driver neoDriver;

    private final QueryListViewModels queryListViewModels;
    private final QueryGetViewModelData queryGetViewModelData;
    private final QueryExecuteActions queryExecuteActions;

    public GraphDesignerServiceNeo4j(Driver neoDriver, ObjectMapper objectMapper) {
        this.neoDriver = neoDriver;

        this.queryListViewModels = new QueryListViewModels(objectMapper);
        this.queryGetViewModelData = new QueryGetViewModelData(objectMapper);
        this.queryExecuteActions = new QueryExecuteActions(objectMapper);
    }

    @Override
    public List<ViewModelDef> listViewModels() {
        Session session = neoDriver.session();
        return Optional.ofNullable(queryListViewModels.execute(session::run, null)).orElse(Collections.emptyList());
    }

    @Override
    public Optional<ViewModel> getViewModelData(String uuid) {
        Session session = neoDriver.session();
        return Optional.ofNullable(queryGetViewModelData.execute(session::run, uuid));
    }

    @Override
    public List<ActionExecResult> executeActions(List<ActionExec> actionExecs) {
        Session session = neoDriver.session();
        return Optional.ofNullable(queryExecuteActions.execute(session::run, actionExecs))
                .orElse(Collections.emptyList());
    }
}
