---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/events/HusbandryFenceCustomizeStartEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event announcing that a player starts customizing the fence of a husbandry placeable. Sent by a client to the server, which rebroadcasts it to the other clients and applies it locally.
---@class HusbandryFenceCustomizeStartEvent : Event
HusbandryFenceCustomizeStartEvent = {}

--- Creates an empty event instance for the network layer to fill in `readStream`.
function HusbandryFenceCustomizeStartEvent.emptyNew() end

--- Creates the event for the given husbandry placeable.
---@param placeable any
function HusbandryFenceCustomizeStartEvent.new(placeable) end

--- Reads the placeable as a node object from the stream, then runs the event.
---@param streamId any
---@param connection any
function HusbandryFenceCustomizeStartEvent:readStream(streamId, connection) end

--- Writes the placeable as a node object to the stream.
---@param streamId any
---@param connection any
function HusbandryFenceCustomizeStartEvent:writeStream(streamId, connection) end

--- If received by the server, rebroadcasts it to other clients. When the placeable is synchronized, resolves the sending user (server only) and calls `startFenceCustomization(user, true)`.
---@param connection any
function HusbandryFenceCustomizeStartEvent:run(connection) end
