package ken.graph.query;

import java.util.Map;
import java.util.Objects;

import org.neo4j.driver.Record;
import org.neo4j.driver.Result;
import org.neo4j.driver.Value;
import org.neo4j.driver.Values;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author Tomo Cesnik
 */
public abstract class ParameterizedQueryCypherProcedure<T, R> extends ParameterizedQuery<T, R> {
    private static final String PARAMS = "params";
    private static final String RESULT = "result";

    private final String procedureName;
    private final ObjectMapper objectMapper;

    protected ParameterizedQueryCypherProcedure(String procedureName, ObjectMapper objectMapper) {
        this.procedureName = procedureName;
        this.objectMapper = objectMapper;
    }

    @Override
    protected final String getQueryText() {
        return "CALL " + procedureName + "($" + PARAMS + ")";
    }

    @Override
    protected final Value transformParam(T param) {
        String paramStr;
        try {
            paramStr = objectMapper.writer().writeValueAsString(Objects.nonNull(param) ? Map.of(PARAMS, param) : null);
        } catch (JsonProcessingException e) {
            throw new IllegalArgumentException("Cannot convert to Neo4j parameter", e);
        }
        return Values.parameters(PARAMS, paramStr);
    }

    @Override
    protected final R transformResult(Result result) {
        return result.stream().findFirst().map(this::mapRecord).orElse(null);
    }

    private R mapRecord(Record rec) {
        String value = rec.get(RESULT).asString();
        try {
            return objectMapper.readValue(value, getResultTypeReference());
        } catch (JsonProcessingException e) {
            throw new IllegalArgumentException("Cannot convert from Neo4j result", e);
        }
    }

    protected abstract TypeReference<R> getResultTypeReference();
}
