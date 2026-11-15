---@meta
-- FS25 1.25.1.0 : specialization/TypeManager.lua (stub généré, atlas Lua FS25)

---@class TypeManager
TypeManager = {}

---@param typeName any
---@param rootElementName any
---@param xmlFilename any
---@param specializationManager any
---@param customMt any
---@return table
function TypeManager.new(typeName, rootElementName, xmlFilename, specializationManager, customMt) end

---@return boolean
function TypeManager:loadMapData() end

function TypeManager:unloadMapData() end

---@param typeName string
---@param className string
---@param filename string
---@param customEnvironment string
---@param parent any
---@return boolean
function TypeManager:addType(typeName, className, filename, customEnvironment, parent) end

---@param xmlFile any
---@param key any
---@param isDLC any
---@param modDir any
---@param modName any
function TypeManager:loadTypeFromXML(xmlFile, key, isDLC, modDir, modName) end

---@param typeName any
---@param specName any
function TypeManager:addSpecialization(typeName, specName) end

function TypeManager:validateTypes() end

function TypeManager:finalizeTypes() end

function TypeManager:getTypes() end

---@param typeName any
function TypeManager:removeType(typeName) end

---@param typeName any
---@param modName any
function TypeManager:getTypeByName(typeName, modName) end

---@param xmlFilename any
function TypeManager:getObjectTypeFromXML(xmlFilename) end
