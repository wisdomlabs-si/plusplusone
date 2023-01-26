import React, { useEffect, useState, useCallback } from "react";
import Header from "../components/Header";
import LeftPanel from "../components/LeftPanel";
import RightPanel from "../components/RightPanel";
import { ViewModelListItem, ActionDef } from "../Models";
import { getViewModelData, getViewModels } from "../api/graphDesignerApi";
import { transformToActionGroups } from "../commonHelpers/commonHelpers";
import { Observer } from "mobx-react-lite";
import { useStore } from "../store";
import ActionModal from "../components/ui/ActionModal";
import Graph from "../components/Graph";
import MessageBox from "../components/ui/MessageBox";
import "../style/contextMenu.css";
// import { mockData } from "../constants/mockdata";
import Split from 'react-split'

const Main = (): JSX.Element => {
  const store = useStore();
  const [cy, setCy] = useState<cytoscape.Core | undefined>(undefined);
  const getGraphInit = async (graphs: Array<ViewModelListItem>): Promise<void> => {
    let id = localStorage.getItem("SELECTED_GRAPH_ID");
    if (!id) {
      id = graphs[0].uuid;
      localStorage.setItem("SELECTED_GRAPH_ID", graphs[0].uuid);
    }
    // const graphData = mockData
    const graphData = await getViewModelData(id, store);
    if (graphData && graphData !== null) {
      store.setGraph({ ...graphData, actionGroups: transformToActionGroups(graphData.actionDefs) });
      return;
    }
    store.setMessage({ text: "View model returned null", type: "error" });
    store.setGraph({
      viewModelDef: { uuid: "", name: "" },
      nodes: [],
      relationships: [],
      actionDefs: [],
      actionGroups: [],
    });
  };

  const getGraphs = useCallback(async () => {
    const result = await getViewModels(store);
    if (result) {
      store.setGraphs(result);
      getGraphInit(result);
    }
  }, [store]);

  useEffect(() => {
    getGraphs();
  }, [getGraphs]);

  const [action, setAction] = useState<ActionDef | undefined>();

  // Setting the sidebar default values

  function getSizesForSidebar() : number[] | undefined {
    const sizes_string: string | null  = localStorage.getItem('split-sizes')

    if (sizes_string) {
       return JSON.parse(sizes_string)
    }
    return [20, 60, 20] // default sizes
  }

  const sizes: number[] | undefined = getSizesForSidebar();

  return (
    <Observer>
      {() => (
        <div
          key={JSON.stringify(store.graph)}
          style={{ width: "100vw", height: "100vh", background: "var(--color-surface-2)" }}
        >
          {store.message && <MessageBox />}
          {action?.uuid ? <ActionModal setAction={setAction} action={action} cy={cy as cytoscape.Core} /> : <></>}
          <div style={{ height: 46, width: "100%" }}>
            <Header graphs={store.graphs} />
          </div>
          <Split
            sizes={sizes}
            snapOffset={0}
            gutterSize={5}
            maxSize={[380, Infinity, 380]}
            style={{ width: "100%", height: "calc(100vh - 46px)", display: "flex" }}
            onDragEnd={(sizes) => {
                                    localStorage.setItem('split-sizes', JSON.stringify(sizes));
                                  }}
          >
            <div style={{ flexShrink: "0", overflowY: "auto", borderRight: "1px solid var(--color-border)" }}>
              <LeftPanel setAction={setAction} store={store} cy={cy as cytoscape.Core} />
            </div>
            <div style={{ flexShrink: "0", background: "var(--color-surface-1)" }}>
              {store.graph.viewModelDef.uuid && <Graph setAction={setAction} setCy={setCy} />}
            </div>
            <div
              key={JSON.stringify(store.selectedElement)}
              style={{ borderLeft: "1px solid var(--color-border)", overflowY: "auto" }}
            >
              <RightPanel store={store} setAction={setAction} />
            </div>
          </Split>
        </div>
      )}
    </Observer>
  );
};

export default Main;
