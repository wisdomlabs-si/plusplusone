import React from "react";
import { ActionDef } from "../Models";
import { Store } from "../store";
import RightPanelDetails from "./ui/RightPanelDetails";
import Tabs from "./ui/Tabs";

type Props = {
  setAction(action: ActionDef): void;
  store: Store;
};

const RightPanel: React.FC<Props> = ({ store, setAction }) => {
  const tabs: { id: string; title: string; content: JSX.Element }[] = [
    {
      id: "1",
      title: "Details",
      content: <RightPanelDetails store={store} setAction={setAction} />,
    },
  ];
  return (
    <div key={JSON.stringify(store.selectedElement)}>
      <Tabs tabItems={tabs} />
    </div>
  );
};
export default RightPanel;
