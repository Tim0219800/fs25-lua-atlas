---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/misc/CropSensorLinkageData.lua (generated stub, FS25 Lua Atlas)

---@class CropSensorLinkageData
CropSensorLinkageData = {}

function CropSensorLinkageData:delete() end

---@param _ any
---@param _ any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function CropSensorLinkageData:loadFromXML(_, _, baseDirectory, configFileName, mapFilename) end

---@param loadVehicleData any
---@param loadSensorData any
function CropSensorLinkageData:loadLinkageData(loadVehicleData, loadSensorData) end

---@param i3dNode any
---@param failedReason any
---@param args any
function CropSensorLinkageData:onSensorDataLoaded(i3dNode, failedReason, args) end

---@param configFileName any
function CropSensorLinkageData:getCropSensorLinkageData(configFileName) end

---@param typeName any
function CropSensorLinkageData:getClonedCropSensorNode(typeName) end

---@param pfModule any
function CropSensorLinkageData:overwriteGameFunctions(pfModule) end

---@param schema any
function CropSensorLinkageData:registerXMLPaths(schema) end
