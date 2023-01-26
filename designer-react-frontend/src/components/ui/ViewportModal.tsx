import React, { useRef, useCallback } from "react";
import { Store } from "../../store";
import { ActionDef, ActionPostData, contextTypeEnum } from "../../Models";
import { postAction } from "../../api/graphDesignerApi";
import { v4 as uuidv4 } from "uuid";
import { getIcon } from "../../style/Icons";
import useClickOutside from "../../commonHelpers/useClickOutside";

type Props = {
  setAction(action: ActionDef): void;
  store: Store;
  cy: cytoscape.Core;
};

const ViewportModal: React.FC<Props> = ({ setAction, store, cy }) => {
  const handleRemove = () => {
    document.getElementById("viewport-modal")?.parentElement?.remove();
  };

  const popover = useRef<HTMLDivElement>(null);
  const close = useCallback(() => handleRemove(), []);
  useClickOutside(popover, close);

  const handlePostAction = (cy: cytoscape.Core, action: ActionDef, args?: Array<{ name: string; value: any }>) => {
    if (args && args.length === 0) {
      const PostAction: ActionPostData = {
        name: action.name,
        uuid: uuidv4(),
        viewId: localStorage.getItem("SELECTED_GRAPH_ID") || "",
        actionUuid: action.uuid,
        contextUuid: localStorage.getItem("SELECTED_GRAPH_ID") || "",
        contextType: contextTypeEnum.VIEW,
        arguments: args || [],
      };
      postAction(cy, [PostAction], store);
      return;
    }
    setAction(action);
  };

  return (
    <div ref={popover} id={"viewport-modal"}>
      {store.graph?.actionGroups?.length > 0 ? (
        <div style={{ minWidth: 150, paddingLeft: 15, paddingRight: 15 }} className="custom-context-menu">
          {store.graph.actionGroups.map((group) => (
            <div style={{ width: "100%" }} key={group.name}>
              <div
                style={{ fontWeight: 800, padding: 5, marginLeft: 20, marginRight: 20 }}
                className="viewport-modal-item"
              >
                {group.name}
              </div>
              <ul>
                {group.actions && group.actions.length ? (
                  group.actions.map((action) => (
                    <li
                      className="c-NodeStyle__rel"
                      style={{ marginBottom: 10, padding: 8, paddingLeft: 20, paddingRight: 20, display: "flex" }}
                      onClick={() => handlePostAction(cy, action)}
                      key={action.uuid}
                    >
                      {action.icon ? (
                        <div style={{ width: 20, height: 20, color: "var(--color-secondary)" }}>
                          {getIcon(action.icon, "var(--color-input-light)")}
                        </div>
                      ) : (
                        <></>
                      )}
                      &nbsp;
                      {action.name}
                    </li>
                  ))
                ) : (
                  <></>
                )}
              </ul>
            </div>
          ))}
        </div>
      ) : (
        <></>
      )}
    </div>
  );
};

export default ViewportModal;
