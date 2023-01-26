import React from "react";
import { ActionDef } from "../Models";
import { Store } from "../store";
import ActionLogTab from "./ui/ActionLogTab";
import LeftPanelView from "./ui/LeftPanelView";
import Tabs from "./ui/Tabs";

type Props = {
  cy: cytoscape.Core;
  store: Store;
  setAction(action: ActionDef): void;
};

const LeftPanel: React.FC<Props> = ({ cy, store, setAction }) => {
  const tabs: { id: string; title: string; content: JSX.Element }[] = [
    {
      id: "1",
      title: "View Actions",
      content: <LeftPanelView store={store} setAction={setAction} cy={cy} />,
    },
    // {
    //   id: "2",
    //   title: "Layouts",
    //   content: <LayoutTab store={store} cy={cy} />,
    // },
    {
      id: "2",
      title: "Log",
      content: <ActionLogTab />,
    },
  ];
  return <Tabs tabItems={tabs} />;
};
export default LeftPanel;
