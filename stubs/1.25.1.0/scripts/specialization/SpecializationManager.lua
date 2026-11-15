---@meta
-- FS25 1.25.1.0 : specialization/SpecializationManager.lua (generated stub, FS25 Lua Atlas)

---@class SpecializationManager : AbstractManager
SpecializationManager = {}

---@param typeName string
---@param xmlFilename string
---@param customMt table?
---@return SpecializationManager
function SpecializationManager.new(typeName, xmlFilename, customMt) end

function SpecializationManager:initDataStructures() end

---@return boolean
function SpecializationManager:loadMapData() end

---@param name string
---@param className string
---@param filename string
---@param customEnvironment string
---@return boolean
function SpecializationManager:addSpecialization(name, className, filename, customEnvironment) end

function SpecializationManager:initSpecializations() end

function SpecializationManager:postInitSpecializations() end

---@param name string
---@return table?
function SpecializationManager:getSpecializationByName(name) end

---@param name string
---@return table?
function SpecializationManager:getSpecializationObjectByName(name) end

---@return table
function SpecializationManager:getSpecializations() end
