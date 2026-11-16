---@meta
-- FS25 1.25.1.0 : triggers/LadderTrigger.lua (generated stub, FS25 Lua Atlas)

--- Client-side trigger that tells the local player's mover it is on a ladder while the player's root node is inside the trigger volume. It is created from an i3d trigger node at map load and warns if the node's collision mask lacks the player bit.
---@class LadderTrigger
LadderTrigger = {}

--- Map-load entry point for a ladder trigger node: builds a LadderTrigger and adds it to the mission's non-updateable objects.
---@param id integer
function LadderTrigger:onCreate(id) end

--- Creates the instance. Only on a client it checks that the node's collision mask has the PLAYER flag (warning otherwise) and registers the physics trigger callback `triggerCallback`; on a dedicated server nothing is registered.
---@param node integer
---@return table
function LadderTrigger.new(node) end

--- Removes the physics trigger if one was registered.
function LadderTrigger:delete() end

--- On enter or leave of the local player's root node, calls setIsOnLadder(true) or (false) on the local player's mover. Other actors and stay events are ignored.
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function LadderTrigger:triggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end
