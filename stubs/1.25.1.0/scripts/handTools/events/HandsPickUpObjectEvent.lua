---@meta
-- FS25 1.25.1.0 : handTools/events/HandsPickUpObjectEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event for the hands hand tool picking up an object or a split shape (log). A client sends the request to the server; the server runs `pickUpTarget` and rebroadcasts to the clients, and answers with `HandsPickUpFailedEvent` if the pickup fails. Targets are sent as a compressed distance plus a split shape id or a node object.
---@class HandsPickUpObjectEvent : Event
HandsPickUpObjectEvent = {}

--- Creates an empty event instance for the network layer to fill in `readStream`.
---@return table
function HandsPickUpObjectEvent.emptyNew() end

--- Creates the event for a hands hand tool and a target table (with `node` and `distance`).
---@param hands HandTool
---@param target table
---@return table
function HandsPickUpObjectEvent.new(hands, target) end

--- Reads the hands, the pickup distance (compressed 0 to `HandToolHands.PICKUP_DISTANCE`, 10 bits), a split shape flag, then either a split shape id or a node object, to rebuild `target.node`. Logs errors if the shape or object cannot be resolved. Then runs the event.
---@param streamId integer
---@param connection table
function HandsPickUpObjectEvent:readStream(streamId, connection) end

--- Writes the hands, the compressed distance, a split shape flag and the split shape id or the node object of the target; logs an error if the target is neither.
---@param streamId integer
---@param connection table
function HandsPickUpObjectEvent:writeStream(streamId, connection) end

--- If received by the server, rebroadcasts it (gated on the target object, or on the hands if the target is a split shape). When the hands are synchronized, calls `pickUpTarget(target, true)`; if it fails on the server, sends `HandsPickUpFailedEvent` back to the requester.
---@param connection table
function HandsPickUpObjectEvent:run(connection) end

--- Helper unless `noEventSend` is true: a server broadcasts the event (with the same ghost-object gating as `run`), a client sends it to the server.
---@param hands HandTool
---@param target table
---@param noEventSend boolean?
function HandsPickUpObjectEvent.sendEvent(hands, target, noEventSend) end

--- Returns the networked object for the target node, used as the gate for broadcasting, or nil if the target is missing, 0, or a split shape (which has no network object).
---@param target table?
---@return table?
function HandsPickUpObjectEvent.getTargetGhostObject(target) end
