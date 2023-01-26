import {
  ActionCallback,
  ActionDef,
  ActionPostData,
  contextTypeEnum,
  ViewModelData,
  ViewModelListItem,
} from "../Models";
import { Store } from "../store";
import { v4 as uuidv4 } from "uuid";
import { transformToActionGroups } from "../commonHelpers/commonHelpers";

const url =
  window.config?.API_GRAPH_DESIGNER_SERVICE !== "%API_GRAPH_DESIGNER_SERVICE%"
    ? window.config.API_GRAPH_DESIGNER_SERVICE
    : import.meta.env.VITE_GRAPHAPI_URL?.toString() || "http://localhost:8080";

function handleErrors(response: Response, store: Store) {
  if (!response.ok) {
    store.setMessage({ type: "error", text: `Error ${response.status}` });
    throw new Error(response.status.toString());
  }
  return response;
}

async function fetchWithErrorHandling(url: string, params: any, store: Store) {
  const res = await fetch(url, params);
  return handleErrors(res, store);
}

export const getViewModels = async (store: Store): Promise<ViewModelListItem[] | void> => {
  return fetchWithErrorHandling(`${url}/view-models`, { method: "GET" }, store)
    .then(async (res) => {
      return res.json();
    })
    .catch(() => {
      store.setMessage({ type: "error", text: `Error ${404}` });
    });
};

export const getViewModelData = async (id: string, store: Store): Promise<ViewModelData | void> => {
  return fetchWithErrorHandling(`${url}/view-models/${id}`, { method: "GET" }, store)
    .then(async (res) => {
      return res.json();
    })
    .catch(() => {
      store.setMessage({ type: "error", text: `Error ${404}` });
    });
};

async function handleActionExecResult(cy: cytoscape.Core, actionExecResult: any, store: Store) {
  const viewId = localStorage.getItem("SELECTED_GRAPH_ID");

  switch (actionExecResult.strategy) {
    case "LAZY_UPDATE": {
      cy.nodes('[?isNew]').removeData("isNew");
      // Append result data to cache (separate location) in a state
      store.appendDiffGraph(actionExecResult.data.nodes, actionExecResult.data.relationships);
      break;
    }
    case "DELETE": {
      store.clearNewMarks();
      // Remove result data from a state
      store.removeFromGraph(actionExecResult.data.nodes, actionExecResult.data.relationships);
      break;
    }
    case "APPEND": {
      store.clearNewMarks();
      // Add property that those nodes are new - UI visibility
      actionExecResult.data.nodes = actionExecResult.data.nodes.map((node: Node) => ({...node, isNew: true}))
      // Append result data to a state
      store.appendGraph(actionExecResult.data.nodes, actionExecResult.data.relationships);
      break;
    }
    case "REPLACE": {
      // Replace state with a result data
      const replacedGraph = {
        ...store.graph,
        nodes: actionExecResult.data.nodes,
        relationships: actionExecResult.data.relationships,
      };
      store.setGraph(replacedGraph);
      break;
    }
    case "REFRESH": {
      // Refresh from ViewModel data
      const graph = await getViewModelData(viewId || "", store);
      if (graph) {
        store.setGraph({ ...graph, actionGroups: transformToActionGroups(graph.actionDefs) });
      }
      break;
    }
  }
}

export const postAction = async (
  cy: cytoscape.Core,
  action: Array<ActionPostData>,
  store: Store,
  callback?: ActionCallback
): Promise<void> => {
  await fetchWithErrorHandling(
    `${url}/action-executions/`,
    {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(action),
    },
    store
  )
    .then(async (res) => {
      const data = await res.json();

      if (res.status === 200) {
        action.forEach((a) => {
          const actionExecResult = data[0];
          if (actionExecResult.statusCode !== 0 && callback) callback();
          store.pushActionLog({
            statusCode: actionExecResult.statusCode,
            name: a.name,
            date: new Date(),
            message: actionExecResult.message,
          });
          // This is tricky since it is possible that we execute many actions, therefore we have many exec results, possibly with different state strategies.
          // Handling of such case needs to be discussed first.
          handleActionExecResult(cy, actionExecResult, store);
        });
      }
    })
    .catch((res) => {
      console.error(res);
      store.setMessage({ type: "error", text: `Error ${404}` });
    });

  // updates list of viewModels
  const graphs = await getViewModels(store);
  if (graphs) {
    store.setGraphs(graphs);
  }
};

export const handlePostAction = (
  cy: cytoscape.Core,
  action: ActionDef,
  type: contextTypeEnum,
  store: Store,
  contextUuid?: string,
  args?: Array<{ name: string; value: any }>
): void => {
  const PostAction: ActionPostData = {
    name: action.name,
    uuid: uuidv4(),
    viewId: localStorage.getItem("SELECTED_GRAPH_ID") || "",
    actionUuid: action.uuid,
    contextUuid: contextUuid || localStorage.getItem("SELECTED_GRAPH_ID") || "",
    contextType: type,
    arguments: args || [],
  };
  postAction(cy, [PostAction], store, action.callback);
};

export const handlePostActions = (
  cy: cytoscape.Core,
  actions: Array<{
    action: ActionDef;
    type: contextTypeEnum;
    args?: Array<{ name: string; value: any }>;
    contextUuid?: string;
  }>,
  store: Store
): void => {
  const postActions: Array<ActionPostData> = [];
  actions.forEach((action) => {
    const pa: ActionPostData = {
      name: action.action.name,
      uuid: uuidv4(),
      viewId: localStorage.getItem("SELECTED_GRAPH_ID") || "",
      actionUuid: action.action.uuid,
      contextUuid: action.contextUuid || localStorage.getItem("SELECTED_GRAPH_ID") || "",
      contextType: action.type,
      arguments: action.args || [],
    };
    postActions.push(pa);
  });
  postAction(cy, postActions, store);
};
