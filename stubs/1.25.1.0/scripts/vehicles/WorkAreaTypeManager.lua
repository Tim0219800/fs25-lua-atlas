---@meta
-- FS25 1.25.1.0 : vehicles/WorkAreaTypeManager.lua (generated stub, FS25 Lua Atlas)

---@class WorkAreaTypeManager : AbstractManager
WorkAreaTypeManager = {}

---@param customMt any
---@return table
function WorkAreaTypeManager.new(customMt) end

function WorkAreaTypeManager:initDataStructures() end

---@param name any
---@param attractWildlife any
---@param isAIArea any
---@param isSteeringAssistArea any
function WorkAreaTypeManager:addWorkAreaType(name, attractWildlife, isAIArea, isSteeringAssistArea) end

---@param index any
function WorkAreaTypeManager:getWorkAreaTypeNameByIndex(index) end

---@param name any
function WorkAreaTypeManager:getWorkAreaTypeIndexByName(name) end

---@param name any
function WorkAreaTypeManager:getConfigurationDescByName(name) end

---@param index any
function WorkAreaTypeManager:getWorkAreaTypeByIndex(index) end

---@param index any
function WorkAreaTypeManager:getWorkAreaTypeIsAIArea(index) end

---@param index any
function WorkAreaTypeManager:getWorkAreaTypeIsSteeringAssistArea(index) end
