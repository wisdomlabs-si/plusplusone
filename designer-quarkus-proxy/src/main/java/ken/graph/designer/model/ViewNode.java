package ken.graph.designer.model;

import java.util.List;

public record ViewNode(String uuid, String label, List<ViewProperty> properties, String caption, double x, double y,
        String color, String icon, int size, List<ActionDef> actionDefs) {
}
