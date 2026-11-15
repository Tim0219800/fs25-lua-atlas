---@meta
-- FS25 1.25.1.0 : field/FieldManager.lua (generated stub, FS25 Lua Atlas)

---@class FieldManager : AbstractManager
FieldManager = {}

---@param customMt table
---@return FieldManager
function FieldManager.new(customMt) end

function FieldManager:initDataStructures() end

---@param xmlFile XMLFile
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function FieldManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

function FieldManager:unloadMapData() end

function FieldManager:delete() end

---@param xmlFilename string
function FieldManager:loadFromXMLFile(xmlFilename) end

---@param xmlFilename string
function FieldManager:saveToXMLFile(xmlFilename) end
