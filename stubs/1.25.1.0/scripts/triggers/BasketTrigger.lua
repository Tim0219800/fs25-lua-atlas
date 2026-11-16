---@meta
-- FS25 1.25.1.0 : triggers/BasketTrigger.lua (generated stub, FS25 Lua Atlas)

--- Small trigger class for a basket (target area) placed in a map through the onCreate mechanism. It registers a trigger and remembers which objects that were thrown (those with a thrownFromPosition field) entered it. Distance or scoring logic exists only as commented-out code, so in this dump the trigger has no visible gameplay effect.
---@class BasketTrigger
BasketTrigger = {}

--- Map onCreate entry point: creates a trigger from the given node and registers it as non-updateable in the mission if loading succeeds, otherwise deletes it.
---@param id integer
function BasketTrigger:onCreate(id) end

--- Constructor. Creates an instance with trigger and node ids set to 0.
---@param customMt table?
---@return table
function BasketTrigger.new(customMt) end

--- Resolves the trigger shape from the node's triggerIndex user attribute (falling back to the node itself), registers the trigger callback, enables it and returns true.
---@param nodeId integer
---@return boolean
function BasketTrigger:load(nodeId) end

--- Removes the trigger registration.
function BasketTrigger:delete() end

--- When enabled, flags an entering actor as inside if its object has a thrownFromPosition, and clears the flag when it leaves. Note: the object returned for the actor is not checked for nil on enter, which would raise an error for unknown nodes.
---@param triggerId integer
---@param otherActorId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId any
function BasketTrigger:triggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end
