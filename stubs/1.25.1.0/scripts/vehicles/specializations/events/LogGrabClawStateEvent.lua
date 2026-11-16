---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/LogGrabClawStateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `LogGrabClawStateEvent` (extends `Event`) that replicates the state of one claw of a log grab. It carries the vehicle, a boolean state and a grab index (`LogGrab.GRAB_INDEX_NUM_BITS` bits). It belongs to the vehicle specialization events and defines nothing else.
---@class LogGrabClawStateEvent : Event
LogGrabClawStateEvent = {}

--- Creates an empty `LogGrabClawStateEvent` instance without data, used when the event is read from a network stream.
---@return table
function LogGrabClawStateEvent.emptyNew() end

--- Creates the event with its data: the vehicle, a boolean state and a grab index (`LogGrab.GRAB_INDEX_NUM_BITS` bits).
---@param object table
---@param state table
---@param grabIndex any
---@return table
function LogGrabClawStateEvent.new(object, state, grabIndex) end

--- Reads the event data from the network stream (the vehicle, a boolean state and a grab index (`LogGrab.GRAB_INDEX_NUM_BITS` bits)), then calls `run`.
---@param streamId integer
---@param connection Connection
function LogGrabClawStateEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle, a boolean state and a grab index (`LogGrab.GRAB_INDEX_NUM_BITS` bits)).
---@param streamId integer
---@param connection Connection
function LogGrabClawStateEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setLogGrabClawState(grabIndex, state, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function LogGrabClawStateEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param vehicle table
---@param state integer
---@param grabIndex boolean
---@param noEventSend boolean
function LogGrabClawStateEvent.sendEvent(vehicle, state, grabIndex, noEventSend) end
