---@meta
-- FS25 1.25.1.0 : misc/ToolTypeManager.lua (generated stub, FS25 Lua Atlas)

--- Manager (subclass of AbstractManager) that registers tool type names and numbers them in registration order. Five are built in: undefined, dischargeable, pallet, trigger, bale. initDataStructures publishes the global table ToolType (NAME to index) so scripts can write ToolType.BALE.
---@class ToolTypeManager : AbstractManager
ToolTypeManager = {}

--- Constructor: creates the manager on top of AbstractManager with the given or default metatable.
---@param customMt any
---@return table
function ToolTypeManager.new(customMt) end

--- Resets the index-to-name and name-to-index tables and assigns the global ToolType to the name-to-index table.
function ToolTypeManager:initDataStructures() end

--- Calls the parent loader then registers the five built-in tool types (undefined, dischargeable, pallet, trigger, bale), giving them indices 1 to 5. Returns true.
---@return boolean
function ToolTypeManager:loadMapData() end

--- Registers a tool type under its uppercased name and returns its index; an existing name is not duplicated. Warns and returns nil if the name is not a valid index name.
---@param name string
---@return table
function ToolTypeManager:addToolType(name) end

--- Returns the tool type name for an index, or "UNDEFINED" when the index is unknown.
---@param index integer
---@return string
function ToolTypeManager:getToolTypeNameByIndex(index) end

--- Returns the tool type index for a name (case-insensitive), or the index of UNDEFINED when the name is unknown.
---@param name string
---@return integer
function ToolTypeManager:getToolTypeIndexByName(name) end

--- Returns how many tool types are registered.
---@return integer
function ToolTypeManager:getNumberOfToolTypes() end
