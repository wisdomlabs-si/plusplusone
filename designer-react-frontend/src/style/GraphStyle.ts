const style = [
  {
    selector: "node",
    style: {
      "font-size": "12px",
      "text-halign": "center",
      "text-valign": "center",
      "text-wrap": "ellipsis",
      "text-max-width": "100px",
      color: "#ffffff",
      "overlay-opacity": 0,
      "text-background-opacity": 1,
      "background-position-y": "30%",

      opacity: 1,
      width: "data(size)",
      height: "data(size)",
    },
  },

  {
    selector: "node[color]",
    style: {
      "border-color": "data(color)",
      "background-color": "data(color)",
      "text-outline-width": 2,
      "text-outline-color": "data(color)",
    },
  },
  {
    selector: "node[shape]",
    style: {
      shape: "data(shape)",
    },
  },
  {
    selector: "node[?selected]",
    style: {
//       "border-color": "#367BF5",
      "border-color": "#FFFFFF",
      "border-width": "10px",
    },
  },
  {
    selector: "edge",
    style: {
      width: 1,
      "text-background-color": "#fff",
      "text-background-opacity": 1,
      "curve-style": "bezier",
      "control-point-step-size": 300,
      "target-arrow-shape": "triangle",
      "target-arrow-color": "#5E6366",
      "edge-text-rotation": "autorotate",
      "font-size": "0.8em",
    },
  },
  // {
  //   selector: "edge[caption]",
  //   style: {
  //     label: "data(caption)",
  //     width: 3,
  //   },
  // },
  {
    selector: "edge[lineWidth]",
    style: {
      width: "data(lineWidth)",
    },
  },
  {
    selector: "edge[color]",
    style: {
      color: "data(color)",
      "line-color": "data(color)",
      "target-arrow-color": "data(color)",
      "source-arrow-color": "data(color)",
    },
  },
  {
    selector: "edge[lineStyle]",
    style: {
      "line-style": "data(lineStyle)",
    },
  },
  {
    selector: "edge[?selected]",
    style: {
      "line-color": "#0277bd ",
      "target-arrow-color": "#0277bd ",
      width: "3px",
      color: "#0277bd ",
      "transition-property": "color, line-color, target-arrow-color, width",
      "transition-duration": "0.5s",
    },
  },
  {
    selector: ".eh-handle",
    style: {
      "background-color": "#367BF5",
      width: 12,
      height: 12,
      shape: "ellipse",
      "overlay-opacity": 0,
      "border-width": 12,
      "border-opacity": 0,
    },
  },
  {
    selector: ".eh-hover",
    style: {
      "background-color": "#367BF5",
    },
  },
  {
    selector: ".eh-source",
    style: {
      "border-color": "#367BF5",
      "border-opacity": 0,
    },
  },

  {
    selector: ".eh-target",
    style: {
      "border-color": "#367BF5",
      "border-opacity": 0,
    },
  },

  {
    selector: ".eh-preview",
    style: {
      "background-color": "#367BF5",
    },
  },
  {
    selector: ".eh-ghost-edge",
    style: {
      "line-color": "#367BF5",
      "target-arrow-color": "#367BF5",
      "source-arrow-color": "#367BF5",
      label: "",
      width: 5,
    },
  },
  {
    selector: ".eh-ghost-edge.eh-preview-active",
    style: {
      opacity: 0,
    },
  },
];

export default style;
