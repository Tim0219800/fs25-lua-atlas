---@meta
-- FS25 1.25.1.0 : fillTypes/FillTypeManager.lua (stub généré, atlas Lua FS25)

---@class FillTypeManager : AbstractManager
FillTypeManager = {}

---@param customMt table?
---@return table
function FillTypeManager.new(customMt) end

function FillTypeManager:initDataStructures() end

function FillTypeManager:loadDefaultTypes() end

---@param xmlFile integer
---@param missionInfo table
---@param baseDirectory string
---@return boolean
function FillTypeManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

function FillTypeManager:loadModFillTypes() end

function FillTypeManager:unloadMapData() end

---@param xmlFile table|integer
---@param baseDirectory string
---@param isBaseType boolean
---@param customEnv string?
---@param finalizeType any
---@return boolean
function FillTypeManager:loadFillTypes(xmlFile, baseDirectory, isBaseType, customEnv, finalizeType) end

---@param fillTypeDesc table
---@return boolean
function FillTypeManager:addFillType(fillTypeDesc) end

---@param nodeId integer
---@param terrainRootNodeId integer
---@param diffuse boolean
---@param normal boolean
---@param height boolean
function FillTypeManager:assignFillTypeTextureArraysFromTerrain(nodeId, terrainRootNodeId, diffuse, normal, height) end

---@param nodeId integer
---@param terrainRootNodeId integer
---@param diffuse string
---@param normal string
---@param height string
function FillTypeManager:assignCustomFillTypeTextureArraysFromTerrain(nodeId, terrainRootNodeId, diffuse, normal, height) end

---@param heightTypes table
---@param terrainRootNodeId integer
---@return boolean
function FillTypeManager:constructTerrainFillLayers(heightTypes, terrainRootNodeId) end

---@param terrainDetailHeightId integer
---@param typeFirstChannel integer
---@param typeNumChannels integer
---@param heightTypes table
---@return boolean
function FillTypeManager:constructFillTypeDistanceTextureArray(terrainDetailHeightId, typeFirstChannel, typeNumChannels, heightTypes) end

---@param index integer
---@return integer
function FillTypeManager:getTextureArrayIndexByFillTypeIndex(index) end

---@param index integer
---@return string
function FillTypeManager:getPrioritizedEffectTypeByFillTypeIndex(index) end

---@param index integer
---@param fruitColor boolean
---@return table
function FillTypeManager:getSmokeColorByFillTypeIndex(index, fruitColor) end

---@param index integer
---@return table
function FillTypeManager:getFillTypeByIndex(index) end

---@param index integer
---@return string
function FillTypeManager:getFillTypeNameByIndex(index) end

---@param index integer
---@return string
function FillTypeManager:getFillTypeTitleByIndex(index) end

---@param indices table
---@return table
function FillTypeManager:getFillTypeNamesByIndices(indices) end

---@param name string
---@return integer
function FillTypeManager:getFillTypeIndexByName(name) end

---@param name string
---@return table
function FillTypeManager:getFillTypeByName(name) end

---@return table
function FillTypeManager:getFillTypes() end

---@param name string
---@param isBaseType boolean
---@return integer
function FillTypeManager:addFillTypeCategory(name, isBaseType) end

---@param fillTypeIndex integer
---@param categoryIndex integer
---@return table
function FillTypeManager:addFillTypeToCategory(fillTypeIndex, categoryIndex) end

---@param names string
---@param warning string?
---@param fillTypes table?
---@return table
function FillTypeManager:getFillTypesByCategoryNames(names, warning, fillTypes) end

---@param fillTypeIndex string
---@param categoryName string
---@return boolean
function FillTypeManager:getIsFillTypeInCategory(fillTypeIndex, categoryName) end

---@param names string
---@param warning string?
---@param fillTypes table?
---@return table
function FillTypeManager:getFillTypesByNames(names, warning, fillTypes) end

---@param xmlFile XMLFile
---@param categoryKey string
---@param namesKey string
---@param requiresFillTypes boolean?
---@return table
function FillTypeManager:getFillTypesFromXML(xmlFile, categoryKey, namesKey, requiresFillTypes) end

---@param name string
---@param isBaseType boolean
---@return any
function FillTypeManager:addFillTypeConverter(name, isBaseType) end

---@param converter integer
---@param sourceFillTypeIndex integer
---@param targetFillTypeIndex integer
---@param conversionFactor number
function FillTypeManager:addFillTypeConversion(converter, sourceFillTypeIndex, targetFillTypeIndex, conversionFactor) end

---@param converterName string
---@return table
function FillTypeManager:getConverterDataByName(converterName) end

---@param fillType integer
---@return table
function FillTypeManager:getSampleByFillType(fillType) end
