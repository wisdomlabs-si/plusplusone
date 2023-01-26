import React from "react";

type TabProps = {
  onClick(...args: any): void;
  selected: boolean;
  name: string;
  icon?: JSX.Element;
};

const Tab: React.FC<TabProps> = ({ name, onClick, selected, icon }) => (
  <button className={` c-Tabs__tab ${selected && "c-Tabs__tab--selected"}`} onClick={onClick} title={name}>
    {icon ? <span className={"icon"}>{icon}</span> : name}
  </button>
);

export default Tab;
