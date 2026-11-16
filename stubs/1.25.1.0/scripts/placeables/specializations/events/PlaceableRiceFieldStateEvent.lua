---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableRiceFieldStateEvent.lua (generated stub, FS25 Lua Atlas)

--- Request/response network event used by the rice field dialog: a client asks the server for the crop state of one field, and the server answers with the fruit type and growth state indices, which the client republishes through the message center. The direction is detected with `connection:getIsServer()`.
---@class PlaceableRiceFieldStateEvent : Event
PlaceableRiceFieldStateEvent = {}

--- Creates an empty event using the class metatable, with the default channel.
---@return table
function PlaceableRiceFieldStateEvent.emptyNew() end

--- Builds the client-to-server request: the rice field placeable and the index of the field whose crop state is wanted.
---@param placeableRiceField any
---@param fieldIndex any
function PlaceableRiceFieldStateEvent.new(placeableRiceField, fieldIndex) end

--- Builds the server answer carrying the field index, the fruit type index and the growth state index of the field.
---@param placeableRiceField any
---@param fieldIndex any
---@param fruitTypeIndex any
---@param growthStateIndex any
function PlaceableRiceFieldStateEvent.newServerToClient(placeableRiceField, fieldIndex, fruitTypeIndex, growthStateIndex) end

--- Reads the rice field and field index; fruit type (`FruitTypeManager.SEND_NUM_BITS` bits) and growth state are only read when the data comes from the server. Then runs the event.
---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldStateEvent:readStream(streamId, connection) end

--- Writes the rice field and field index; when sending to a client it also writes the fruit type and growth state. Mirrors `readStream`.
---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldStateEvent:writeStream(streamId, connection) end

--- On the server, queries `getRiceFieldState` and replies to the sender with a server-to-client event; on a client, publishes the fruit type and growth state on `g_messageCenter` (used by the rice field dialog). Skipped if the field is not synchronized.
---@param connection Connection
function PlaceableRiceFieldStateEvent:run(connection) end
