---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetTurnedOnEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes the turned-on state of a vehicle or implement between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class SetTurnedOnEvent : Event
SetTurnedOnEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function SetTurnedOnEvent.emptyNew() end

--- Builds the event with the data to send (a node object and a boolean turned-on state); stored on the instance for `writeStream`.
---@param object table
---@param isTurnedOn boolean
function SetTurnedOnEvent.new(object, isTurnedOn) end

--- Reads a node object and a boolean turned-on state from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function SetTurnedOnEvent:readStream(streamId, connection) end

--- Writes a node object and a boolean turned-on state to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function SetTurnedOnEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: on the server re-broadcasts itself to the other clients, then calls `setIsTurnedOn(state, true)` on the object if synchronized.
---@param connection Connection
function SetTurnedOnEvent:run(connection) end

--- Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true.
---@param vehicle table
---@param isTurnedOn boolean
---@param noEventSend boolean
function SetTurnedOnEvent.sendEvent(vehicle, isTurnedOn, noEventSend) end
