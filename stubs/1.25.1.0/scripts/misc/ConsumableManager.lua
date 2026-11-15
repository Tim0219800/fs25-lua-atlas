---@meta
-- FS25 1.25.1.0 : misc/ConsumableManager.lua (stub généré, atlas Lua FS25)

---@class ConsumableManager : AbstractManager
ConsumableManager = {}

---@param customMt any
---@return table
function ConsumableManager.new(customMt) end

---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function ConsumableManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

---@return boolean
function ConsumableManager:unloadMapData() end

---@param xmlFilename string
---@param customEnvironment string
---@param baseDirectory string
function ConsumableManager:addModConsumable(xmlFilename, customEnvironment, baseDirectory) end

---@param xmlFilename string
---@param customEnvironment string
---@param baseDirectory string
function ConsumableManager:loadConsumableVariationsFromXML(xmlFilename, customEnvironment, baseDirectory) end

---@param i3dNode any
---@param failedReason any
---@param arguments any
function ConsumableManager:consumableI3DFileLoaded(i3dNode, failedReason, arguments) end

---@param index any
---@param addTensionBeltMesh any
function ConsumableManager:getConsumableMeshByIndex(index, addTensionBeltMesh) end

---@param index any
function ConsumableManager:getConsumableConsumingMeshByIndex(index) end

---@param name any
---@param customEnvironment any
function ConsumableManager:getConsumableVariationIndexByName(name, customEnvironment) end

---@param index any
function ConsumableManager:getConsumableVariationNameByIndex(index) end

---@param index any
function ConsumableManager:getConsumableVariationCapacityAndUnitByIndex(index) end

---@param index any
function ConsumableManager:getConsumableVariationShaderParameterByIndex(index) end

---@param index any
function ConsumableManager:getConsumableVariationMetaDataByIndex(index) end

---@param typeName any
function ConsumableManager:getConsumableVariationsByType(typeName) end

---@param index any
function ConsumableManager:getConsumableVariationPriceByIndex(index) end

---@param typeName any
function ConsumableManager:getTypeTitle(typeName) end

---@param schema any
function ConsumableManager.registerConsumableXMLPaths(schema) end

---@param schema any
function ConsumableManager.registerConsumablesXMLPaths(schema) end
