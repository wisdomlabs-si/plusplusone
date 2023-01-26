export const klayLayout = {
  name: "klay",
  rankDir: "LR",
  fit: true,
  klay: {
    borderSpacing: 20,
    spacing: 130,
    edgeSpacingFactor: 0.9,
    nodePlacement: "BRANDES_KOEPF",
    layoutHierarchy: true,
    inLayerSpacingFactor: 1.2,
    linearSegmentsDeflectionDampening: 0.3,
    nodeLayering: "LONGEST_PATH",
    separateConnectedComponents: true,
    thoroughness: 10,
    randomizationSeed: 1,
    feedbackEdges: true,
    crossingMinimization: "LAYER_SWEEP",
    fixedAlignment: "BALANCED",
    direction: "RIGHT",
  },
};

export const colaLayout = {
  name: "cola",
  animate: false, // whether to show the layout as it's running
  refresh: 0, // number of ticks per frame; higher is faster but more jerky
  maxSimulationTime: 0, // max length in ms to run the layout
  ungrabifyWhileSimulating: false, // so you can't drag nodes during layout
  fit: true, // on every layout reposition of nodes, fit the viewport
  padding: 50, // padding around the simulation
  boundingBox: undefined, // constrain layout bounds; { x1, y1, x2, y2 } or { x1, y1, w, h }
  nodeDimensionsIncludeLabels: false, // whether labels should be included in determining the space used by a node
  // layout event callbacks
  // ready: function ():void {}, // on layoutready
  // stop: function ():void {}, // on layoutstop
  // positioning options
  randomize: true, // use random node positions at beginning of layout
  avoidOverlap: true, // if true, prevents overlap of node bounding boxes
  handleDisconnected: true, // if true, avoids disconnected components from overlapping
  convergenceThreshold: 0.01, // when the alpha value (system energy) falls below this value, the layout stops
  // @ts-ignore
  nodeSpacing: 150,
  flow: undefined, // use DAG/tree flow layout if specified, e.g. { axis: 'y', minSeparation: 30 }
  alignment: undefined, // relative alignment constraints on nodes, e.g. {vertical: [[{node: node1, offset: 0}, {node: node2, offset: 5}]], horizontal: [[{node: node3}, {node: node4}], [{node: node5}, {node: node6}]]}
  gapInequalities: undefined, // list of inequality constraints for the gap between the nodes, e.g. [{"axis":"y", "left":node1, "right":node2, "gap":25}]
  // different methods of specifying edge length
  // each can be a constant numerical value or a function like `function( edge ){ return 2; }`
  edgeLength: undefined, // sets edge length directly in simulation
  edgeSymDiffLength: undefined, // symmetric diff edge length in simulation
  edgeJaccardLength: undefined, // jaccard edge length in simulation
  // iterations of cola algorithm; uses default values on undefined
  unconstrIter: undefined, // unconstrained initial layout iterations
  userConstIter: undefined, // initial layout iterations with user-specified constraints
  allConstIter: undefined, // initial layout iterations with all constraints including non-overlap
};

export const spreadLayout = {
  name: "spread",
  animate: false, // Whether to show the layout as it's running
  ready: undefined, // Callback on layoutready
  stop: undefined, // Callback on layoutstop
  fit: true, // Reset viewport to fit default simulationBounds
  minDist: 100, // Minimum distance between nodes
  padding: 20, // Padding
  expandingFactor: -1.0, // If the network does not satisfy the minDist
  // criterium then it expands the network of this amount
  // If it is set to -1.0 the amount of expansion is automatically
  // calculated based on the minDist, the aspect ratio and the
  // number of nodes
  prelayout: { name: "spread" }, // Layout options for the first phase
  maxExpandIterations: 4, // Maximum number of expanding iterations
  boundingBox: undefined, // Constrain layout bounds; { x1, y1, x2, y2 } or { x1, y1, w, h }
  randomize: false, // Uses random initial node positions on true
  animateDuration: 0,
};

export const coseLayout = {
  name: "cose",
  idealEdgeLength: 1700,
  nodeOverlap: 50000,
  refresh: 20,
  fit: true,
  padding: 15,
  randomize: true,
  componentSpacing: 50,
  nodeRepulsion: 1,
  edgeElasticity: 100,
  nestingFactor: 1,
  gravity: 800,
  numIter: 12000,
  initialTemp: 100,
  coolingFactor: 0.55,
  minTemp: 500.0,
  animate: false,
};

export const BreadthFirst = {
  name: "breadthfirst",
  fit: true, // whether to fit the viewport to the graph
  directed: true, // whether the tree is directed downwards (or edges can point in any direction if false)
  padding: 100, // padding on fit
  circle: false, // put depths in concentric circles if true, put depths top down if false
  grid: false, // whether to create an even grid into which the DAG is placed (circle:false only)
  spacingFactor: 2, // positive spacing factor, larger => more space between nodes (N.B. n/a if causes overlap)
  boundingBox: undefined, // constrain layout bounds; { x1, y1, x2, y2 } or { x1, y1, w, h }
  avoidOverlap: true, // prevents node overlap, may overflow boundingBox if not enough space
  nodeDimensionsIncludeLabels: false, // Excludes the label when calculating node bounding boxes for the layout algorithm
  roots: undefined, // the roots of the trees
  maximal: false, // whether to shift nodes down their natural BFS depths in order to avoid upwards edges (DAGS only)
  animate: false, // whether to transition the node positions
  animationDuration: 500, // duration of animation in ms if enabled
  animationEasing: undefined, // easing of animation if enabled,
  ready: undefined, // callback on layoutready
  stop: undefined, // callback on layoutstop
};

export const config = {
  zoom: 1,
  pan: { x: 0, y: 0 },
  minZoom: 0.01,
  maxZoom: 100,
  zoomingEnabled: true,
  wheelSensitivity: 0.2,
  userZoomingEnabled: true,
  panningEnabled: true,
  userPanningEnabled: true,
  boxSelectionEnabled: true,
  selectionType: "single",
  touchTapThreshold: 8,
  desktopTapThreshold: 4,
  autolock: false,
  autoungrabify: false,
  autounselectify: false,
  headless: false,
  styleEnabled: true,
  hideEdgesOnViewport: false,
  textureOnViewport: false,
  motionBlur: false,
  motionBlurOpacity: 0.2,
  pixelRatio: "auto",
  fit: true,
  layout: { name: "preset", fit: true },
};

export const layouts = [klayLayout, colaLayout, coseLayout, BreadthFirst];
