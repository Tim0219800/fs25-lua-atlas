---@meta
-- FS25 1.25.1.0 : triggers/WoodUnloadTriggerActivatable.lua (generated stub, FS25 Lua Atlas)

--- Activatable (interaction prompt) that lets an on-foot local player sell the logs in a WoodUnloadTrigger manually. Client side; distance is measured to the trigger's activation node.
---@class WoodUnloadTriggerActivatable
WoodUnloadTriggerActivatable = {}

--- Creates the activatable for a wood unload trigger, with the localized text of action_sellWood.
---@param woodUnloadTrigger any
function WoodUnloadTriggerActivatable.new(woodUnloadTrigger) end

--- Returns true when the local player is not in a vehicle and the local farm is not the spectator farm.
function WoodUnloadTriggerActivatable:getIsActivatable() end

--- Runs the action by calling processWood on the trigger with the local farm id.
function WoodUnloadTriggerActivatable:run() end

--- Returns the distance from the given world position to the trigger's activation node, or math.huge if there is none.
---@param x any
---@param y any
---@param z any
function WoodUnloadTriggerActivatable:getDistance(x, y, z) end
