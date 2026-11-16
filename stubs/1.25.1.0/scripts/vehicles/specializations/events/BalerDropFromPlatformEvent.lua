---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/BalerDropFromPlatformEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `BalerDropFromPlatformEvent` (extends `Event`) that replicates dropping a bale from the baler platform. It carries the vehicle and a wait-for-next-bale boolean. It belongs to the vehicle specialization events and defines nothing else.
---@class BalerDropFromPlatformEvent : Event
BalerDropFromPlatformEvent = {}

--- Creates an empty `BalerDropFromPlatformEvent` instance without data, used when the event is read from a network stream.
---@return table
function BalerDropFromPlatformEvent.emptyNew() end

--- Creates the event with its data: the vehicle and a wait-for-next-bale boolean.
---@param object table
---@param waitForNextBale boolean
function BalerDropFromPlatformEvent.new(object, waitForNextBale) end

--- Reads the event data from the network stream (the vehicle and a wait-for-next-bale boolean), then calls `run`.
---@param streamId integer
---@param connection Connection
function BalerDropFromPlatformEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and a wait-for-next-bale boolean).
---@param streamId integer
---@param connection Connection
function BalerDropFromPlatformEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `dropBaleFromPlatform(waitForNextBale, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function BalerDropFromPlatformEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param object table
---@param waitForNextBale boolean
---@param noEventSend boolean
function BalerDropFromPlatformEvent.sendEvent(object, waitForNextBale, noEventSend) end
