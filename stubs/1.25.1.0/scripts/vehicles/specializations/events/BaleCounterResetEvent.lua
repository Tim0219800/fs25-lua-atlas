---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/BaleCounterResetEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `BaleCounterResetEvent` (extends `Event`) that replicates a reset of the bale counter of a vehicle. It carries only the vehicle. It belongs to the vehicle specialization events and defines nothing else.
---@class BaleCounterResetEvent : Event
BaleCounterResetEvent = {}

--- Creates an empty `BaleCounterResetEvent` instance without data, used when the event is read from a network stream.
---@return table
function BaleCounterResetEvent.emptyNew() end

--- Creates the event with its data: only the vehicle.
---@param object table
---@return table
function BaleCounterResetEvent.new(object) end

--- Reads the event data from the network stream (only the vehicle), then calls `run`.
---@param streamId integer
---@param connection Connection
function BaleCounterResetEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (only the vehicle).
---@param streamId integer
---@param connection Connection
function BaleCounterResetEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `doBaleCounterReset(true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function BaleCounterResetEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param vehicle table
---@param noEventSend boolean
function BaleCounterResetEvent.sendEvent(vehicle, noEventSend) end
