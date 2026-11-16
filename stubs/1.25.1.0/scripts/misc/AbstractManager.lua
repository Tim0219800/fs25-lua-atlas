---@meta
-- FS25 1.25.1.0 : misc/AbstractManager.lua (generated stub, FS25 Lua Atlas)

--- Abstract base class for map-bound managers (BaleManager, ConsumableManager and others inherit from it). It defines the lifecycle: construction calls initDataStructures, then load and loadMapData run at startup and unloadMapData resets the state when the mission is deleted.
---@class AbstractManager
AbstractManager = {}

--- Creates the manager instance with the given metatable (or the default one), calls initDataStructures and marks map data as not loaded. Prints a callstack if the argument is not a table.
---@param customMt any
---@return table
function AbstractManager.new(customMt) end

--- Empty hook that subclasses override to create their tables; called from the constructor and again on unloadMapData.
function AbstractManager:initDataStructures() end

--- Hook for initial loading, returns true by default. Subclasses override it to read their own configuration.
---@return boolean
function AbstractManager:load() end

--- Sets the loadedMapData flag and returns true. In a development version it logs an error and a callstack if map data was already loaded without being unloaded first. Subclasses extend it to read map XML.
---@return boolean
function AbstractManager:loadMapData() end

--- Clears loadedMapData and calls initDataStructures again, which discards all data of the manager at mission end.
function AbstractManager:unloadMapData() end
