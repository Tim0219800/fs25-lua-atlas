---@meta
-- FS25 1.25.1.0 : objects/SimParticleSystem.lua (generated stub, FS25 Lua Atlas)

--- Map object created from an i3d node (onCreate) that pre-simulates a precipitation-type particle system so it already looks established when the game starts. It is registered as a non-updateable in the current mission and has no update or delete logic.
---@class SimParticleSystem
SimParticleSystem = {}

--- i3d onCreate callback: builds a SimParticleSystem for the node and registers it with `g_currentMission:addNonUpdateable`.
---@param id integer
function SimParticleSystem:onCreate(id) end

--- Constructor. If the node is a shape whose geometry has the precipitation class id, it reads the particle system lifespan and advances the simulation by that duration. Engine calls themselves are UNVERIFIED (not in the dump).
---@param name integer
---@return table
function SimParticleSystem.new(name) end
