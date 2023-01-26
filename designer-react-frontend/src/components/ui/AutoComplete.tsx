import React, { useState, useRef, useCallback, useEffect } from "react";
import useClickOutside from "../../commonHelpers/useClickOutside";
import { getIcon, iconList } from "../../style/Icons";

type Props = {
  value: string;
  handleUpdate(value: string): void;
};

const AutoComplete: React.FC<Props> = ({ value, handleUpdate }) => {
  const [focus, setFocus] = useState(false);
  const [selected, setSelected] = useState(-1);
  const popover = useRef<HTMLDivElement>(null);
  const close = useCallback(() => {
    setFocus(false);
    setSelected(-1);
  }, []);
  useClickOutside(popover, close);

  const handleEvent = (e: KeyboardEvent) => {
    switch (e.key) {
      case "ArrowDown": {
        setSelected(selected + 1);
        break;
      }
      case "ArrowUp": {
        setSelected(selected - 1);
        break;
      }
      case "Enter": {
        const icons = iconList.filter((icon: string) => icon.includes(value));
        if (icons[selected]) {
          handleUpdate(icons[selected]);
          setSelected(-1);
          setFocus(false);
        }
        break;
      }
      case "Backspace": {
        setFocus(true);
        break;
      }
    }
  };

  useEffect(() => {
    window.addEventListener("keyup", handleEvent);
    return () => {
      window.removeEventListener("keyup", handleEvent);
    };
  }, [selected, setSelected]);

  return (
    <div style={{ marginLeft: 0 }} ref={popover}>
      <div style={{ display: "flex", height: 30 }}>
        <div
          style={{
            width: 30,
            height: 30,
            color: "var(--color-highlight-50)",
            backgroundColor: "var(--color-highlight-50)",
            borderRadius: 5,
          }}
        >
          {getIcon(value, "white")}
        </div>
        <input
          style={{ width: 125, border: "1px solid var(--color-border)" }}
          onFocus={() => setFocus(true)}
          value={value}
          onChange={(e) => {
            handleUpdate(e.target.value);
            setSelected(-1);
          }}
        />
      </div>
      {focus && (
        <div
          style={{
            marginLeft: 30,
            position: "absolute",
            minWidth: 140,
            maxHeight: 300,
            overflowY: "auto",
            zIndex: 99,
            background: "var(--color-surface-1)",
            border: "1px solid var(--color-border)",
            cursor: "pointer",
          }}
        >
          <ul>
            {iconList.filter((icon: string) => icon.includes(value)).length > 0 &&
              iconList
                .filter((icon: string) => icon.includes(value))
                .map((icon: string, i: number) => (
                  <div key={icon} className="autocomplete">
                    <li
                      style={{
                        display: "flex",
                        alignItems: "center",
                        backgroundColor: selected === i ? "var(--color-highlight-50)" : "inherit",
                      }}
                      key={icon}
                      onClick={() => {
                        handleUpdate(icon);
                        setSelected(-1);
                        setFocus(false);
                      }}
                    >
                      <div
                        style={{ width: 20, height: 20, color: selected === i ? "var(--color-highlight-50)" : "white" }}
                      >
                        {getIcon(icon, "black")}
                      </div>
                      {icon}
                    </li>
                  </div>
                ))}
          </ul>
        </div>
      )}
    </div>
  );
};

export default AutoComplete;
