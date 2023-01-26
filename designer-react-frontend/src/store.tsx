import React from "react";
import { useLocalObservable } from "mobx-react-lite";
import { makeAutoObservable, runInAction } from "mobx";
import { ActionLogItem, Config, Message, Relationship, Node, ViewModelData, ViewModelListItem, GraphData } from "./Models";
import { config } from "./components/ui/GraphConfig";
import { unionBy, differenceBy } from "lodash";

export class Store {
  constructor() {
    makeAutoObservable(this);
  }

  public menuItems: any = [];
  public graph: ViewModelData = {
    viewModelDef: { uuid: "", name: "" },
    nodes: [],
    relationships: [],
    actionDefs: [],
    actionGroups: [],
  };

  // This property temporarily save positions of the nodes so that can be lazily updated later
  public diffGraph: GraphData = {
    nodes: [],
    relationships: [],
  };

  public selectedElement: Node | Relationship | undefined;

  public actionLog: Array<ActionLogItem> = [];

  public graphs: Array<ViewModelListItem> = [];

  public config: Config = config;

  public message: Message | undefined = undefined;

  public clearNewMarks(): void {
    return runInAction(() => {
      this.graph = {
        ...this.graph,
        nodes: this.graph.nodes.map((n) => ({
          ...n,
          isNew: false
        }))
      };
    });
  }

  public setGraph(graph: ViewModelData): void {
    return runInAction(() => {
      this.diffGraph = {nodes: [],relationships: [],};
      this.graph = graph;
    });
  }

  public appendGraph(nodes: [], relationships: []): void {
    return runInAction(() => {
      const appendedGraph = {
        ...this.graph,
        nodes: unionBy(nodes, unionBy(this.diffGraph.nodes, this.graph.nodes, "uuid"), "uuid"),
        relationships: unionBy(relationships, unionBy(this.diffGraph.relationships, this.graph.relationships, "uuid"), "uuid"),
      };
      this.graph = appendedGraph;
      this.diffGraph = {nodes: [],relationships: [],};
    });
  }

  public removeFromGraph(nodes: [], relationships: []): void {
      return runInAction(() => {
        const differenceGraph = {
          ...this.graph,
          nodes: differenceBy(unionBy(this.diffGraph.nodes, this.graph.nodes, "uuid"), nodes,  "uuid"),
          relationships: differenceBy(unionBy(this.diffGraph.relationships, this.graph.relationships, "uuid"), relationships, "uuid"),
        };
        this.graph = differenceGraph;
        this.diffGraph = {nodes: [],relationships: [],};
      });
  }

  public appendDiffGraph(nodes: [], relationships: []): void {
      return runInAction(() => {
        const appendedGraph = {
          ...this.diffGraph,
          nodes: unionBy(nodes, this.diffGraph.nodes, "uuid"),
          relationships: unionBy(relationships, this.diffGraph.relationships, "uuid"),
        };
        this.diffGraph = appendedGraph;
      });
  }

  public setSelectedElement(selectedElement: Node | Relationship | undefined): void {
    return runInAction(() => {
      this.selectedElement = selectedElement;
    });
  }

  public setMenuItems(menuItems: Array<any>): void {
    return runInAction(() => {
      this.menuItems = [...menuItems];
    });
  }

  public setMessage(message: Message | undefined): void {
    return runInAction(() => {
      this.message = message;
    });
  }

  public setConfig(config: Config): void {
    return runInAction(() => {
      this.config = config;
    });
  }

  public setGraphs(graphs: Array<ViewModelListItem>): void {
    return runInAction(() => {
//       this.diffGraph = {nodes: [],relationships: [],};
      this.graphs = graphs;
    });
  }

  public pushActionLog(action: ActionLogItem): void {
    return runInAction(() => {
      this.actionLog = [...this.actionLog, action];
    });
  }

  public resetActionLog(): void {
    return runInAction(() => {
      this.actionLog = [];
    });
  }
}

export class RootStore {
  store: Store;

  constructor() {
    this.store = new Store();
    makeAutoObservable(this);
  }
}

function createStore(): RootStore {
  return new RootStore();
}

const rootStoreContext = React.createContext<RootStore | null>(null);

export const StoreProvider = ({ children }: { children: React.ReactElement }): JSX.Element => {
  const rootStore = useLocalObservable(createStore);
  return <rootStoreContext.Provider value={rootStore}>{children}</rootStoreContext.Provider>;
};

export const useRootStore = (): RootStore => {
  const rootStore = React.useContext(rootStoreContext);
  if (!rootStore) {
    throw new Error("useStore must be used within a StoreProvider.");
  }
  return rootStore;
};

export const useStore = (): Store => {
  const rootStore = React.useContext(rootStoreContext);
  if (!rootStore) {
    throw new Error("useStore must be used within a StoreProvider.");
  }
  return rootStore.store;
};
