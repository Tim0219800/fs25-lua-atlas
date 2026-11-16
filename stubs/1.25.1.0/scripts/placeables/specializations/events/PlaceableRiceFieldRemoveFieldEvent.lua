---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableRiceFieldRemoveFieldEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that deletes one field of a PlaceableRiceField by index. A client sends it to the server, which applies it and broadcasts it back to all clients.
---@class PlaceableRiceFieldRemoveFieldEvent : Event
PlaceableRiceFieldRemoveFieldEvent = {}

--- Creates an empty event bound to the main network channel (`NetworkNode.CHANNEL_MAIN`).
---@return table
function PlaceableRiceFieldRemoveFieldEvent.emptyNew() end

--- Builds the event from the rice field placeable and the index of the field to remove.
---@param placeableRiceField any
---@param fieldIndex any
function PlaceableRiceFieldRemoveFieldEvent.new(placeableRiceField, fieldIndex) end

--- Reads the rice field object and a UInt8 field index, then runs the event.
---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldRemoveFieldEvent:readStream(streamId, connection) end

--- Writes the rice field object and the UInt8 field index.
---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldRemoveFieldEvent:writeStream(streamId, connection) end

--- If the rice field is synchronized, removes the field via `removeFieldByIndex`; when received by the server (the connection is not the server's), it then rebroadcasts the same event to all clients.
---@param connection Connection
function PlaceableRiceFieldRemoveFieldEvent:run(connection) end
