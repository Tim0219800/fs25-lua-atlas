---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TrailerToggleTipSideEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes the preferred tip side of a trailer between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class TrailerToggleTipSideEvent : Event
TrailerToggleTipSideEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function TrailerToggleTipSideEvent.emptyNew() end

--- Builds the event with the data to send (a node object and a tip side index (Trailer.TIP_SIDE_NUM_BITS bits)); stored on the instance for `writeStream`.
---@param object table
---@param tipSideIndex integer
function TrailerToggleTipSideEvent.new(object, tipSideIndex) end

--- Reads a node object and a tip side index (Trailer.TIP_SIDE_NUM_BITS bits) from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function TrailerToggleTipSideEvent:readStream(streamId, connection) end

--- Writes a node object and a tip side index (Trailer.TIP_SIDE_NUM_BITS bits) to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function TrailerToggleTipSideEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: on the server re-broadcasts itself, then calls `setPreferedTipSide(index, true)` on the object if synchronized.
---@param connection Connection
function TrailerToggleTipSideEvent:run(connection) end
