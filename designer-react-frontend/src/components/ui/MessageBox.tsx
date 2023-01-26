import { Observer } from "mobx-react-lite";
import React, { useEffect } from "react";
import { useStore } from "../../store";

const MessageBox = (): JSX.Element => {
  const store = useStore();
  useEffect(() => {
    setTimeout(() => store.setMessage(undefined), 5000);
  }, [store]);
  return (
    <Observer>
      {() => (
        <div
          style={{
            position: "fixed",
            bottom: 10,
            width: 400,
            marginLeft: "calc(50vw - 157.5px)",
            marginRight: "calc(50vw - 157.5px)",
            zIndex: 10000,
            background: "var(--color-surface-2)",
            border: "1px solid",
            borderColor: !store.message?.type
              ? "var(--color-border)"
              : store.message.type === "success"
              ? "var(--color-positive"
              : store.message.type === "error"
              ? "var(--color-negative)"
              : "var(--color-border)",
            padding: 15,
            borderRadius: 5,
            boxShadow: "0px 0px 8px 0px rgb(0, 0, 0, 0.12),0px 8px 8px 0px rgb(0, 0, 0, 0.24)",
          }}
        >
          <p style={{ fontWeight: 600 }}>{store.message?.text}</p>
        </div>
      )}
    </Observer>
  );
};
export default MessageBox;
