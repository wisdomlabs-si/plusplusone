import React, { useRef, useEffect } from "react";
import { renderToString } from "react-dom/server";
import cytoscape from "cytoscape";
// @ts-ignore
import edgehandles from "cytoscape-edgehandles";
// @ts-ignore
import htmlLabel from "cytoscape-html-label";
// @ts-ignore
import klay from "cytoscape-klay";
// @ts-ignore
import cola from "cytoscape-cola";
import NodeHtmLabel from "./ui/NodeHtmlLabel";
import style from "../style/GraphStyle";
import { Node, Relationship, contextTypeEnum, ActionDef } from "../Models";
import { transformToActionGroups, createContentFromComponent } from "../commonHelpers/commonHelpers";
import { handlePostAction } from "../api/graphDesignerApi";
import "../style/contextMenu.css";
// @ts-ignore
import contextMenus from "cytoscape-context-menus";
import { useStore } from "../store";
import { Observer } from "mobx-react-lite";
import { getIcon } from "../style/Icons";
// @ts-ignore
import popper from "cytoscape-popper";
import ViewportModal from "./ui/ViewportModal";
import EdgeHtmLabel from "./ui/EdgeHtmlLabel";

// @ts-ignore
cytoscape.use(cola);
// @ts-ignore
cytoscape.use(klay);
// @ts-ignore
cytoscape.use(edgehandles);

// @ts-ignore
cytoscape.use(htmlLabel);

// @ts-ignore
cytoscape.use(contextMenus);

// @ts-ignore
cytoscape.use(popper);

type Props = {
  setCy(cy: any): void;
  setAction(action: ActionDef): void;
};

const Graph: React.FC<Props> = ({ setCy, setAction }): JSX.Element => {
  const store = useStore();
  const cyPopperRef = useRef(null);
  const transformAction = (element: any) => {
    store.setSelectedElement({ ...element.data() });
    const actions = transformToActionGroups(element.data("actionDefs"));
    let menuItemsTemp: any = [];
    actions.forEach((action) => {
      menuItemsTemp = [
        ...menuItemsTemp,
        {
          id: action.name,
          content: `<div style="font-weight: 800;">${action.name}<div>`,
          tooltipText: `${action.name} actions`,
          selector: "node, edge",
          onClickFunction: () => null,
        },
      ];
      action.actions.forEach((a) => {
        if (a.hidden) {
          return;
        }
        menuItemsTemp = [
          ...menuItemsTemp,
          {
            id: a.name,
            content: `<div class="c-NodeStyle__rel" style="padding: 5px; height: 30px;"><div style="display: flex; margin-left: 10px;">${
              a.icon !== null
                ? `<div style="width: 20px; height: 20px; color: var(--color-secondary);">${renderToString(
                    getIcon(a.icon, "var(--color-input-light)")
                  )}</div>`
                : ""
            } ${a.name}</div><div>`,
            tooltipText: a.name,
            selector: "node, edge",
            onClickFunction: () => {
              setAction(a);
            },
          },
        ];
      });
    });

    store.setMenuItems(menuItemsTemp);
    return menuItemsTemp;
  };

  const options = {
    evtType: "cxttap",
    menuItems: store.menuItems,
    menuItemClasses: ["cy-context-menus-cxt-menuitem", "custom-menu-item", "custom-menu-item:hover"],
    contextMenuClasses: [
      "cy-context-menus-cxt-menu",
      "cy-context-menus-divider",
      "cy-context-menus-submenu-indicator",
      "cy-context-menus-ctx-operation",
      "custom-context-menu",
    ],
  };

  const cyRef = useRef(null);

  const graphInit = (cy: cytoscape.Core) => {
    cy.on("zoom", (e) => {
      store.setConfig({ ...store.config, zoom: e.target.zoom(), pan: e.target.pan() });
    });
    cy.on("pan", (e) => {
      store.setConfig({ ...store.config, pan: e.target.pan() });
    });
    cy.on("dragfree", (e: any) => {
      const args = [
        {
          name: "x",
          value: e.target.position().x,
        },
        {
          name: "y",
          value: e.target.position().y,
        },
      ];
      e.target.data("y", e.target.position().y);
      const actions = e.target.data("actionDefs");
      const action = actions.find((x: ActionDef) => x.name === "setPosition");
      if (action) {
        handlePostAction(cy, action, e.target.data("type"), store, e.target.data("uuid"), args);
      }
    });
    cy.on("select", (e) => {
      e.target.data("selected", true);
      store.setSelectedElement({ ...e.target.data() });
      localStorage.setItem("SELECTED_ELEMENT", e.target.data("uuid"));
    });
    cy.on("tap", (e) => {
      if (e.target.data("uuid") !== store.selectedElement?.uuid) {
        cy.elements().forEach((e) => {
          e.data("selected", false);
        });
      }
      if (!e.target.length) {
        store.setSelectedElement(undefined);
      }
    });
    cy.on("dbltap", (e) => {
      if (e.target.data("type") === "NODE") {
        const actions = e.target.data("actionDefs");
        const action = actions.find((x: ActionDef) => x.name === "Expand");
        if (action) {
          handlePostAction(cy, action, e.target.data("type"), store, e.target.data("uuid"));
        }
      }
    });

    // @ts-ignore
    const instance = cy.contextMenus(options);
    cy.on("cxttap", async (e) => {
      document.getElementById("viewport-modal")?.parentElement?.remove();
      cy.elements().forEach((e) => {
        e.data("selected", false);
      });
      if (!e.target.length) {
        store.setSelectedElement(undefined);
      }
      if (e.target.length) {
        e.target.data("selected", true);
        store.menuItems.forEach((item: any) => {
          try {
            // @ts-ignore
            instance.removeMenuItem(item.id);
          } catch (e) {
            console.error(e);
          }
        });
        const actionsMenu = transformAction(e.target);
        // @ts-ignore
        instance.appendMenuItems(actionsMenu);
        return;
      }
      cyPopperRef.current = e.target.popper({
        content: createContentFromComponent(<ViewportModal setAction={setAction} store={store} cy={cy} />),
        renderedPosition: () => ({ x: e.originalEvent.offsetX, y: e.originalEvent.offsetY }),
        popper: {
          position: "auto",
          removeOnDestroy: true,
        },
      });
    });

    // @ts-ignore
    cy.htmlLabel([
      {
        query: "node[caption]",
        cssClass: "o-node-tooltip",
        tpl: (d: Node) => NodeHtmLabel(d),
      },
      {
        query: "edge",
        cssClass: "edgeHtmlLabel",
        autorotate: true,
        tpl: (d: Relationship) => EdgeHtmLabel(d),
      },
    ]);

    // EDGE HANDLES
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    const eh = cy.edgehandles({
      loopAllowed: () => {
        return true;
      },
      complete: (sourceNode, targetNode, addedEles) => {
        function callback() {
          addedEles.remove();
          targetNode.data("selected", false);
        }
        const action = sourceNode.data("actionDefs")?.find((x: ActionDef) => x.name === "addRelationship");
        if (action) {
          setAction({ ...action, args: { endNodeUuid: targetNode.data("uuid") }, callback: callback });
          return;
        }
        addedEles.remove();
      },
    });
    cy.on("ehstart", (e, startNode) => {
      if (!startNode.data("actionDefs")?.find((x: ActionDef) => x.name === "addRelationship")) eh.stop();
    });
    // @ts-ignore
    cy.on("ehhoverover", (e, startNode, targetNode) => {
      targetNode.data("selected", true);
    });
    // @ts-ignore
    cy.on("ehhoverout", (e, startNode, targetNode) => {
      targetNode.data("selected", false);
    });
  };

  const convertDataModel = () => {
    let nodes: any = [];
    if (store.graph.nodes?.length) {
      nodes = store.graph.nodes.map((n: Node) => {
        return {
          data: {
            ...n,
            label: n.label || "",
            id: n.uuid,
            caption: n.caption || n.label || "",
            actionGroups: transformToActionGroups(n.actionDefs || []),
            type: contextTypeEnum.NODE,
          },
          position: JSON.parse(JSON.stringify({ x: n.x || 1, y: n.y || 1 })),
        };
      });
    }
    const doNodesExist = (e: Relationship): boolean => {
      // ensure that nodes exist, so edges can be connected
      if (nodes.length)
        return (
          nodes.some((n: { data: Node }) => n.data.uuid === e.startNodeUuid) &&
          nodes.some((n: { data: Node }) => n.data.uuid === e.endNodeUuid)
        );
      return false;
    };
    let relationships: any = [];
    if (store.graph.relationships?.length) {
      relationships = store.graph.relationships.filter(doNodesExist).map((e: Relationship) => {
        return {
          data: {
            ...e,
            caption: e.caption || e.label || "",
            label: e.label || "",
            source: e.startNodeUuid,
            target: e.endNodeUuid,
            actionGroups: transformToActionGroups(e.actionDefs || []),
            type: contextTypeEnum.REL,
          },
        };
      });
    }
    nodes = nodes.filter(Boolean);
    relationships = relationships.filter(Boolean);
    return [...nodes, ...relationships];
  };

  useEffect(() => {
    const elements = convertDataModel();
    const cy: cytoscape.Core = cytoscape({
      container: document.getElementById("cytoscape-dataset-panel"),
      // @ts-ignore
      elements,

      // @ts-ignore
      style: style,
      ...store.config,
    });
    graphInit(cy);
    const pan = cy.pan();
    const zoom = cy.zoom();
    store.setConfig({ ...store.config, pan: { ...pan }, zoom: zoom, layout: { ...store.config.layout, fit: false } });

    setCy(cy);
    const selEl = cy.getElementById(localStorage.getItem("SELECTED_ELEMENT") || "");
    if (selEl.length) {
      selEl.select();
      store.setSelectedElement({ ...selEl.data() });
    } else {
      store.setSelectedElement(undefined);
    }
  }, [setCy, store.graph]);

  return (
    <Observer>
      {() => (
        <>
          <div id="cytoscape-dataset-panel" ref={cyRef} style={{ width: "100%", height: "100%" }} />
        </>
      )}
    </Observer>
  );
};

export default Graph;
