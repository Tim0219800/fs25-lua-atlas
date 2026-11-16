---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/MotorSetTurnedOnEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `MotorSetTurnedOnEvent` (extends `Event`) that replicates the motor being started or stopped. It carries the vehicle and a turned-on boolean. It belongs to the vehicle specialization events and defines nothing else.
---@class MotorSetTurnedOnEvent : Event
MotorSetTurnedOnEvent = {}

--- Creates an empty `MotorSetTurnedOnEvent` instance without data, used when the event is read from a network stream.
---@return table
function MotorSetTurnedOnEvent.emptyNew() end

--- Creates the event with its data: the vehicle and a turned-on boolean.
---@param vehicle table
---@param turnedOn boolean
function MotorSetTurnedOnEvent.new(vehicle, turnedOn) end

--- Reads the event data from the network stream (the vehicle and a turned-on boolean), then calls `run`.
---@param streamId integer
---@param connection Connection
function MotorSetTurnedOnEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and a turned-on boolean).
---@param streamId integer
---@param connection Connection
function MotorSetTurnedOnEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `startMotor(true)` or `stopMotor(true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function MotorSetTurnedOnEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param vehicle table
---@param turnedOn boolean
---@param noEventSend boolean
function MotorSetTurnedOnEvent.sendEvent(vehicle, turnedOn, noEventSend) end
