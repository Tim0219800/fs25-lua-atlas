---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/BalerSetIsUnloadingBaleEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `BalerSetIsUnloadingBaleEvent` (extends `Event`) that replicates the unloading-bale state of a baler. It carries the vehicle and a boolean. It belongs to the vehicle specialization events and defines nothing else.
---@class BalerSetIsUnloadingBaleEvent : Event
BalerSetIsUnloadingBaleEvent = {}

--- Creates an empty `BalerSetIsUnloadingBaleEvent` instance without data, used when the event is read from a network stream.
---@return table
function BalerSetIsUnloadingBaleEvent.emptyNew() end

--- Creates the event with its data: the vehicle and a boolean.
---@param object table
---@param isUnloadingBale boolean
function BalerSetIsUnloadingBaleEvent.new(object, isUnloadingBale) end

--- Reads the event data from the network stream (the vehicle and a boolean), then calls `run`.
---@param streamId integer
---@param connection Connection
function BalerSetIsUnloadingBaleEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and a boolean).
---@param streamId integer
---@param connection Connection
function BalerSetIsUnloadingBaleEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setIsUnloadingBale(value, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function BalerSetIsUnloadingBaleEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param object table
---@param isUnloadingBale boolean
---@param noEventSend boolean
function BalerSetIsUnloadingBaleEvent.sendEvent(object, isUnloadingBale, noEventSend) end
