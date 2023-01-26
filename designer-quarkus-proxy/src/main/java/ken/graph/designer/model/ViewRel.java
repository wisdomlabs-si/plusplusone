package ken.graph.designer.model;

import java.util.List;

public record ViewRel(String uuid, String startNodeUuid, String endNodeUuid, String label,
        List<ViewProperty> properties, String caption, String color, String icon, String lineStyle, int lineWidth,
        List<ActionDef> actionDefs) {
}
