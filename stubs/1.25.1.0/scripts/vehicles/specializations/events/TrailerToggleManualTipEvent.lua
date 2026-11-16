---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TrailerToggleManualTipEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes the start or stop of manual tipping on a trailer between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class TrailerToggleManualTipEvent : Event
TrailerToggleManualTipEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function TrailerToggleManualTipEvent.emptyNew() end

--- Builds the event with the data to send (a node object and a boolean tipping state); stored on the instance for `writeStream`.
---@param object table
---@param state boolean
---@return TrailerToggleManualTipEvent
function TrailerToggleManualTipEvent.new(object, state) end

--- Reads a node object and a boolean tipping state from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function TrailerToggleManualTipEvent:readStream(streamId, connection) end

--- Writes a node object and a boolean tipping state to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function TrailerToggleManualTipEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: on the server re-broadcasts itself, then calls `startTipping(nil, true)` when the state is true, else `stopTipping(true)`.
---@param connection Connection
function TrailerToggleManualTipEvent:run(connection) end

--- Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true.
---@param vehicle table
---@param state boolean
---@param noEventSend boolean?
function TrailerToggleManualTipEvent.sendEvent(vehicle, state, noEventSend) end
