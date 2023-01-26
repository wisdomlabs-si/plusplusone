package ken.graph.designer.service.mock;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.IntStream;
import ken.graph.designer.model.ActionExec;
import ken.graph.designer.model.ActionExecResult;
import ken.graph.designer.model.ClientStateStrategy;
import ken.graph.designer.model.ViewModel;
import ken.graph.designer.model.ViewModelDef;
import ken.graph.designer.service.GraphDesignerService;

/**
 * Service for graph designer.
 *
 * @author Tomo Cesnik
 */
public final class GraphDesignerServiceMock implements GraphDesignerService {
  private static final List<ViewModel> viewModels = MockData.create();

  private int addRelCounter = 0;

  @Override
  public List<ViewModelDef> listViewModels() {
    return viewModels.stream().map(ViewModel::viewModelDef).toList();
  }

  @Override
  public Optional<ViewModel> getViewModelData(String uuid) {
    return viewModels.stream().filter(vm -> Objects.equals(vm.viewModelDef().uuid(), uuid))
        .findFirst();
  }

  @Override
  public List<ActionExecResult> executeActions(List<ActionExec> actionExecs) {
    return IntStream.range(0, actionExecs.size()).mapToObj(i -> {
      ActionExec ae = actionExecs.get(i);
      if (Objects.equals(ae.actionUuid(), HardCodedActions.UUID_ADD_REL)) {
        addRelCounter++;
        return new ActionExecResult(ae.uuid(), addRelCounter % 2, "Result " + i, ClientStateStrategy.APPEND, MockData.createActionResult());
      }
      return new ActionExecResult(ae.uuid(), i % 3, "Result " + i,ClientStateStrategy.REPLACE, MockData.createActionResult());
    }).toList();
  }
}
