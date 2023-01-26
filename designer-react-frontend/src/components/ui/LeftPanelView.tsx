import React from "react";
import { ActionDef, ActionPostData, contextTypeEnum } from "../../Models";
import PropertyContainer from "./PropertyContainer";
import PropertyItem from "./PropertyItem";
import { v4 as uuidv4 } from "uuid";
import { postAction } from "../../api/graphDesignerApi";
import { Store } from "../../store";
import { Observer } from "mobx-react-lite";
import { getIcon } from "../../style/Icons";

type Props = {
  setAction(action: ActionDef): void;
  store: Store;
  cy: cytoscape.Core;
};

const LeftPanelView: React.FC<Props> = ({ setAction, store, cy }) => {
  const handlePostAction = (cy: cytoscape.Core, action: ActionDef, args?: Array<{ name: string; value: any }>) => {
    if (args && args.length === 0) {
      const PostAction: ActionPostData = {
        name: action.name,
        uuid: uuidv4(),
        viewId: localStorage.getItem("SELECTED_GRAPH_ID") || "",
        actionUuid: action.uuid,
        contextUuid: store.selectedElement?.uuid || localStorage.getItem("SELECTED_GRAPH_ID") || "",
        contextType: contextTypeEnum.VIEW,
        arguments: args || [],
      };
      postAction(cy, [PostAction], store);
      return;
    }
    setAction(action);
  };

  return (
    <Observer>
      {() => (
        <PropertyContainer title={"Action list"} isVisible={true}>
          {store.graph?.actionGroups?.length > 0 ? (
            store.graph.actionGroups.map((group) => (
              <div style={{ margin: "0px 20px 10px 20px", border: "1px solid var(--color-border)" }} key={group.name}>
                <PropertyContainer title={group.name} isVisible={true}>
                  {group.actions && group.actions.length ? (
                    group.actions.map((action) => (
                      <React.Fragment key={action.uuid}>
                        <PropertyItem>
                          <div
                            className="c-NodeStyle c-NodeStyle__rel"
                            onClick={() => handlePostAction(cy, action)}
                            style={{
                              display: "flex",
                              alignItems: "center",
                              justifyContent: "left",
                              cursor: "pointer",
                              fontSize: "1.1em",
                              color: "var(--color-secondary)",
                              width: "auto",
                              minWidth: 170,
                              height: 30,
                            }}
                          >
                            {action.icon && <div style={{ height: 20, width: 20 }}>{getIcon(action.icon)}</div>}
                            <span style={{ marginLeft: 5, color: "var(--color-btn-light)", width: "auto" }}>
                              {action.name}
                            </span>
                          </div>
                        </PropertyItem>
                      </React.Fragment>
                    ))
                  ) : (
                    <></>
                  )}
                </PropertyContainer>
              </div>
            ))
          ) : (
            <></>
          )}
        </PropertyContainer>
      )}
    </Observer>
  );
};

export default LeftPanelView;
