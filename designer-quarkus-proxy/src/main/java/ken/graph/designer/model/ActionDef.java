package ken.graph.designer.model;

import java.util.List;

public record ActionDef(String uuid, String name, boolean hidden, String group, String icon, List<ActionDefParameter> params) {
}
