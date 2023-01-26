package ken.graph.query;

/**
 * Abstraction for executable queries that provides integration with loading
 * text from resources folder and using it in the query.
 *
 * @param <T> type of query parameter
 * @param <R> type of query return value
 * @author Tomo Cesnik
 */
public abstract class ParameterizedQueryFromResource<T, R> extends ParameterizedQuery<T, R> {
    private final QueryResource queryResource;

    protected ParameterizedQueryFromResource(String queryName) {
        this.queryResource = QueryResource.load(queryName);
    }

    protected final QueryResource getQueryResource() {
        return queryResource;
    }

    @Override
    protected String getQueryText() {
        return queryResource.asString();
    }
}
