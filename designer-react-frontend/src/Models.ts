export type ViewModelListItem = {
  uuid: string;
  name: string;
};

export type Node = {
  uuid: string;
  label: string;
  caption: string;
  properties?: ReadonlyArray<{ name: string; value: string | number | boolean }>;
  shape?: string;
  color?: string;
  icon?: string;
  x?: number;
  y?: number;
  selected?: boolean;
  actionDefs?: Array<ActionDef>;
  actionGroups?: Array<ActionGroup>;
  type: contextTypeEnum;
  size?: number;
  isNew?: boolean;
};

export type Relationship = {
  uuid: string;
  startNodeUuid: string;
  endNodeUuid: string;
  label: string;
  caption: string;
  properties?: ReadonlyArray<{ name: string; value: string | number | boolean }>;
  actionDefs?: Array<ActionDef>;
  actionGroups?: Array<ActionGroup>;
  type: contextTypeEnum;
  lineWidth?: number;
  color?: string;
  lineStyle?: string;
  icon?: string;
};

export type ViewModelData = {
  viewModelDef: {
    uuid: string;
    name: string;
  };
  nodes: ReadonlyArray<Node>;
  relationships: ReadonlyArray<Relationship>;
  actionDefs: Array<ActionDef>;
  actionGroups: Array<ActionGroup>;
};

export type GraphData = {
    nodes: ReadonlyArray<Node>;
    relationships: ReadonlyArray<Relationship>;
}

export type ActionCallback = () => void;

export type ActionDef = {
  group?: string;
  icon?: string;
  hidden?: boolean;
  name: string;
  params: Array<{ name: string; widget: string; initValues: [string]}>;
  uuid: string;
  args: { [key: string]: string | number | boolean | undefined };
  addedEles: any;
  callback?: ActionCallback;
};

export type ActionGroup = {
  name: string;
  actions: Array<ActionDef>;
};

export enum contextTypeEnum {
  NODE = "NODE",
  REL = "REL",
  VIEW = "VIEW",
}

export type ActionPostData = {
  name: string;
  uuid: string;
  viewId: string;
  actionUuid: string;
  contextUuid: string;
  contextType: contextTypeEnum;
  arguments?: Array<{
    name: string;
    value: string | number | boolean;
  }>;
};

export type Message = {
  text: string;
  type: string;
};

export type Config = {
  zoom: number;
  pan: { x: number; y: number };
  minZoom: number;
  maxZoom: number;
  zoomingEnabled: boolean;
  userZoomingEnabled: boolean;
  panningEnabled: boolean;
  userPanningEnabled: boolean;
  boxSelectionEnabled: boolean;
  selectionType: string;
  touchTapThreshold: number;
  desktopTapThreshold: number;
  autolock: boolean;
  autoungrabify: boolean;
  autounselectify: boolean;
  headless: boolean;
  styleEnabled: boolean;
  hideEdgesOnViewport: boolean;
  textureOnViewport: boolean;
  motionBlur: boolean;
  motionBlurOpacity: number;
  pixelRatio: string;
  fit: boolean;
  layout: any;
};

export type ActionLogItem = {
  statusCode: number;
  name: string;
  date: Date;
  message: string;
};
