package ken.graph.designer.model;

public record ActionExecResult(String actionExecUuid,
                               int statusCode,
                               String message,
                               ClientStateStrategy strategy,
                               ActionResultData data) {
}
