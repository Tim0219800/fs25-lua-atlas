---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableShallowWaterSimulation.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization with no prerequisites that registers water planes and obstacles from placeable.shallowWaterSimulation with g_currentMission.shallowWaterSimulation, so water on the building reacts to the shallow water simulation. It does nothing if that simulation does not exist or for construction previews. The simulation class itself is not in the dump (UNVERIFIED).
---@class PlaceableShallowWaterSimulation
PlaceableShallowWaterSimulation = {}

--- Always returns true.
---@param specializations table
---@return boolean
function PlaceableShallowWaterSimulation.prerequisitesPresent(specializations) end

--- Skips if there is no simulation or the placeable is a construction preview. Otherwise optionally applies a base material by name to each water plane and registers it, then adds each obstacle node with type (default rectangle), size, offset and Y rotation.
---@param savegame table
function PlaceableShallowWaterSimulation:onLoad(savegame) end

--- Removes the water planes (area geometry and plane) and obstacles that this placeable had registered.
function PlaceableShallowWaterSimulation:onDelete() end
