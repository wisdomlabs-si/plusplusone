import { Observer } from "mobx-react-lite";
import React from "react";
import { useStore } from "../../store";
import moment from "moment";

const ActionLogTab = (): JSX.Element => {
  const store = useStore();
  return (
    <Observer>
      {() => (
        <div style={{ borderBottom: "1px solid var(--color-border)" }}>
          <table style={{ width: "100%" }}>
            <thead>
              <tr style={{ textAlign: "left" }}>
                <th style={{ paddingLeft: 5, paddingRight: 5 }}>timestamp</th>
                <th style={{ paddingLeft: 5, paddingRight: 5 }}>action</th>
                <th style={{ paddingLeft: 5, paddingRight: 5 }}>status</th>
                <th style={{ paddingLeft: 5, paddingRight: 5 }}>message</th>
              </tr>
            </thead>
            <tbody>
              {store.actionLog && store.actionLog.length > 0 ? (
                store.actionLog.map((actionLog, i) => (
                  <tr
                    key={i}
                    style={{
                      background: actionLog.statusCode < 400 ? "var(--color-surface-1)" : "var(--color-negative)",
                      color: actionLog.statusCode < 400 ? "var(--color-text)" : "white",
                      padding: 5,
                    }}
                  >
                    <td style={{ paddingLeft: 5, paddingRight: 5 }}>
                      {moment(actionLog.date).format("DD/MM/YYYY HH:mm")}{" "}
                    </td>
                    <td style={{ paddingLeft: 5, paddingRight: 5 }}>{actionLog.name}</td>
                    <td style={{ paddingLeft: 5, paddingRight: 5 }}>{actionLog.statusCode}</td>
                    <td style={{ paddingLeft: 5, paddingRight: 5 }}>{actionLog.message}</td>
                  </tr>
                ))
              ) : (
                <></>
              )}
            </tbody>
          </table>
        </div>
      )}
    </Observer>
  );
};
export default ActionLogTab;
