package ken.graph.designer.model;

import java.util.List;

public record ActionResultData(List<ViewNode> nodes,
                               List<ViewRel> relationships) {
}
