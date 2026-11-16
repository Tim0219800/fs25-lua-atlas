---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TrailerToggleManualDoorEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes the manually operated door of a trailer tip side (open or closed) between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class TrailerToggleManualDoorEvent : Event
TrailerToggleManualDoorEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function TrailerToggleManualDoorEvent.emptyNew() end

--- Builds the event with the data to send (a node object, a boolean door state and a tip side index (Trailer.TIP_SIDE_NUM_BITS bits)); stored on the instance for `writeStream`.
---@param object table
---@param tipSideIndex boolean
---@param state boolean
function TrailerToggleManualDoorEvent.new(object, tipSideIndex, state) end

--- Reads a node object, a boolean door state and a tip side index (Trailer.TIP_SIDE_NUM_BITS bits) from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function TrailerToggleManualDoorEvent:readStream(streamId, connection) end

--- Writes a node object, a boolean door state and a tip side index (Trailer.TIP_SIDE_NUM_BITS bits) to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function TrailerToggleManualDoorEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: on the server re-broadcasts itself, then calls `setTrailerDoorState(tipSideIndex, state, true)` on the object if synchronized.
---@param connection Connection
function TrailerToggleManualDoorEvent:run(connection) end

--- Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true.
---@param vehicle table
---@param tipSideIndex boolean
---@param state integer
---@param noEventSend boolean
function TrailerToggleManualDoorEvent.sendEvent(vehicle, tipSideIndex, state, noEventSend) end
