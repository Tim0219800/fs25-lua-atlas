---@meta
-- FS25 1.25.1.0 : vehicles/specializations/SlopeCompensation.lua (generated stub, FS25 Lua Atlas)

---@class SlopeCompensation
SlopeCompensation = {}

---@param specializations any
function SlopeCompensation.prerequisitesPresent(specializations) end

function SlopeCompensation.initSpecialization() end

---@param schema any
---@param basePath any
function SlopeCompensation.registerXMLPaths(schema, basePath) end

---@param vehicleType any
function SlopeCompensation.registerFunctions(vehicleType) end

---@param vehicleType any
function SlopeCompensation.registerEventListeners(vehicleType) end

---@param savegame any
function SlopeCompensation:onLoad(savegame) end

---@param savegame any
function SlopeCompensation:onLoadFinished(savegame) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function SlopeCompensation:saveToXMLFile(xmlFile, key, usedModNames) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function SlopeCompensation:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function SlopeCompensation:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function SlopeCompensation:onRegisterAnimationValueTypes() end

---@param xmlFile any
---@param key any
---@param indexName any
---@param nodeName any
---@param nodesName any
function SlopeCompensation:loadSlopeCompensationWheels(xmlFile, key, indexName, nodeName, nodesName) end

---@param compensationNode any
---@param xmlFile any
---@param key any
function SlopeCompensation:loadSlopeCompensationNodeFromXML(compensationNode, xmlFile, key) end

---@param compensationNode any
function SlopeCompensation:getSlopeCompensationAngle(compensationNode) end

---@param compensationNode any
function SlopeCompensation:getSlopeCompensationAngleScale(compensationNode) end

---@param compensationNode any
---@param angle any
function SlopeCompensation:setSlopeCompensationNodeAngle(compensationNode, angle) end

---@param values any
function SlopeCompensation:updateDebugValues(values) end
