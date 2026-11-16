---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetDischargeStateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `SetDischargeStateEvent` (extends `Event`) that replicates the discharge state of a vehicle. It carries the vehicle and a state (2 bits). It belongs to the vehicle specialization events and defines nothing else.
---@class SetDischargeStateEvent : Event
SetDischargeStateEvent = {}

--- Creates an empty `SetDischargeStateEvent` instance without data, used when the event is read from a network stream.
---@return table
function SetDischargeStateEvent.emptyNew() end

--- Creates the event with its data: the vehicle and a state (2 bits).
---@param vehicle table
---@param state integer
function SetDischargeStateEvent.new(vehicle, state) end

--- Reads the event data from the network stream (the vehicle and a state (2 bits)), then calls `run`.
---@param streamId integer
---@param connection Connection
function SetDischargeStateEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and a state (2 bits)).
---@param streamId integer
---@param connection Connection
function SetDischargeStateEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setDischargeState(state, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function SetDischargeStateEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param vehicle table
---@param state integer
---@param noEventSend boolean
function SetDischargeStateEvent.sendEvent(vehicle, state, noEventSend) end
