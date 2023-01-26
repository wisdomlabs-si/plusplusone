import React, { useCallback, useRef, useState } from "react";
import { MdArrowDropDown } from "react-icons/md";
import { getViewModelData } from "../api/graphDesignerApi";
import { transformToActionGroups } from "../commonHelpers/commonHelpers";
import useClickOutside from "../commonHelpers/useClickOutside";
import { ViewModelListItem } from "../Models";
import { useStore } from "../store";
import { config } from "./ui/GraphConfig";

type Props = {
  graphs: Array<ViewModelListItem>;
};

const Header: React.FC<Props> = ({ graphs }) => {
  const store = useStore();
  const [graphId, setGraphId] = useState(localStorage.getItem("SELECTED_GRAPH_ID") || store.graph.viewModelDef.uuid);
  const [expanded, setExpanded] = useState(false);

  const popover = useRef<HTMLDivElement>(null);
  const close = useCallback(() => setExpanded(false), []);
  useClickOutside(popover, close);

  const handleChangeGraph = async (id: string) => {
    localStorage.setItem("SELECTED_GRAPH_ID", id);
    const graph = await getViewModelData(id, store);
    store.resetActionLog();
    setGraphId(id);
    if (graph && graph !== null) {
      store.setGraph({ ...graph, actionGroups: transformToActionGroups(graph.actionDefs) });
      store.setConfig(config);
      return;
    }
    store.setMessage({ text: "View model returned null", type: "error" });
    localStorage.removeItem("SELECTED_ELEMENT");
    store.setGraph({
      viewModelDef: { uuid: "", name: "" },
      nodes: [],
      relationships: [],
      actionDefs: [],
      actionGroups: [],
    });

    store.setSelectedElement(undefined);
  };

  return (
    <div style={{ width: "100%" }}>
      <div
        style={{
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center",
          padding: 5,
          borderBottom: "1px solid var(--color-border)",
        }}
      >
        <div style={{ width: "33.3%", display: "flex" }}>
          <div style={{ width: 295, display: "flex", justifyContent: "space-between", alignItems: "center" }}>
            <label style={{ height: 10 }}>View Models</label>
            <div
              style={{
                border: "1px solid var(--color-border)",
                width: 180,
                background: "var(--color-surface-1)",
                height: 35,
                padding: 5,
              }}
            >
              <div
                style={{
                  width: 180,
                  display: "flex",
                  alignItems: "center",
                  fontWeight: 600,
                  justifyContent: "space-between",
                  alignContent: "center",
                }}
                onClick={() => setExpanded(!expanded)}
              >
                <span>{graphs.find((x) => x.uuid === graphId)?.name || ""}</span>
                <div style={{ fontSize: "2em", marginRight: 10 }}>
                  <MdArrowDropDown />
                </div>
              </div>
              {expanded && graphs.length ? (
                <div
                  ref={popover}
                  style={{
                    position: "absolute",
                    marginTop: 6,
                    zIndex: 999,
                    border: "1px solid var(--color-border)",
                    width: 180,
                    marginLeft: -5,
                    background: "var(--color-surface-1)",
                  }}
                >
                  <ul style={{ padding: 5, cursor: "pointer" }}>
                    {graphs &&
                      graphs.length > 0 &&
                      graphs.map((x) => (
                        <li key={x.name} className="headerItem" onClick={() => handleChangeGraph(x.uuid)}>
                          {x.name}
                        </li>
                      ))}
                  </ul>
                </div>
              ) : (
                <></>
              )}
            </div>
          </div>
        </div>
        <div style={{ width: "33.3%", display: "flex", justifyContent: "center" }}>
          <h1>Morpheus Graph Designer - {store.graph.viewModelDef.name}</h1>
        </div>
        <div style={{ width: "33.3%" }}></div>
      </div>
    </div>
  );
};

export default Header;
