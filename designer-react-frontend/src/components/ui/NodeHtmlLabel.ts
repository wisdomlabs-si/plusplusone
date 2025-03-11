import { Node } from "../../Models";
import { getIcon } from "../../style/Icons";
import { renderToString } from "react-dom/server";

const NodeHtmLabel = (node: Node): string => {
    const nodeBorderSize = 5;
    const nodeBorderColor = "#f3faff";
    const imageMargin = (node.size || 80) * 0.0375;
    const imageSize = (node.size || 80) / 2 - imageMargin - nodeBorderSize;
    const needToDisplayNew = node.isNew;

  return node
    ? `
    <div>
        <div style="
            position: relative;
            color: ${node.color};
            text-align: center;
            font-size: 1em;
            width: ${(node.size || 80)}px;
            height: ${(node.size || 80)}px;
            ${node.selected ? `border: ${nodeBorderSize}px solid ${nodeBorderColor}; box-shadow: 0 0 4px 4px rgba(0, 0, 0, 0.17), 0 6px 20px 0 rgba(0, 0, 0, 0.19);` : `border: ${nodeBorderSize}px solid ${node.color};`}
            border-radius: 50%;
            background-color: ${node.color};
            ${needToDisplayNew ? `border: ${nodeBorderSize}px solid #ff8164; box-shadow: 0 0 16px 16px rgba(255, 106, 106, 0.37), 0 12px 30px 0 rgba(255, 106, 106, 0.49);` : ``}
        ">
            <div>
                <div style="
                    margin-top: ${imageMargin}px;
                    margin-left: auto;
                    margin-right: auto;
                    width: ${imageSize}px;
                    height: ${imageSize}px;
                ">
                ${node.icon ? renderToString(getIcon(node.icon)) : ""}
                </div>
                <div style="
                    display: flex;
                    justify-content: safe center;
                    align-items: safe center;
                    width: 100%;
                    color: black; ${node.color}
                ">
                    <p style="
                        position: absolute;
                        width: 250%;
                        font: 14px helvetica neue, helvetica, arial, sans-serif;
                        font-weight: 900;
                        #-webkit-text-stroke: 0.8px ${node.color};
                    ">
                        ${node.caption ? node.caption : ""}
                    </p>
                </div>
            </div>
        </div>
    </div>
    `
    : "";
};
export default NodeHtmLabel;
