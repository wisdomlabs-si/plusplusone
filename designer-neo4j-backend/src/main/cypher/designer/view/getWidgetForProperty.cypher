/*
@name designer.view.getWidgetForProperty
@mode read

@input typeName, STRING
@input propNode, NODE

@output widgetType, STRING
@output initValues, LIST OF STRING
*/

WITH $typeName AS typeName, $propNode AS prop

WITH CASE
       WHEN prop.name = 'icon' THEN {widgetType: 'iconPicker', initValues: []}
       WHEN prop.name = 'color' THEN {widgetType: 'colorPicker', initValues: []}
       WHEN prop.name = 'query' THEN {widgetType: 'textArea', initValues: []}
       WHEN prop.name = 'lineStyle' THEN {widgetType: 'dropDown', initValues: ['solid', 'dotted', 'dashed']}
       WHEN prop.name = 'type' AND typeName = 'Typed' THEN {widgetType: 'dropDown', initValues: ['string', 'varchar', 'integer', 'float', 'boolean', 'date', 'datetime', 'localdatetime', 'localtime', 'time', 'duration']}
       WHEN prop.name = 'type' AND typeName = 'Widget' THEN {widgetType: 'dropDown', initValues: ['textField', 'textArea', 'checkBox', 'numberField', 'colorPicker', 'dropDown','iconPicker']}
       WHEN toLower(prop.type) = 'string' THEN {widgetType: 'textField', initValues: []}
       WHEN toLower(prop.type) = 'integer' THEN {widgetType: 'numberField', initValues: []}
       WHEN toLower(prop.type) = 'float' THEN {widgetType: 'numberField', initValues: []}
       WHEN toLower(prop.type) = 'boolean' THEN {widgetType: 'checkBox', initValues: []}
       WHEN toLower(prop.type) = 'date' THEN {widgetType: 'textField', initValues: []}
       WHEN toLower(prop.type) = 'datetime' THEN {widgetType: 'textField', initValues: []}
       WHEN toLower(prop.type) = 'localdatetime' THEN {widgetType: 'textField', initValues: []}
       WHEN toLower(prop.type) = 'localtime' THEN {widgetType: 'textField', initValues: []}
       WHEN toLower(prop.type) = 'time' THEN {widgetType: 'textField', initValues: []}
       WHEN toLower(prop.type) = 'duration' THEN {widgetType: 'textField', initValues: []}
       ELSE {widgetType: 'textArea', initValues: []}
       END AS widgetStruct
RETURN widgetStruct.widgetType AS widgetType, widgetStruct.initValues AS initValues
