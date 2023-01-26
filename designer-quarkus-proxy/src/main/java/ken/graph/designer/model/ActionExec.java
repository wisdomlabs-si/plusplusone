package ken.graph.designer.model;

import java.util.List;

public record ActionExec(String uuid,
                         String viewId,
                         String actionUuid,
                         String contextUuid,
                         ContextType contextType,
                         List<ActionExecArgument> arguments) {
}
