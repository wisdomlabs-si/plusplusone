package ken.graph.designer.model;

import java.util.List;

public record ViewModel(ViewModelDef viewModelDef, List<ViewNode> nodes, List<ViewRel> relationships,
        List<ActionDef> actionDefs) {
}
