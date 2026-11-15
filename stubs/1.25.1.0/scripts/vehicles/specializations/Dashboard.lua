---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Dashboard.lua (generated stub, FS25 Lua Atlas)

---@class Dashboard
Dashboard = {}

---@param specializations any
function Dashboard.prerequisitesPresent(specializations) end

function Dashboard.initSpecialization() end

---@param vehicleType any
function Dashboard.registerEvents(vehicleType) end

---@param vehicleType any
function Dashboard.registerFunctions(vehicleType) end

---@param vehicleType any
function Dashboard.registerEventListeners(vehicleType) end

---@param savegame any
function Dashboard:onLoad(savegame) end

---@param savegame any
function Dashboard:onPreInitComponentPlacement(savegame) end

function Dashboard:onDelete() end

---@param dashboardValueType any
function Dashboard:registerDashboardValueType(dashboardValueType) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Dashboard:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Dashboard:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Dashboard:onUpdateEnd(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param valueTypeName any
function Dashboard:updateDashboardValueType(valueTypeName) end

---@param dashboards any
---@param dt any
---@param force any
function Dashboard:updateDashboards(dashboards, dt, force) end

---@param xmlFile any
---@param key any
---@param group any
function Dashboard:loadDashboardGroupFromXML(xmlFile, key, group) end

---@param group any
function Dashboard:getIsDashboardGroupActive(group) end

---@param name any
function Dashboard:getDashboardGroupByName(name) end

---@param xmlFile any
---@param key any
---@param compound any
function Dashboard:loadDashboardCompoundFromXML(xmlFile, key, compound) end

---@param i3dNode any
---@param failedReason any
---@param args any
function Dashboard:onDashboardCompoundLoaded(i3dNode, failedReason, args) end

---@param dashboardXMLFile any
---@param compound any
---@param compoundKey any
---@param components any
function Dashboard:loadDashboardCompoundFromExternalXML(dashboardXMLFile, compound, compoundKey, components) end

---@param xmlFile any
---@param key any
---@param dashboardValueType any
---@param components any
---@param i3dMappings any
---@param parentNode any
function Dashboard:loadDashboardsFromXML(xmlFile, key, dashboardValueType, components, i3dMappings, parentNode) end

---@param xmlFile any
---@param key any
---@param dashboard any
---@param valueType any
---@param components any
---@param i3dMappings any
---@param parentNode any
function Dashboard:loadDashboardFromXML(xmlFile, key, dashboard, valueType, components, i3dMappings, parentNode) end

---@param dashboard any
---@param newValue any
---@param minValue any
---@param maxValue any
---@param isActive any
function Dashboard:defaultDashboardStateFunc(dashboard, newValue, minValue, maxValue, isActive) end

function Dashboard:setDashboardsDirty() end

---@param valueObject any
---@param valueFunc any
---@param dashboard any
function Dashboard:getDashboardValue(valueObject, valueFunc, dashboard) end

---@param xmlFile any
---@param colorStr any
---@param customEnvironment any
function Dashboard.getDashboardColor(xmlFile, colorStr, customEnvironment) end

---@param self any
---@param xmlFile any
---@param key any
---@param dashboard any
---@param isActive any
function Dashboard.warningAttributes(self, xmlFile, key, dashboard, isActive) end

---@param typeIndex any
---@param isCritical any
---@param schemaFunc any
---@param loadFunc any
---@param updateFunc any
function Dashboard.registerDisplayType(typeIndex, isCritical, schemaFunc, loadFunc, updateFunc) end

---@param schema XMLSchema
---@param basePath string
---@param availableValueTypes array
function Dashboard.registerDashboardXMLPaths(schema, basePath, availableValueTypes) end

---@param schema any
---@param func any
function Dashboard.addDelayedRegistrationFunc(schema, func) end
