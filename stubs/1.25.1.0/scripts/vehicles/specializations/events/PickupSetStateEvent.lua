---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/PickupSetStateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `PickupSetStateEvent` (extends `Event`) that replicates the lowered or raised state of a pickup. It carries the vehicle and an isPickupLowered boolean. It belongs to the vehicle specialization events and defines nothing else.
---@class PickupSetStateEvent : Event
PickupSetStateEvent = {}

--- Creates an empty `PickupSetStateEvent` instance without data, used when the event is read from a network stream.
---@return table
function PickupSetStateEvent.emptyNew() end

--- Creates the event with its data: the vehicle and an isPickupLowered boolean.
---@param object table
---@param isPickupLowered boolean
function PickupSetStateEvent.new(object, isPickupLowered) end

--- Reads the event data from the network stream (the vehicle and an isPickupLowered boolean), then calls `run`.
---@param streamId integer
---@param connection Connection
function PickupSetStateEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and an isPickupLowered boolean).
---@param streamId integer
---@param connection Connection
function PickupSetStateEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setPickupState(isPickupLowered, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function PickupSetStateEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param vehicle table
---@param isPickupLowered boolean
---@param noEventSend boolean
function PickupSetStateEvent.sendEvent(vehicle, isPickupLowered, noEventSend) end
