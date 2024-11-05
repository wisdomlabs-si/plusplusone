import React, { useState } from "react";
import { ActionDef } from "../../Models";
import AutoComplete from "./AutoComplete";
import ColorPicker from "./ColorPicker";
import DropDown from "./DropDown";

type Props = {
  prop: { name: string; widget: string, initValues: [string]};
  defaultValue: any;
  setArgsState({ ...args }): void;
  argsState: any;
  action: ActionDef;
  doFocus: boolean;
  visible: boolean;
  onSubmit: () => void;
};

const ActionProp: React.FC<Props> = ({ prop, defaultValue, argsState, setArgsState, action, doFocus, visible=true, onSubmit }) => {
  const [value, setValue] = useState(argsState[prop.name] || defaultValue || "");
  const handleUpdate = (value: string | number| boolean) => {
    const tempValue = value;
    setArgsState({ ...argsState, [prop.name]: tempValue });
    setValue(tempValue as any);
  };

  const handleUpdateColor = (value: string) => {
    setValue(value);
    handleUpdate(value);
  };

  return (
    <div
      style={!visible ? {display: "none"} : { marginTop: 20, width: "100%", display: "flex", justifyContent: "space-between", alignItems: "center"}}
    >
      <label>{prop.name}</label>
      <div></div>
      {prop.widget === "colorPicker" ? (
        <div style={{ marginLeft: 52, width: 170 }}>
          <ColorPicker
            handleUpdate={handleUpdateColor}
            selectedColor={{ key: "color", value: (value as string) || "#FFFFFF" }}
          />
        </div>
      ) : prop.widget === "iconPicker" ? (
        <AutoComplete value={value as string} handleUpdate={handleUpdate} />
      ) : prop.widget === "textField" ? (
        <input
          style={{ marginLeft: 20, width: 255 }}
          type="text"
          placeholder="value"
          value={value}
          onChange={(e) => {
            setValue(e.target.value);
            handleUpdate(e.target.value);
          }}
          autoFocus={doFocus}
        />
      ) : prop.widget === "numberField" ? (
        <input
          style={{ marginLeft: 20, width: 255, border: "1px solid var(--color-border)" }}
          type="number"
          placeholder="0"
          value={value}
          onChange={(e) => {
            setValue(e.target.value);
            handleUpdate(e.target.value);
          }}
          autoFocus={doFocus}
        />
      ) : prop.widget === "textArea" ? (
        <textarea
          style={{ marginLeft: 20, width: 650 }}
          rows={10}
          placeholder="value"
          value={value}
          onChange={(e) => {
            setValue(e.target.value);
            handleUpdate(e.target.value);
          }}
          onKeyDown={(e) => {
            if (e.key === 'Enter') {
              if (e.shiftKey) {
                // Allow new line with Shift+Enter
                return;
              } else {
                // Regular Enter submits
                e.preventDefault();
                e.stopPropagation();
                onSubmit();
              }
            }
          }}
          autoFocus={doFocus}
        />
      ) : prop.widget === "dropDown" ? (
         <DropDown value={value} handleUpdate={handleUpdate} options={prop.initValues}/>
      ): prop.widget === "checkBox" ? (
        <input
          style={{border: "1px solid var(--color-border)" }}
          type="checkbox"
          onChange={(e) => {
            setValue(e.target.checked);
            handleUpdate(e.target.checked);
          }}
          autoFocus={doFocus}
        />
        ) :(
        <input
          style={{ marginLeft: 20, width: 255 }}
          type="text"
          placeholder="value"
          value={value}
          onChange={(e) => {
            setValue(e.target.value);
            handleUpdate(e.target.value);
          }}
          autoFocus={doFocus}
        />
      )}
    </div>
  );
};
export default ActionProp;
