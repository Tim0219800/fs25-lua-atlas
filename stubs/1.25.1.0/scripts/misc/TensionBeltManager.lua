---@meta
-- FS25 1.25.1.0 : misc/TensionBeltManager.lua (generated stub, FS25 Lua Atlas)

--- Plain manager (not an AbstractManager subclass) that stores the visual definitions of tension belts (straps used to secure loads). Belt types are registered when a map i3d node using the onCreateTensionBelt callback is loaded; each reads user attributes and child nodes (material, dummy material, hooks, ratchet). The first registered belt becomes the default.
---@class TensionBeltManager
TensionBeltManager = {}

--- Constructor: builds the manager with the given or default metatable and initialises its data tables.
---@param customMt any
---@return table
function TensionBeltManager.new(customMt) end

--- Empties the belts table and clears the default belt data.
function TensionBeltManager:initDataStructures() end

--- Called on map unload: simply resets all stored belts by re-running initDataStructures.
function TensionBeltManager:unloadMapData() end

--- i3d onCreate callback for a belt template node. Reads user attributes name (default "default") and width (default 0.15), then scans children flagged isMaterial, isDummyMaterial, isHook (first and second hook) and isRatchet. Warns and skips if the type exists or if material or dummy material is missing; stores the belt and sets the first one as default. Uses the global g_tensionBeltManager.
---@param _ any
---@param id any
function TensionBeltManager.onCreateTensionBelt(_, id) end

--- Builds the internal key for a belt name: the uppercased name prefixed with BELT_TYPE_.
---@param beltName any
function TensionBeltManager:getType(beltName) end

--- Returns the belt definition for a name, falling back to the default belt when the name is nil or unknown (nil if no belt was ever registered).
---@param beltName any
function TensionBeltManager:getBeltData(beltName) end
