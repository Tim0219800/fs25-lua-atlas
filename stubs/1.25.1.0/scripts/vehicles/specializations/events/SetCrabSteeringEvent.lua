---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetCrabSteeringEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `SetCrabSteeringEvent` (extends `Event`) that replicates the crab steering mode. It carries the vehicle and a state (`CrabSteering.STEERING_SEND_NUM_BITS` bits). It belongs to the vehicle specialization events and defines nothing else.
---@class SetCrabSteeringEvent : Event
SetCrabSteeringEvent = {}

--- Creates an empty `SetCrabSteeringEvent` instance without data, used when the event is read from a network stream.
---@return table
function SetCrabSteeringEvent.emptyNew() end

--- Creates the event with its data: the vehicle and a state (`CrabSteering.STEERING_SEND_NUM_BITS` bits).
---@param vehicle table
---@param state integer
function SetCrabSteeringEvent.new(vehicle, state) end

--- Reads the event data from the network stream (the vehicle and a state (`CrabSteering.STEERING_SEND_NUM_BITS` bits)), then calls `run`.
---@param streamId integer
---@param connection Connection
function SetCrabSteeringEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and a state (`CrabSteering.STEERING_SEND_NUM_BITS` bits)).
---@param streamId integer
---@param connection Connection
function SetCrabSteeringEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setCrabSteering(state, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function SetCrabSteeringEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param vehicle table
---@param state integer
---@param noEventSend boolean
function SetCrabSteeringEvent.sendEvent(vehicle, state, noEventSend) end
