import React from "react";
import { ActionDef } from "../../Models";
import PropertyContainer from "./PropertyContainer";
import PropertyItem from "./PropertyItem";
import { Observer } from "mobx-react-lite";
import { getIcon } from "../../style/Icons";
import { Store } from "../../store";

type Props = {
  store: Store;
  setAction(action: ActionDef): void;
};

const RightPanelDetails: React.FC<Props> = ({ store, setAction }) => {
  return (
    <Observer>
      {() => (
        <>
          {store.selectedElement && (
            <>
              <PropertyContainer
                title={`${
                  store.selectedElement.type === "NODE"
                    ? "Node"
                    : store.selectedElement.type === "REL"
                    ? "Relationship"
                    : ""
                } details`}
                isVisible={true}
              >
                <PropertyItem>
                  <span>
                    <strong>uuid: </strong> {store.selectedElement.uuid}
                  </span>
                </PropertyItem>
                <PropertyItem>
                  <span>
                    <strong>label: </strong> {store.selectedElement.label}
                  </span>
                </PropertyItem>
              </PropertyContainer>
              <PropertyContainer title="Properties" isVisible={true}>
                {store.selectedElement.properties && store.selectedElement.properties.length > 0 ? (
                  <table style={{ width: "100%", paddingLeft: 20, paddingRight: 20 }}>
                    <thead>
                      <tr>
                        <th style={{ textAlign: "left" }}>name</th>
                        <th style={{ textAlign: "left" }}>value</th>
                      </tr>

                      {store.selectedElement.properties.map((prop) => (
                        <tr key={prop.name.toString()}>
                          <td style={{ background: "var(--color-surface-1)" }}>
                            <input style={{ width: "100%" }} value={prop.name} readOnly={true} />
                          </td>
                          <td style={{ background: "var(--color-surface-1)" }}>
                            <input style={{ width: "100%" }} value={prop.value.toString()} readOnly={true} />
                          </td>
                        </tr>
                      ))}
                    </thead>
                  </table>
                ) : (
                  <></>
                )}
              </PropertyContainer>
              <PropertyContainer title={"Action list"} isVisible={true}>
                {store.selectedElement?.actionGroups && store.selectedElement.actionGroups.length ? (
                  store.selectedElement.actionGroups.map((group) => (
                    <div
                      style={{ margin: "0px 20px 10px 20px", border: "1px solid var(--color-border)" }}
                      key={group.name}
                    >
                      <PropertyContainer title={group.name} isVisible={true}>
                        {group.actions && group.actions.length ? (
                          group.actions.map(
                            (action) =>
                              !action.hidden && (
                                <React.Fragment key={action.uuid}>
                                  <PropertyItem>
                                    <div
                                      className="c-NodeStyle c-NodeStyle__rel"
                                      onClick={() => setAction(action)}
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
                                      {action.icon && (
                                        <div style={{ height: 20, width: 20 }}>{getIcon(action.icon)}</div>
                                      )}
                                      <p style={{ color: "var(--color-btn-light)", marginLeft: 5 }}>{action.name}</p>
                                    </div>
                                  </PropertyItem>
                                </React.Fragment>
                              )
                          )
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
            </>
          )}
        </>
      )}
    </Observer>
  );
};

export default RightPanelDetails;
