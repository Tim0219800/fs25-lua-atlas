---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/misc/SprayerNodeData.lua (generated stub, FS25 Lua Atlas)

---@class SprayerNodeData
SprayerNodeData = {}

function SprayerNodeData:delete() end

---@param _ any
---@param _ any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function SprayerNodeData:loadFromXML(_, _, baseDirectory, configFileName, mapFilename) end

function SprayerNodeData:getConfigPrices() end

---@param name any
---@param linkNode any
---@param modifierTargetObject any
function SprayerNodeData:getClonedSectionSamples(name, linkNode, modifierTargetObject) end

---@param loadVehicleData any
---@param loadEffect any
function SprayerNodeData:loadData(loadVehicleData, loadEffect) end

---@param self any
---@param i3dNode any
---@param failedReason any
---@param args any
function SprayerNodeData.onSprayerEffectLoaded(self, i3dNode, failedReason, args) end

---@param self any
---@param i3dNode any
---@param failedReason any
---@param sensorType any
function SprayerNodeData.onWeedSensorLoaded(self, i3dNode, failedReason, sensorType) end

function SprayerNodeData:getClonedSprayerEffectNode() end

---@param sensorTypeId any
function SprayerNodeData:getClonedSprayerWeedSensorNode(sensorTypeId) end

---@param configFileName any
---@param configurations any
function SprayerNodeData:getSprayerNodeData(configFileName, configurations) end

---@param pfModule any
function SprayerNodeData:overwriteGameFunctions(pfModule) end

---@param schema any
function SprayerNodeData:registerXMLPaths(schema) end
