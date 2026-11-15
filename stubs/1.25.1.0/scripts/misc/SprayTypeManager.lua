---@meta
-- FS25 1.25.1.0 : misc/SprayTypeManager.lua (generated stub, FS25 Lua Atlas)

---@class SprayTypeManager : AbstractManager
SprayTypeManager = {}

---@param customMt any
---@return table
function SprayTypeManager.new(customMt) end

function SprayTypeManager:initDataStructures() end

function SprayTypeManager:loadDefaultTypes() end

---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function SprayTypeManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

---@param xmlFile any
---@param missionInfo any
---@param isBaseType any
---@return boolean
function SprayTypeManager:loadSprayTypes(xmlFile, missionInfo, isBaseType) end

---@param name string
---@param litersPerSecond number
---@param typeName any
---@param sprayGroundType any
---@param isBaseType any
---@return table
function SprayTypeManager:addSprayType(name, litersPerSecond, typeName, sprayGroundType, isBaseType) end

---@param index integer
---@return table
function SprayTypeManager:getSprayTypeByIndex(index) end

---@param name string
---@return table
function SprayTypeManager:getSprayTypeByName(name) end

---@param index integer
---@return string
function SprayTypeManager:getFillTypeNameByIndex(index) end

---@param name string
---@return integer
function SprayTypeManager:getFillTypeIndexByName(name) end

---@param name string
---@return table
function SprayTypeManager:getFillTypeByName(name) end

---@param index any
function SprayTypeManager:getSprayTypeByFillTypeIndex(index) end

---@param index integer
---@return integer
function SprayTypeManager:getSprayTypeIndexByFillTypeIndex(index) end

---@return table
function SprayTypeManager:getSprayTypes() end
