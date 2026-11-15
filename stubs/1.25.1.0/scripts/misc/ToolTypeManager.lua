---@meta
-- FS25 1.25.1.0 : misc/ToolTypeManager.lua (generated stub, FS25 Lua Atlas)

---@class ToolTypeManager : AbstractManager
ToolTypeManager = {}

---@param customMt any
---@return table
function ToolTypeManager.new(customMt) end

function ToolTypeManager:initDataStructures() end

---@return boolean
function ToolTypeManager:loadMapData() end

---@param name string
---@return table
function ToolTypeManager:addToolType(name) end

---@param index integer
---@return string
function ToolTypeManager:getToolTypeNameByIndex(index) end

---@param name string
---@return integer
function ToolTypeManager:getToolTypeIndexByName(name) end

---@return integer
function ToolTypeManager:getNumberOfToolTypes() end
