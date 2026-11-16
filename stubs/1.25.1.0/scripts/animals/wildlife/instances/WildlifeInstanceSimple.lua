---@meta
-- FS25 1.25.1.0 : animals/wildlife/instances/WildlifeInstanceSimple.lua (generated stub, FS25 Lua Atlas)

--- Simple wildlife instance class, a child of `WildlifeInstance`. The file only defines the despawn test based on its flee state machine.
---@class WildlifeInstanceSimple : WildlifeInstance
WildlifeInstanceSimple = {}

--- Returns true if the instance is not fleeing to despawn, has a `despawnTime`, and has lived at least that long since spawning.
---@return boolean
function WildlifeInstanceSimple:getCanDespawnNow() end
