import React, { useCallback, useEffect, useRef, useState } from "react";
import { handlePostAction } from "../../api/graphDesignerApi";
import useClickOutside from "../../commonHelpers/useClickOutside";
import { ActionDef, contextTypeEnum } from "../../Models";
import { useStore } from "../../store";
import ActionProp from "./ActionProp";
import Button from "./Button";

type Props = {
  action: ActionDef;
  setAction(action?: ActionDef): void;
  cy: cytoscape.Core;
};

type ReturnObject = { [key: string]: any };


const paramsToObject = (action: ActionDef, properties?: ReadonlyArray<any>): ReturnObject => {
  const obj: ReturnObject = {};

  //    First set initial values if we have it for this kind of widget - if we have value it will be re-written later
  action.params.forEach((el) => {
    const defaultValue =   el.widget === "checkBox"
                           ? false
                           : el.widget === "numberField"
                           ? 0
                           : el.widget === "colorPicker"
                           ? "#FFFFFF"
                           : undefined;
    obj[el.name] = defaultValue;
  });

  //    Set initial Values: if function return init values for widget
  action.params.forEach((el) => (obj[el.name] = el.initValues ? el.initValues[0] : obj[el.name]));
  if (action.args) {
    Object.keys(action.args)?.forEach((x) => (obj[x] = action.args[x]));
  }

  //    HACK: if this is set properties widget we know values from properties.
  const splitActionName = action.name.split(" ");
  if (splitActionName[0] === "Edit" && splitActionName[1] === "property:") {
    obj["value"] = properties!.find(e => e.name === splitActionName[2])?.value
  }

  return obj;
};

const ActionModal: React.FC<Props> = ({ action, setAction, cy }) => {
  const store = useStore();
  const [argsState, setArgsState] = useState<any>(paramsToObject(action, store.selectedElement?.properties));
  const popover = useRef<HTMLDivElement>(null);
  const close = useCallback(() => {
    if (action.callback) action.callback();
    setAction();
  }, []);

  useClickOutside(popover, close);

  const handleUpdate = () => {
    const args = Object.keys(argsState).map((x) => {
      return {
        name: x,
        value: argsState[x],
      };
    });

    handlePostAction(
      cy,
      action,
      store.selectedElement?.type || contextTypeEnum.VIEW,
      store,
      store.selectedElement?.uuid,
      args
    );

    setAction();
  };

  const handleKeyPress = (event: React.KeyboardEvent<HTMLDivElement>) => {
    const target = event.target as HTMLElement;

    // Skip handling if the event comes from a textarea
    if (target instanceof HTMLTextAreaElement) {
      return;
    }

    if (event.code === "Enter" || event.code === "NumpadEnter") {
      handleUpdate();
    }
    if (event.code === "Escape") {
      event.preventDefault();
      close();
    }
  };

  useEffect(() => {
    if (action.params.length === 0) {
      handlePostAction(cy, action, store.selectedElement?.type || contextTypeEnum.VIEW, store, store.selectedElement?.uuid);
      close();
    }
  }, []);

  // get the name of the Prop that need to be focused
  let focusProp = action.params.length > 0 ? action.params[0] : null;
  let focusPropName = !focusProp ? null : focusProp.name;
  return (
    <div
      onKeyDown={handleKeyPress}
      className="action-modal"
      style={{
        position: "fixed",
        display: "flex",
        justifyContent: "center",
        alignItems: "center",
        zIndex: 9999,
        top: 0,
        left: 0,
        width: "100vw",
        height: "100vh",
      }}
    >
      <div
        ref={popover}
        style={{
          width: 800,
          padding: 20,
          background: "var(--color-surface-2)",
          borderRadius: 3,
          border: "1px solid var(--color-border)",
          boxShadow: "0px 0px 8px 0px rgb(0, 0, 0, 0.12),0px 8px 8px 0px rgb(0, 0, 0, 0.24)",
        }}
      >
        <h3 style={{ fontSize: "1.2em" }}>{action.name}</h3>
        {action?.params.map((x) => (
          <div style={{ width: 750 }} key={x.name}>
            <ActionProp
              argsState={argsState}
              setArgsState={setArgsState}
              prop={x}
              action={action}
              onSubmit={handleUpdate}
              visible={!(action.name === "addRelationship" && x.name === "endNodeUuid")}
              doFocus={x.name == focusPropName}
              defaultValue={
                action.name === "addRelationship" && x.name === "endNodeUuid"
                  ? action?.args?.endNodeUuid
                  : x.widget === "textField"
                  ? ""
                  : x.widget === "checkBox"
                  ? false
                  : x.widget === "numberField"
                  ? 0
                  : x.widget === "colorPicker"
                  ? "#FFFFFF"
                  : x.widget === "textArea"
                  ? ""
                  : ""
              }
            />
          </div>
        ))}
        <div style={{ display: "flex", marginTop: 20, width: 490, justifyContent: "end" }}>
          <Button
            disabled={
              (argsState &&
                Object.keys(argsState).length === 0 &&
                Object.getPrototypeOf(argsState) === Object.prototype) ||
              Object.keys(argsState).some((x) => argsState[x] === undefined)
            }
            label="Execute"
            kind="primary"
            onClick={() => handleUpdate()}
          />
          <Button label="Cancel" kind="ghost" onClick={close} />
        </div>
      </div>
    </div>
  );
};
export default ActionModal;
