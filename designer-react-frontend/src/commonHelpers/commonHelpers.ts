import { ActionDef, ActionGroup } from "../Models";
import ReactDOM from "react-dom";

export const toHex = (int: number): string => {
  const hex = int.toString(16);
  return hex.length === 1 ? "0" + hex : hex;
};

export const parseColor = (color: number[]): string => {
  if (color !== undefined) return "#" + color.slice(0, 3).map(toHex).join("");
  return "";
};
export const createContentFromComponent = (component: JSX.Element): HTMLDivElement => {
  const dummyDomEle = document.createElement("div");
  ReactDOM.render(component, dummyDomEle);
  document.body.appendChild(dummyDomEle);
  return dummyDomEle;
};

export const transformToActionGroups = (ac: Array<ActionDef>): Array<ActionGroup> => {
  const actions = ac;
  const actionGroups: Array<ActionGroup> = [];
  if (actions.length) {
    const groupActions = actions.filter((x) => Boolean(x.group));
    if (groupActions.length) {
      for (let i = 0; i < groupActions.length; i++) {
        const groupIndex = actionGroups?.findIndex((x) => x.name === groupActions[i].group);
        if (groupIndex !== -1 && groupActions[i].group) {
          actionGroups[groupIndex] = {
            ...actionGroups[groupIndex],
            actions: [...actionGroups[groupIndex]?.actions, groupActions[i]],
          };
        } else {
          actionGroups.push({ name: groupActions[i].group || "", actions: [groupActions[i]] });
        }
      }
    }
  }
  // const otherActions = actions.filter((x) => x.group === null);
  // if (otherActions.length) {
  //   actionGroups.push({ name: "Other", actions: [] });
  //   for (let i = 0; i < otherActions.length; i++) {
  //     actionGroups[actionGroups.length - 1] = {
  //       ...actionGroups[actionGroups.length - 1],
  //       actions: [...actionGroups[actionGroups.length - 1]?.actions, otherActions[i]],
  //     };
  //   }
  // }
  return actionGroups.sort((a, b) => a.name.localeCompare(b.name));
};
