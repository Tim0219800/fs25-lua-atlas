---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/events/HusbandryFenceValidateEvent.lua (generated stub, FS25 Lua Atlas)

--- Request/response event pair for validating a husbandry fence. A client sends the placeable to the server, which tries to finalize the fence and answers with a success bool that the client publishes on the message center.
---@class HusbandryFenceValidateEvent : Event
HusbandryFenceValidateEvent = {}

--- Creates an empty event instance for the network layer to fill in `readStream`.
function HusbandryFenceValidateEvent.emptyNew() end

--- Creates the client-to-server request holding the placeable to validate. Note: `run` also calls `HusbandryFenceValidateEvent.newServerToClient`, which is not defined in this file (UNVERIFIED, may be missing in the dump or a bug).
---@param placeable any
function HusbandryFenceValidateEvent.new(placeable) end

--- If the sender is a client, reads the placeable node object; if the sender is the server, reads the success bool. Then runs the event.
---@param streamId any
---@param connection any
function HusbandryFenceValidateEvent:readStream(streamId, connection) end

--- On a client connection to the server, writes the placeable node object; otherwise writes `self.success` as a bool.
---@param streamId any
---@param connection any
function HusbandryFenceValidateEvent:writeStream(streamId, connection) end

--- Client: publishes `HusbandryFenceValidateEvent` with the success value on `g_messageCenter`. Server: calls `tryFinalizeFence()` on the placeable and sends the result back to the requesting connection.
---@param connection any
function HusbandryFenceValidateEvent:run(connection) end
