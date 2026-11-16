---@meta
-- FS25 1.25.1.0 : graphics/HumanSounds.lua (generated stub, FS25 Lua Atlas)

--- Sound holder for the human player model. In this dump only the constructor remains: it stores a base directory and builds a raycast collision mask (static objects, water, terrain, terrain delta, road, building, vehicle). Other members are not present (UNVERIFIED).
---@class HumanSounds
HumanSounds = {}

--- Creates the object with isLoaded false, the given baseDirectory and a raycastMask combining several CollisionFlag values; vehicles are included so a player on a boat is detected.
---@param baseDirectory any
---@param customMt any
---@return table
function HumanSounds.new(baseDirectory, customMt) end
