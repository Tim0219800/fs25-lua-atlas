---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetFillUnitCapacityEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `SetFillUnitCapacityEvent` (extends `Event`) that replicates a new capacity for a fill unit. It carries the vehicle, a fill unit index (8 bits) and a capacity (float32). It belongs to the vehicle specialization events and defines nothing else.
---@class SetFillUnitCapacityEvent : Event
SetFillUnitCapacityEvent = {}

--- Creates an empty `SetFillUnitCapacityEvent` instance without data, used when the event is read from a network stream.
---@return table
function SetFillUnitCapacityEvent.emptyNew() end

--- Creates the event with its data: the vehicle, a fill unit index (8 bits) and a capacity (float32).
---@param vehicle table
---@param fillUnitIndex boolean
---@param capacity boolean
function SetFillUnitCapacityEvent.new(vehicle, fillUnitIndex, capacity) end

--- Reads the event data from the network stream (the vehicle, a fill unit index (8 bits) and a capacity (float32)), then calls `run`.
---@param streamId integer
---@param connection Connection
function SetFillUnitCapacityEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle, a fill unit index (8 bits) and a capacity (float32)).
---@param streamId integer
---@param connection Connection
function SetFillUnitCapacityEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setFillUnitCapacity(fillUnitIndex, capacity, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function SetFillUnitCapacityEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param vehicle table
---@param fillUnitIndex boolean
---@param capacity boolean
---@param noEventSend boolean
function SetFillUnitCapacityEvent.sendEvent(vehicle, fillUnitIndex, capacity, noEventSend) end
