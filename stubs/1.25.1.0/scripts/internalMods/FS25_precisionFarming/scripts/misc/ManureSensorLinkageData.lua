---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/misc/ManureSensorLinkageData.lua (stub généré, atlas Lua FS25)

---@class ManureSensorLinkageData
ManureSensorLinkageData = {}

function ManureSensorLinkageData:delete() end

---@param _ any
---@param _ any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function ManureSensorLinkageData:loadFromXML(_, _, baseDirectory, configFileName, mapFilename) end

---@param loadVehicleData any
---@param loadSensorData any
function ManureSensorLinkageData:loadLinkageData(loadVehicleData, loadSensorData) end

---@param i3dNode any
---@param failedReason any
---@param args any
function ManureSensorLinkageData:onSensorDataLoaded(i3dNode, failedReason, args) end

---@param configFileName any
function ManureSensorLinkageData:getManureSensorLinkageData(configFileName) end

---@param typeName any
function ManureSensorLinkageData:getClonedManureSensorNode(typeName) end

---@param pfModule any
function ManureSensorLinkageData:overwriteGameFunctions(pfModule) end

---@param schema any
function ManureSensorLinkageData:registerXMLPaths(schema) end
