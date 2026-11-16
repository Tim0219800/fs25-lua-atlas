---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/CombineStrawEnableEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `CombineStrawEnableEvent` (extends `Event`) that replicates the swath (straw) output toggle of a combine. It carries the vehicle and a swath-active boolean. It belongs to the vehicle specialization events and defines nothing else.
---@class CombineStrawEnableEvent : Event
CombineStrawEnableEvent = {}

--- Creates an empty `CombineStrawEnableEvent` instance without data, used when the event is read from a network stream.
---@return table
function CombineStrawEnableEvent.emptyNew() end

--- Creates the event with its data: the vehicle and a swath-active boolean.
---@param vehicle table
---@param isSwathActive boolean
function CombineStrawEnableEvent.new(vehicle, isSwathActive) end

--- Reads the event data from the network stream (the vehicle and a swath-active boolean), then calls `run`.
---@param streamId integer
---@param connection Connection
function CombineStrawEnableEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and a swath-active boolean).
---@param streamId integer
---@param connection Connection
function CombineStrawEnableEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setIsSwathActive(value, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function CombineStrawEnableEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param vehicle table
---@param isSwathActive boolean
---@param noEventSend boolean
function CombineStrawEnableEvent.sendEvent(vehicle, isSwathActive, noEventSend) end
