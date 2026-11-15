# vehicles/specializations/Dashboard.lua

Source : `dataS/scripts/vehicles/specializations/Dashboard.lua` — FS25 1.25.1.0

- **Dashboard** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Dashboard.prerequisitesPresent(specializations: any)` | 53 |  |
| `Dashboard.initSpecialization()` | 59 |  |
| `Dashboard.registerEvents(vehicleType: any)` | 99 |  |
| `Dashboard.registerFunctions(vehicleType: any)` | 105 |  |
| `Dashboard.registerEventListeners(vehicleType: any)` | 123 |  |
| `Dashboard:onLoad(savegame: any)` | 134 |  |
| `Dashboard:onPreInitComponentPlacement(savegame: any)` | 187 |  |
| `Dashboard:onDelete()` | 219 |  |
| `Dashboard:registerDashboardValueType(dashboardValueType: any)` | 232 |  |
| `Dashboard:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 243 |  |
| `Dashboard:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 281 |  |
| `Dashboard:onUpdateEnd(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 314 |  |
| `Dashboard:updateDashboardValueType(valueTypeName: any)` | 324 |  |
| `Dashboard:updateDashboards(dashboards: any, dt: any, force: any)` | 330 |  |
| `Dashboard:loadDashboardGroupFromXML(xmlFile: any, key: any, group: any)` | 462 |  |
| `Dashboard:getIsDashboardGroupActive(group: any)` | 481 |  |
| `Dashboard:getDashboardGroupByName(name: any)` | 487 |  |
| `Dashboard:loadDashboardCompoundFromXML(xmlFile: any, key: any, compound: any)` | 493 |  |
| `Dashboard:onDashboardCompoundLoaded(i3dNode: any, failedReason: any, args: any)` | 592 |  |
| `Dashboard:loadDashboardCompoundFromExternalXML(dashboardXMLFile: any, compound: any, compoundKey: any, components: any)` | 616 |  |
| `Dashboard:loadDashboardsFromXML(xmlFile: any, key: any, dashboardValueType: any, components: any, i3dMappings: any, parentNode: any)` | 654 |  |
| `Dashboard:loadDashboardFromXML(xmlFile: any, key: any, dashboard: any, valueType: any, components: any, i3dMappings: any, parentNode: any)` | 718 |  |
| `Dashboard:defaultDashboardStateFunc(dashboard: any, newValue: any, minValue: any, maxValue: any, isActive: any)` | 829 |  |
| `Dashboard:setDashboardsDirty()` | 836 |  |
| `Dashboard:getDashboardValue(valueObject: any, valueFunc: any, dashboard: any)` | 845 |  |
| `Dashboard.getDashboardColor(xmlFile: any, colorStr: any, customEnvironment: any)` | 864 |  |
| `Dashboard.warningAttributes(self: any, xmlFile: any, key: any, dashboard: any, isActive: any)` | 894 |  |
| `Dashboard.registerDisplayType(typeIndex: any, isCritical: any, schemaFunc: any, loadFunc: any, updateFunc: any)` | 903 |  |
| `Dashboard.registerDashboardXMLPaths(schema: XMLSchema, basePath: string, availableValueTypes: array)` | 1855 |  |
| `Dashboard.addDelayedRegistrationFunc(schema: any, func: any)` | 1890 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onRegisterDashboardValueTypes` | 100 |
| registerFunction | `registerDashboardValueType` | 106 |
| registerFunction | `updateDashboards` | 107 |
| registerFunction | `updateDashboardValueType` | 108 |
| registerFunction | `loadDashboardGroupFromXML` | 109 |
| registerFunction | `getIsDashboardGroupActive` | 110 |
| registerFunction | `getDashboardGroupByName` | 111 |
| registerFunction | `loadDashboardCompoundFromXML` | 112 |
| registerFunction | `onDashboardCompoundLoaded` | 113 |
| registerFunction | `loadDashboardCompoundFromExternalXML` | 114 |
| registerFunction | `loadDashboardsFromXML` | 115 |
| registerFunction | `loadDashboardFromXML` | 116 |
| registerFunction | `setDashboardsDirty` | 117 |
| registerFunction | `getDashboardValue` | 118 |
| registerEventListener | `onLoad` | 124 |
| registerEventListener | `onPreInitComponentPlacement` | 125 |
| registerEventListener | `onDelete` | 126 |
| registerEventListener | `onUpdate` | 127 |
| registerEventListener | `onUpdateTick` | 128 |
| registerEventListener | `onUpdateEnd` | 129 |
