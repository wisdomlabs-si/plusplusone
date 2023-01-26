import { Relationship } from "../../Models";
import { getIcon } from "../../style/Icons";
import { renderToString } from "react-dom/server";

const EdgeHtmLabel = (edge: Relationship): string => {
  return edge.caption
    ? `
       <div id="${edge.uuid}" style="display: flex; font-size: 1.2em; align-content: center; color: ${
        edge.color
      }; background-color: var(--color-surface-1);">
       ${
         edge.icon
           ? `<div style="color: var(--color-surface-1); margin-left: auto; margin-right: auto; width: 20px; height:20px;">${renderToString(
               getIcon(edge.icon, edge.color)
             )}</div>`
           : ""
       } 
       ${edge.caption}
       </div>
    `
    : "";
};
export default EdgeHtmLabel;
