package ken.graph.designer;

import java.util.List;
import java.util.Optional;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import org.eclipse.microprofile.openapi.annotations.Operation;
import org.jboss.resteasy.annotations.jaxrs.PathParam;

import ken.graph.designer.model.ActionExec;
import ken.graph.designer.model.ActionExecResult;
import ken.graph.designer.model.ViewModel;
import ken.graph.designer.model.ViewModelDef;
import ken.graph.designer.service.GraphDesignerService;

/**
 * Endpoint definitions for graph designer.
 *
 * @author Tomo Cesnik
 */
@Path("")
public final class GraphDesignerResource {
    private final GraphDesignerService graphDesignerService;

    public GraphDesignerResource(GraphDesignerService graphDesignerService) {
        this.graphDesignerService = graphDesignerService;
    }


    @Path("/view-models")
    @GET
    @Operation(description = "Lists view models.")
    public List<ViewModelDef> listViewModels() {
        return graphDesignerService.listViewModels();
    }


    @Path("/view-models/{uuid}")
    @GET
    @Operation(description = "Gets all data of a view model.")
    public Optional<ViewModel> getViewModel(@PathParam String uuid) {
        return graphDesignerService.getViewModelData(uuid);
    }

    @Path("/action-executions")
    @POST
    @Operation(description = "Executes passed actions.")
    public List<ActionExecResult> executeActions(List<ActionExec> actionExecs) {
        return graphDesignerService.executeActions(actionExecs);
    }
}
