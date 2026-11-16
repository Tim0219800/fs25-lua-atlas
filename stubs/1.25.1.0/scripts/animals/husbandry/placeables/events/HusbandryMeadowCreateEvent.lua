---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/events/HusbandryMeadowCreateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event telling that a husbandry meadow is created or not, chosen by a boolean. A client sends it to the server, which rebroadcasts it to the other clients and applies it locally.
---@class HusbandryMeadowCreateEvent : Event
HusbandryMeadowCreateEvent = {}

--- Creates an empty event instance for the network layer to fill in `readStream`.
function HusbandryMeadowCreateEvent.emptyNew() end

--- Creates the event for a placeable and a boolean saying whether the meadow should be created.
---@param placeable any
---@param createMeadow any
function HusbandryMeadowCreateEvent.new(placeable, createMeadow) end

--- Reads the placeable (node object) and the create bool from the stream, then runs the event.
---@param streamId any
---@param connection any
function HusbandryMeadowCreateEvent:readStream(streamId, connection) end

--- Writes the placeable as a node object and the create bool to the stream.
---@param streamId any
---@param connection any
function HusbandryMeadowCreateEvent:writeStream(streamId, connection) end

--- If received by the server, rebroadcasts it to other clients. When the placeable is synchronized, calls `createMeadow(createMeadow, true)` on it.
---@param connection any
function HusbandryMeadowCreateEvent:run(connection) end
