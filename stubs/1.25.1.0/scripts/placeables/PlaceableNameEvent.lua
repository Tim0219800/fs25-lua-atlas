---@meta
-- FS25 1.25.1.0 : placeables/PlaceableNameEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that carries a custom name for a placeable. A client sends it to the server, which applies the name and rebroadcasts it to all clients. A nil name means the custom name is reset.
---@class PlaceableNameEvent : Event
PlaceableNameEvent = {}

--- Creates an empty event instance, used by the network layer before `readStream` fills it.
function PlaceableNameEvent.emptyNew() end

--- Builds an event for a placeable and a new name. Passing nil as the name marks the event as a reset and stores an empty string.
---@param placeable any
---@param name any
function PlaceableNameEvent.new(placeable, name) end

--- Reads the placeable object, a reset flag and, if not a reset, the name string from the stream, then calls `run`. Note: on a reset the name field is not assigned from the stream.
---@param streamId any
---@param connection any
function PlaceableNameEvent:readStream(streamId, connection) end

--- Writes the placeable node object and the reset flag, followed by the name string only when the event is not a reset.
---@param streamId any
---@param connection any
function PlaceableNameEvent:writeStream(streamId, connection) end

--- Applies the name through `placeable:setName(name, true)` and logs it. When received by the server (connection is not the server), it rebroadcasts the event to the clients.
---@param connection any
function PlaceableNameEvent:run(connection) end

--- Sends a name event unless `noEventSend` is true: the server broadcasts it to clients, a client sends it to the server connection.
---@param placeable any
---@param name any
---@param noEventSend any
function PlaceableNameEvent.sendEvent(placeable, name, noEventSend) end
