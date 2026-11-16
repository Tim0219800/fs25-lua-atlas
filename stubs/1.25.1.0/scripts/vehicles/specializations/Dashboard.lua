---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Dashboard.lua (generated stub, FS25 Lua Atlas)

--- Client-side engine for in-cab instruments (gauges, lights, displays, visibility toggles). Other specializations register DashboardValueType objects through the onRegisterDashboardValueTypes event; the XML under vehicle.dashboard then binds a value type to a display type. Dashboards are sorted into group, critical (every frame), tick and event-driven (by value type) lists, with distance-based throttling. It also loads external dashboard compounds (separate XML plus i3d) linked to a node, switchable by vehicle configuration. The DashboardValueType class and the Dashboard.TYPES, TYPE_DATA and COLORS tables are defined elsewhere: UNVERIFIED.
---@class Dashboard
Dashboard = {}

--- Always returns true: the specialization has no prerequisites.
---@param specializations any
function Dashboard.prerequisitesPresent(specializations) end

--- Registers the XML schema: default dashboards, group names, update distances, tickIntervall and compound entries. It also builds the separate dashboardCompounds schema used by compound XML files.
function Dashboard.initSpecialization() end

--- Declares the onRegisterDashboardValueTypes event that other specializations listen to in order to register their value types.
---@param vehicleType any
function Dashboard.registerEvents(vehicleType) end

--- Registers the specialization's public vehicle functions (updateDashboards, registerDashboardValueType, group and compound loaders, getDashboardValue, etc.).
---@param vehicleType any
function Dashboard.registerFunctions(vehicleType) end

--- Subscribes to onLoad, onPreInitComponentPlacement, onDelete, onUpdate, onUpdateTick and onUpdateEnd.
---@param vehicleType any
function Dashboard.registerEventListeners(vehicleType) end

--- Initialises the empty dashboard lists, reads the groups from vehicle.dashboard.groups, the tick interval and the two max update distances from the XML.
---@param savegame any
function Dashboard:onLoad(savegame) end

--- Client only: raises onRegisterDashboardValueTypes, loads the default dashboards, each value type's own XML and the compounds. On servers or with zero dashboards it removes the onUpdate and onUpdateTick listeners. Runs here so value types registered during post-load are all known.
---@param savegame any
function Dashboard:onPreInitComponentPlacement(savegame) end

--- Releases all shared i3d files that were requested for dashboard compounds.
function Dashboard:onDelete() end

--- Adds a value type object to the vehicle's list. If the dashboard types have already been loaded, it immediately makes the value type load its own XML settings.
---@param dashboardValueType any
function Dashboard:registerDashboardValueType(dashboardValueType) end

--- Client per-frame: checks one dashboard group per frame (round robin) and forces a full refresh when its active state flips. Updates the critical dashboards when the vehicle is within the critical distance or flagged dirty.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Dashboard:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client tick: updates the low-priority dashboards when within the max distance (or dirty), honouring tickIntervall if set. Also refreshes event-driven dashboards whose value type was flagged dirty.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Dashboard:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client only: forces a refresh of the tick and critical dashboards, regardless of whether their value changed.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Dashboard:onUpdateEnd(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Flags the named value type as dirty so its dashboards are refreshed at the next tick when the vehicle is in update range. Called by other specializations when the source value changes.
---@param valueTypeName any
function Dashboard:updateDashboardValueType(valueTypeName) end

--- Core update loop for a list of dashboards. It reads the value from the value type, applies state change, active range, scale, offset, mapping, idle value, interpolation and min/max clamping, then calls the dashboard's state function if the value changed or force is set.
---@param dashboards any
---@param dt any
---@param force any
function Dashboard:updateDashboards(dashboards, dt, force) end

--- Reads a group name from XML into the group table and sets it inactive. Returns false with a warning if the name is missing or already used.
---@param xmlFile any
---@param key any
---@param group any
function Dashboard:loadDashboardGroupFromXML(xmlFile, key, group) end

--- Default implementation, always true. Other specializations override it to drive group visibility.
---@param group any
function Dashboard:getIsDashboardGroupActive(group) end

--- Returns the dashboard group table registered under the given name, or nil.
---@param name any
function Dashboard:getDashboardGroupByName(name) end

--- Reads one compound entry (link node, file, name, config ids and configuration dependencies), finds the named compound in the external XML and starts a shared i3d load with onDashboardCompoundLoaded as callback. Returns true only when that load was started.
---@param xmlFile any
---@param key any
---@param compound any
function Dashboard:loadDashboardCompoundFromXML(xmlFile, key, compound) end

--- Callback of the compound i3d load: builds i3d mappings from the loaded children, loads the compound's dashboards, then deletes the temporary i3d root node and the compound XML file. Note: the compound's node is linked before deletion of the root.
---@param i3dNode any
---@param failedReason any
---@param args any
function Dashboard:onDashboardCompoundLoaded(i3dNode, failedReason, args) end

--- Links the compound node under the compound's link node at the origin, loads its dashboards, then for each configuration entry applies object changes and loads that configuration's dashboards only if its id is enabled. Returns false with a warning if the node is missing.
---@param dashboardXMLFile any
---@param compound any
---@param compoundKey any
---@param components any
function Dashboard:loadDashboardCompoundFromExternalXML(dashboardXMLFile, compound, compoundKey, components) end

--- Client only: iterates the dashboard entries at a key, resolves the value type by name (warns on unknown or ambiguous names), loads each one and files it in the critical, value-type, tick or group list. Always returns true.
---@param xmlFile any
---@param key any
---@param dashboardValueType any
---@param components any
---@param i3dMappings any
---@param parentNode any
function Dashboard:loadDashboardsFromXML(xmlFile, key, dashboardValueType, components, i3dMappings, parentNode) end

--- Loads one dashboard definition: display type, interpolation, state change, idle/offset/scale, active range, value mapping curve, groups and state function. It then calls the display type's loadFunc and the value type's loadFunction; returns false if any step fails.
---@param xmlFile any
---@param key any
---@param dashboard any
---@param valueType any
---@param components any
---@param i3dMappings any
---@param parentNode any
function Dashboard:loadDashboardFromXML(xmlFile, key, dashboard, valueType, components, i3dMappings, parentNode) end

--- Default state function: forwards the new value and limits to the updateFunc of the dashboard's display type.
---@param dashboard any
---@param newValue any
---@param minValue any
---@param maxValue any
---@param isActive any
function Dashboard:defaultDashboardStateFunc(dashboard, newValue, minValue, maxValue, isActive) end

--- Marks both the critical and tick dashboards as dirty and wakes the vehicle with raiseActive, so they refresh on the next update.
function Dashboard:setDashboardsDirty() end

--- Resolves a value source: a number or boolean is returned as is, a function is called with the object and dashboard, and a string is looked up as a method or field of the object. Returns nil otherwise.
---@param valueObject any
---@param valueFunc any
---@param dashboard any
function Dashboard:getDashboardValue(valueObject, valueFunc, dashboard) end

--- Converts a colour string into an RGBA table: first a named Dashboard.COLORS entry, then a material template colour of the vehicle material manager, then a numeric vector (alpha defaults to 1). Warns and returns nil otherwise.
---@param xmlFile any
---@param colorStr any
---@param customEnvironment any
function Dashboard.getDashboardColor(xmlFile, colorStr, customEnvironment) end

--- Reads warningThresholdMin and warningThresholdMax from XML into the dashboard (defaults -inf and +inf) and returns true.
---@param self any
---@param xmlFile any
---@param key any
---@param dashboard any
---@param isActive any
function Dashboard.warningAttributes(self, xmlFile, key, dashboard, isActive) end

--- Stores a display type's data (critical flag, schema, load and update functions) in Dashboard.TYPE_DATA under the given index. Used by the display type definitions.
---@param typeIndex any
---@param isCritical any
---@param schemaFunc any
---@param loadFunc any
---@param updateFunc any
function Dashboard.registerDisplayType(typeIndex, isCritical, schemaFunc, loadFunc, updateFunc) end

--- Registers all common dashboard XML attributes under a base path, then each display type's own schema entries, and marks the path for delayed registration. The optional list restricts allowed value type names.
---@param schema XMLSchema
---@param basePath string
---@param availableValueTypes array
function Dashboard.registerDashboardXMLPaths(schema, basePath, availableValueTypes) end

--- Adds a delayed schema registration function for 'Dashboard' to both the vehicle schema and the compounds schema (creating the latter if needed).
---@param schema any
---@param func any
function Dashboard.addDelayedRegistrationFunc(schema, func) end
