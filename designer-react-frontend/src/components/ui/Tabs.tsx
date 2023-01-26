import React, { useState } from "react";
import Tab from "./Tab";

export type TabType = {
  id: string;
  title: string;
  content: JSX.Element;
  icon?: JSX.Element | undefined;
};

type TabsProps = {
  className?: string;
  tabItems: Array<TabType>;
  actions?(...args: any): void;
  style?: React.CSSProperties;
  actionArgs?: any;
};

const Tabs: React.FC<TabsProps> = ({ className, tabItems, style, actions, actionArgs }) => {
  const tabContent = (content: JSX.Element) => {
    return content;
  };
  const [active, setActive] = useState(tabItems[0].id || "");

  const handleAction = (id: string) => {
    if (actions) actions(...actionArgs);
    setActive(id);
  };

  return (
    <>
      <div style={style && style} className={` c-Tabs ${className}`}>
        {tabItems &&
          tabItems.map((tab: { id: string; title: string; content: JSX.Element; icon?: JSX.Element }) => (
            <React.Fragment key={tab.id}>
              <Tab
                key={tab.id}
                onClick={() => handleAction(tab.id)}
                selected={active === tab.id}
                name={tab.title}
                icon={tab.icon && tab.icon}
              />
            </React.Fragment>
          ))}
      </div>
      <div className="c-Tabs__sections">
        {tabItems &&
          tabItems.map((tab: { id: string; title: string; content: JSX.Element }) => (
            <div key={`${tab.id} ${tab.title}`}>{tab.id === active && tabContent(tab.content)}</div>
          ))}
      </div>
    </>
  );
};

export default Tabs;
