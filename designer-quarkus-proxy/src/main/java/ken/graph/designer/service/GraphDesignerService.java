package ken.graph.designer.service;

import java.util.List;
import java.util.Optional;

import ken.graph.designer.model.ActionExec;
import ken.graph.designer.model.ActionExecResult;
import ken.graph.designer.model.ViewModel;
import ken.graph.designer.model.ViewModelDef;

/**
 * Service for graph designer.
 *
 * @author Tomo Cesnik
 */
public interface GraphDesignerService {
    List<ViewModelDef> listViewModels();

    Optional<ViewModel> getViewModelData(String uuid);

    List<ActionExecResult> executeActions(List<ActionExec> actionExecs);
}
