package ken.graph.query;

import java.util.function.Function;

import org.neo4j.driver.Query;
import org.neo4j.driver.Result;
import org.neo4j.driver.Value;

/**
 * Utility class that represents an executable query. The idea is that users
 * extend this class for each query and provide expected inputs and outputs,
 * thus obtaining strongly-typed query execution construct, which is easier to
 * work with and reason about.
 *
 * @param <T> type of query parameter
 * @param <R> type of query return value
 * @author Tomo Cesnik
 */
public abstract class ParameterizedQuery<T, R> {
    public final R execute(Function<Query, Result> queryExecutor, T param) {
        String queryText = getQueryText();
        Query query = new Query(queryText, transformParam(param));
        Result result = queryExecutor.apply(query);
        return transformResult(result);
    }

    protected abstract String getQueryText();

    protected abstract Value transformParam(T param);

    protected abstract R transformResult(Result result);
}
