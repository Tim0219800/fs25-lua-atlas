---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/events/HusbandryFenceCustomizeFinishEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event announcing that a player has finished customizing the fence of a husbandry placeable, with a success flag. A client sends it to the server, which rebroadcasts it to the other clients and applies it locally.
---@class HusbandryFenceCustomizeFinishEvent : Event
HusbandryFenceCustomizeFinishEvent = {}

--- Creates an empty event instance for the network layer to fill in `readStream`.
function HusbandryFenceCustomizeFinishEvent.emptyNew() end

--- Creates the event for the given husbandry placeable and a boolean telling whether the customization succeeded.
---@param placeable any
---@param success any
function HusbandryFenceCustomizeFinishEvent.new(placeable, success) end

--- Reads the placeable (node object) and the success bool from the stream, then runs the event.
---@param streamId any
---@param connection any
function HusbandryFenceCustomizeFinishEvent:readStream(streamId, connection) end

--- Writes the placeable as a node object and the success bool to the stream.
---@param streamId any
---@param connection any
function HusbandryFenceCustomizeFinishEvent:writeStream(streamId, connection) end

--- If received by the server, rebroadcasts it to other clients. When the placeable is synchronized, resolves the sending user (server only) and calls `finishFenceCustomization(user, success, true)`.
---@param connection any
function HusbandryFenceCustomizeFinishEvent:run(connection) end
