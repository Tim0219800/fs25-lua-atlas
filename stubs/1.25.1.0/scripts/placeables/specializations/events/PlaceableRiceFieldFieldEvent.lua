---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableRiceFieldFieldEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that submits a newly drawn rice field (polygon, height, water height) to the receiving side of a PlaceableRiceField. The receiver builds the field and finalizes it, then answers with PlaceableRiceFieldFieldAnswerEvent. It is meant to go from a client to the server, but this file does not check which side runs it.
---@class PlaceableRiceFieldFieldEvent : Event
PlaceableRiceFieldFieldEvent = {}

--- Creates an empty event bound to the main network channel (`NetworkNode.CHANNEL_MAIN`).
---@return table
function PlaceableRiceFieldFieldEvent.emptyNew() end

--- Builds the event from the rice field placeable and a field table holding height, polygon and water height.
---@param placeableRiceField any
---@param field any
function PlaceableRiceFieldFieldEvent.new(placeableRiceField, field) end

--- Reads the rice field, the height, the vertex count and the 2D vertices, then the water height, creating the field via `createNewField` and a `Polygon2D`, and runs the event. Note: the rice field is not nil-checked before `createNewField`.
---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldFieldEvent:readStream(streamId, connection) end

--- Writes the rice field, the field height, the vertex count and each polygon vertex coordinate as Float32, then the water height.
---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldFieldEvent:writeStream(streamId, connection) end

--- If the rice field is synchronized, calls `finalizeNewField` with the new field and a flag set to true, and its callback replies to the sender with a PlaceableRiceFieldFieldAnswerEvent holding the status code.
---@param connection Connection
function PlaceableRiceFieldFieldEvent:run(connection) end
