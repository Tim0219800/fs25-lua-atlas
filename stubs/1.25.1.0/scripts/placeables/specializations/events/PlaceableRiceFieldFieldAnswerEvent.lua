---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableRiceFieldFieldAnswerEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event sent by the server back to a client to report the outcome (status code) of a rice field creation request made with PlaceableRiceFieldFieldEvent. The client only republishes the code on the message center; the meaning of the codes is defined elsewhere (UNVERIFIED).
---@class PlaceableRiceFieldFieldAnswerEvent : Event
PlaceableRiceFieldFieldAnswerEvent = {}

--- Creates an empty event bound to the main network channel (`NetworkNode.CHANNEL_MAIN`).
---@return table
function PlaceableRiceFieldFieldAnswerEvent.emptyNew() end

--- Builds the answer event from the rice field placeable and a numeric status code.
---@param placeableRiceField any
---@param statusCode any
function PlaceableRiceFieldFieldAnswerEvent.new(placeableRiceField, statusCode) end

--- Reads the rice field object and a UInt8 status code, then runs the event right away.
---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldFieldAnswerEvent:readStream(streamId, connection) end

--- Writes the rice field object and the UInt8 status code.
---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldFieldAnswerEvent:writeStream(streamId, connection) end

--- If the rice field exists and is synchronized, publishes the status code on `g_messageCenter` under the event class as topic. The listener that consumes it is not in this file.
---@param connection Connection
function PlaceableRiceFieldFieldAnswerEvent:run(connection) end
