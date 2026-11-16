---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/events/HusbandryFenceUpdateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that tells a receiver to rebuild the fence of a husbandry placeable, optionally deleting its customizable segments first. The file does not show who sends it or the direction (UNVERIFIED).
---@class HusbandryFenceUpdateEvent : Event
HusbandryFenceUpdateEvent = {}

--- Creates an empty event instance for the network layer to fill in `readStream`.
function HusbandryFenceUpdateEvent.emptyNew() end

--- Creates the event for a placeable and a flag saying whether the customizable fence segments must be deleted.
---@param placeable any
---@param deleteCustomizableSegments any
function HusbandryFenceUpdateEvent.new(placeable, deleteCustomizableSegments) end

--- Reads the placeable (node object) and the delete flag from the stream, then runs the event.
---@param streamId any
---@param connection any
function HusbandryFenceUpdateEvent:readStream(streamId, connection) end

--- Writes the placeable as a node object and the delete flag to the stream.
---@param streamId any
---@param connection any
function HusbandryFenceUpdateEvent:writeStream(streamId, connection) end

--- When the placeable is synchronized, optionally calls `deleteCustomizableSegments()`, then always `finalizeHusbandryFence()`. No rebroadcast is done here.
---@param connection any
function HusbandryFenceUpdateEvent:run(connection) end
