---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/ReverseDrivingSetStateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `ReverseDrivingSetStateEvent` (extends `Event`) that replicates the reverse-driving state of a vehicle. It carries the vehicle and a boolean. It belongs to the vehicle specialization events and defines nothing else.
---@class ReverseDrivingSetStateEvent : Event
ReverseDrivingSetStateEvent = {}

--- Creates an empty `ReverseDrivingSetStateEvent` instance without data, used when the event is read from a network stream.
---@return table
function ReverseDrivingSetStateEvent.emptyNew() end

--- Creates the event with its data: the vehicle and a boolean.
---@param vehicle table
---@param isReverseDriving boolean
function ReverseDrivingSetStateEvent.new(vehicle, isReverseDriving) end

--- Reads the event data from the network stream (the vehicle and a boolean), then calls `run`.
---@param streamId integer
---@param connection Connection
function ReverseDrivingSetStateEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and a boolean).
---@param streamId integer
---@param connection Connection
function ReverseDrivingSetStateEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setIsReverseDriving(value, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function ReverseDrivingSetStateEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param vehicle table
---@param isReverseDriving boolean
---@param noEventSend boolean
function ReverseDrivingSetStateEvent.sendEvent(vehicle, isReverseDriving, noEventSend) end
