package ken.graph.query;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UncheckedIOException;
import java.util.Collections;
import java.util.List;

/**
 * Utility class for loading text of queries from resources folder.
 *
 * @author Tomo Cesnik
 */
public final class QueryResource {
    private static final String QUERY_RESOURCE_DIRECTORY = "/queries/";
    private static final String QUERY_FILE_EXTENSION = ".cypher";

    private final List<String> stringLines;

    private QueryResource(List<String> stringLines) {
        this.stringLines = stringLines;
    }

    public static QueryResource load(String queryName) {
        String resourceName = QUERY_RESOURCE_DIRECTORY + queryName + QUERY_FILE_EXTENSION;
        return new QueryResource(readTextFromResource(resourceName));
    }

    private static List<String> readTextFromResource(String resourceName) {
        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(QueryResource.class.getResourceAsStream(resourceName)))) {
            return Collections.unmodifiableList(reader.lines().toList());
        } catch (IOException e) {
            throw new UncheckedIOException(e);
        }
    }

    public String asString() {
        return String.join("\n", stringLines);
    }

    public List<String> asStringLines() {
        return Collections.unmodifiableList(stringLines);
    }
}
