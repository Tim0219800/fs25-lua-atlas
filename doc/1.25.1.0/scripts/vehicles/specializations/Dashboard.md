# vehicles/specializations/Dashboard.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Dashboard.md)*

Source: `dataS/scripts/vehicles/specializations/Dashboard.lua` — FS25 1.25.1.0

✍ Client-side engine for in-cab instruments (gauges, lights, displays, visibility toggles). Other specializations register DashboardValueType objects through the onRegisterDashboardValueTypes event; the XML under vehicle.dashboard then binds a value type to a display type. Dashboards are sorted into group, critical (every frame), tick and event-driven (by value type) lists, with distance-based throttling. It also loads external dashboard compounds (separate XML plus i3d) linked to a node, switchable by vehicle configuration. The DashboardValueType class and the Dashboard.TYPES, TYPE_DATA and COLORS tables are defined elsewhere: UNVERIFIED.

- **Dashboard** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `Dashboard.prerequisitesPresent(specializations: any)` | 53 | ✍ Always returns true: the specialization has no prerequisites. |
| `Dashboard.initSpecialization()` | 59 | ✍ Registers the XML schema: default dashboards, group names, update distances, tickIntervall and compound entries. It also builds the separate dashboardCompounds schema used by compound XML files. |
| `Dashboard.registerEvents(vehicleType: any)` | 99 | ✍ Declares the onRegisterDashboardValueTypes event that other specializations listen to in order to register their value types. |
| `Dashboard.registerFunctions(vehicleType: any)` | 105 | ✍ Registers the specialization's public vehicle functions (updateDashboards, registerDashboardValueType, group and compound loaders, getDashboardValue, etc.). |
| `Dashboard.registerEventListeners(vehicleType: any)` | 123 | ✍ Subscribes to onLoad, onPreInitComponentPlacement, onDelete, onUpdate, onUpdateTick and onUpdateEnd. |
| `Dashboard:onLoad(savegame: any)` | 134 | ✍ Initialises the empty dashboard lists, reads the groups from vehicle.dashboard.groups, the tick interval and the two max update distances from the XML. |
| `Dashboard:onPreInitComponentPlacement(savegame: any)` | 187 | ✍ Client only: raises onRegisterDashboardValueTypes, loads the default dashboards, each value type's own XML and the compounds. On servers or with zero dashboards it removes the onUpdate and onUpdateTick listeners. Runs here so value types registered during post-load are all known. |
| `Dashboard:onDelete()` | 219 | ✍ Releases all shared i3d files that were requested for dashboard compounds. |
| `Dashboard:registerDashboardValueType(dashboardValueType: any)` | 232 | ✍ Adds a value type object to the vehicle's list. If the dashboard types have already been loaded, it immediately makes the value type load its own XML settings. |
| `Dashboard:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 243 | ✍ Client per-frame: checks one dashboard group per frame (round robin) and forces a full refresh when its active state flips. Updates the critical dashboards when the vehicle is within the critical distance or flagged dirty. |
| `Dashboard:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 281 | ✍ Client tick: updates the low-priority dashboards when within the max distance (or dirty), honouring tickIntervall if set. Also refreshes event-driven dashboards whose value type was flagged dirty. |
| `Dashboard:onUpdateEnd(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 314 | ✍ Client only: forces a refresh of the tick and critical dashboards, regardless of whether their value changed. |
| `Dashboard:updateDashboardValueType(valueTypeName: any)` | 324 | ✍ Flags the named value type as dirty so its dashboards are refreshed at the next tick when the vehicle is in update range. Called by other specializations when the source value changes. |
| `Dashboard:updateDashboards(dashboards: any, dt: any, force: any)` | 330 | ✍ Core update loop for a list of dashboards. It reads the value from the value type, applies state change, active range, scale, offset, mapping, idle value, interpolation and min/max clamping, then calls the dashboard's state function if the value changed or force is set. |
| `Dashboard:loadDashboardGroupFromXML(xmlFile: any, key: any, group: any)` | 462 | ✍ Reads a group name from XML into the group table and sets it inactive. Returns false with a warning if the name is missing or already used. |
| `Dashboard:getIsDashboardGroupActive(group: any)` | 481 | ✍ Default implementation, always true. Other specializations override it to drive group visibility. |
| `Dashboard:getDashboardGroupByName(name: any)` | 487 | ✍ Returns the dashboard group table registered under the given name, or nil. |
| `Dashboard:loadDashboardCompoundFromXML(xmlFile: any, key: any, compound: any)` | 493 | ✍ Reads one compound entry (link node, file, name, config ids and configuration dependencies), finds the named compound in the external XML and starts a shared i3d load with onDashboardCompoundLoaded as callback. Returns true only when that load was started. |
| `Dashboard:onDashboardCompoundLoaded(i3dNode: any, failedReason: any, args: any)` | 592 | ✍ Callback of the compound i3d load: builds i3d mappings from the loaded children, loads the compound's dashboards, then deletes the temporary i3d root node and the compound XML file. Note: the compound's node is linked before deletion of the root. |
| `Dashboard:loadDashboardCompoundFromExternalXML(dashboardXMLFile: any, compound: any, compoundKey: any, components: any)` | 616 | ✍ Links the compound node under the compound's link node at the origin, loads its dashboards, then for each configuration entry applies object changes and loads that configuration's dashboards only if its id is enabled. Returns false with a warning if the node is missing. |
| `Dashboard:loadDashboardsFromXML(xmlFile: any, key: any, dashboardValueType: any, components: any, i3dMappings: any, parentNode: any)` | 654 | ✍ Client only: iterates the dashboard entries at a key, resolves the value type by name (warns on unknown or ambiguous names), loads each one and files it in the critical, value-type, tick or group list. Always returns true. |
| `Dashboard:loadDashboardFromXML(xmlFile: any, key: any, dashboard: any, valueType: any, components: any, i3dMappings: any, parentNode: any)` | 718 | ✍ Loads one dashboard definition: display type, interpolation, state change, idle/offset/scale, active range, value mapping curve, groups and state function. It then calls the display type's loadFunc and the value type's loadFunction; returns false if any step fails. |
| `Dashboard:defaultDashboardStateFunc(dashboard: any, newValue: any, minValue: any, maxValue: any, isActive: any)` | 829 | ✍ Default state function: forwards the new value and limits to the updateFunc of the dashboard's display type. |
| `Dashboard:setDashboardsDirty()` | 836 | ✍ Marks both the critical and tick dashboards as dirty and wakes the vehicle with raiseActive, so they refresh on the next update. |
| `Dashboard:getDashboardValue(valueObject: any, valueFunc: any, dashboard: any)` | 845 | ✍ Resolves a value source: a number or boolean is returned as is, a function is called with the object and dashboard, and a string is looked up as a method or field of the object. Returns nil otherwise. |
| `Dashboard.getDashboardColor(xmlFile: any, colorStr: any, customEnvironment: any)` | 864 | ✍ Converts a colour string into an RGBA table: first a named Dashboard.COLORS entry, then a material template colour of the vehicle material manager, then a numeric vector (alpha defaults to 1). Warns and returns nil otherwise. |
| `Dashboard.warningAttributes(self: any, xmlFile: any, key: any, dashboard: any, isActive: any)` | 894 | ✍ Reads warningThresholdMin and warningThresholdMax from XML into the dashboard (defaults -inf and +inf) and returns true. |
| `Dashboard.registerDisplayType(typeIndex: any, isCritical: any, schemaFunc: any, loadFunc: any, updateFunc: any)` | 903 | ✍ Stores a display type's data (critical flag, schema, load and update functions) in Dashboard.TYPE_DATA under the given index. Used by the display type definitions. |
| `Dashboard.registerDashboardXMLPaths(schema: XMLSchema, basePath: string, availableValueTypes: array)` | 1855 | ✍ Registers all common dashboard XML attributes under a base path, then each display type's own schema entries, and marks the path for delayed registration. The optional list restricts allowed value type names. |
| `Dashboard.addDelayedRegistrationFunc(schema: any, func: any)` | 1890 | ✍ Adds a delayed schema registration function for 'Dashboard' to both the vehicle schema and the compounds schema (creating the latter if needed). |

## Specialization

| Type | Name | Line |
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
