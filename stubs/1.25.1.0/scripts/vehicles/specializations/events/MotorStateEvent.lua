---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/MotorStateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `MotorStateEvent` (extends `Event`) that replicates the motor state of a vehicle. It carries the vehicle and a motor state serialized through `MotorState`. It belongs to the vehicle specialization events and defines nothing else.
---@class MotorStateEvent : Event
MotorStateEvent = {}

--- Creates an empty `MotorStateEvent` instance without data, used when the event is read from a network stream.
---@return table
function MotorStateEvent.emptyNew() end

--- Creates the event with its data: the vehicle and a motor state serialized through `MotorState`.
---@param vehicle table
---@param motorState integer
function MotorStateEvent.new(vehicle, motorState) end

--- Reads the event data from the network stream (the vehicle and a motor state serialized through `MotorState`), then calls `run`.
---@param streamId integer
---@param connection Connection
function MotorStateEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and a motor state serialized through `MotorState`).
---@param streamId integer
---@param connection Connection
function MotorStateEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setMotorState(state, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function MotorStateEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param vehicle table
---@param motorState integer
---@param noEventSend boolean
function MotorStateEvent.sendEvent(vehicle, motorState, noEventSend) end
