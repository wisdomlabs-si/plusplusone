package ken.graph.designer.service.mock;

import java.util.Collections;
import java.util.List;
import java.util.UUID;

import ken.graph.designer.model.ActionDef;
import ken.graph.designer.model.ActionDefParameter;

/**
 * @author Tomo Cesnik
 */
public final class HardCodedActions {
    public static final String UUID_SET_POS = UUID.randomUUID().toString();
    public static final String UUID_ADD_REL = UUID.randomUUID().toString();

    private HardCodedActions() {
    }

    public static List<ActionDef> viewActions() {
        return Collections.emptyList();
    }

    public static List<ActionDef> nodeActions() {
        ActionDef a1 = new ActionDef(UUID_SET_POS, "setPosition", false, null, null,
                List.of(new ActionDefParameter("x", null, null), new ActionDefParameter("y", null, null)));
        ActionDef a2 = new ActionDef(UUID_ADD_REL, "addRelationship", false, null, null,
                List.of(new ActionDefParameter("endNodeUuid", null, null), new ActionDefParameter("type", "textField", null)));

        return List.of(a1, a2);
    }

    public static List<ActionDef> relActions() {
        return Collections.emptyList();
    }
}
