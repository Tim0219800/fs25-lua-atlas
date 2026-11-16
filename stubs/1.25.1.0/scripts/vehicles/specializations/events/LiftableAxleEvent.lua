---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/LiftableAxleEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `LiftableAxleEvent` (extends `Event`) that replicates the lifted state of a liftable axle. It carries the vehicle, a boolean state and an optional fixed height (float32). It belongs to the vehicle specialization events and defines nothing else.
---@class LiftableAxleEvent : Event
LiftableAxleEvent = {}

--- Creates an empty `LiftableAxleEvent` instance without data, used when the event is read from a network stream.
---@return table
function LiftableAxleEvent.emptyNew() end

--- Creates the event with its data: the vehicle, a boolean state and an optional fixed height (float32).
---@param object table
---@param state any
---@param fixedHeight any
function LiftableAxleEvent.new(object, state, fixedHeight) end

--- Reads the event data from the network stream (the vehicle, a boolean state and an optional fixed height (float32)), then calls `run`.
---@param streamId integer
---@param connection Connection
function LiftableAxleEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle, a boolean state and an optional fixed height (float32)).
---@param streamId integer
---@param connection Connection
function LiftableAxleEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setLiftableAxleState(state, fixedHeight, nil, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function LiftableAxleEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param object table
---@param state boolean
---@param fixedHeight boolean
---@param noEventSend boolean
function LiftableAxleEvent.sendEvent(object, state, fixedHeight, noEventSend) end
