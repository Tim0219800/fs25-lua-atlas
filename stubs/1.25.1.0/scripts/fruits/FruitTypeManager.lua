---@meta
-- FS25 1.25.1.0 : fruits/FruitTypeManager.lua (generated stub, FS25 Lua Atlas)

---@class FruitTypeManager : AbstractManager
FruitTypeManager = {}

---@param customMt table?
---@return any
function FruitTypeManager.new(customMt) end

function FruitTypeManager:initDataStructures() end

function FruitTypeManager:loadDefaultTypes() end

---@param xmlFileHandle integer
---@param missionInfo table
---@param baseDirectory string?
---@return boolean
function FruitTypeManager:loadMapData(xmlFileHandle, missionInfo, baseDirectory) end

---@param xmlFileHandle integer
---@param missionInfo table
---@param baseDirectory string?
---@param isBaseType boolean?
---@return boolean
function FruitTypeManager:loadFruitTypes(xmlFileHandle, missionInfo, baseDirectory, isBaseType) end

---@param index integer
---@return table
function FruitTypeManager:getFruitTypeByIndex(index) end

---@param index integer
---@return string?
function FruitTypeManager:getFruitTypeNameByIndex(index) end

---@param name string
---@return table
function FruitTypeManager:getFruitTypeByName(name) end

---@return table
function FruitTypeManager:getFruitTypes() end

---@param index integer
---@return integer?
function FruitTypeManager:getFruitTypeIndexByFillTypeIndex(index) end

---@param index integer
---@return table?
function FruitTypeManager:getFruitTypeByFillTypeIndex(index) end

---@param index integer
---@return integer?
function FruitTypeManager:getFillTypeIndexByFruitTypeIndex(index) end

---@param index integer
---@return table?
function FruitTypeManager:getFillTypeByFruitTypeIndex(index) end

---@param index integer
---@return string?
function FruitTypeManager:getFillTypeNameByFruitTypeIndex(index) end

---@param index integer
---@param isForageCutter boolean?
---@return number
function FruitTypeManager:getCutHeightByFruitTypeIndex(index, isForageCutter) end

---@param name string
---@param isBaseType boolean
---@return integer?
function FruitTypeManager:addFruitTypeCategory(name, isBaseType) end

---@param fruitTypeIndex integer
---@param categoryIndex integer
---@return table
function FruitTypeManager:addFruitTypeToCategory(fruitTypeIndex, categoryIndex) end

---@param names string
---@param warning string
---@return array
function FruitTypeManager:getFruitTypesByCategoryNames(names, warning) end

---@param names string
---@param warning string
---@return table
function FruitTypeManager:getFruitTypeIndicesByCategoryNames(names, warning) end

---@param names string
---@param warning string?
---@return array
function FruitTypeManager:getFruitTypesByNames(names, warning) end

---@param names string
---@param warning string?
---@return array
function FruitTypeManager:getFruitTypeIndicesByNames(names, warning) end

---@param names string
---@param warning string?
---@return table
function FruitTypeManager:getFillTypesByFruitTypeNames(names, warning) end

---@param names string
---@param warning string?
---@return table
function FruitTypeManager:getFillTypeIndicesByFruitTypeNames(names, warning) end

---@param fruitTypeCategoryNames string
---@param warning string?
---@return table
function FruitTypeManager:getFillTypesByFruitTypeCategoryNames(fruitTypeCategoryNames, warning) end

---@param fruitTypeCategoryNames string
---@param warning string?
---@return table
function FruitTypeManager:getFillTypeIndicesByFruitTypeCategoryName(fruitTypeCategoryNames, warning) end

---@param index integer
---@return boolean
function FruitTypeManager:isFillTypeWindrow(index) end

---@param index integer
---@return integer?
function FruitTypeManager:getWindrowFillTypeIndexByFruitTypeIndex(index) end

---@param fillTypeIndex integer
---@param defaultValue number
---@return number
function FruitTypeManager:getFillTypeLiterPerSqm(fillTypeIndex, defaultValue) end

---@param name string
---@param isBaseType boolean
---@return integer
function FruitTypeManager:addFruitTypeConverter(name, isBaseType) end

---@param converter integer
---@param fruitTypeName integer
---@param fillTypeName integer
---@param conversionFactor number
function FruitTypeManager:addFruitTypeConversion(converter, fruitTypeName, fillTypeName, conversionFactor) end

---@param converterName string
---@return table
function FruitTypeManager:getConverterDataByName(converterName) end

---@param name string
---@param filename string
---@param requiredMapModName string?
function FruitTypeManager:addModFoliageType(name, filename, requiredMapModName) end
