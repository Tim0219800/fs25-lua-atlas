---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/BalerAutomaticDropEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `BalerAutomaticDropEvent` (extends `Event`) that replicates the automatic bale drop setting of a baler. It carries the vehicle and a boolean. It belongs to the vehicle specialization events and defines nothing else.
---@class BalerAutomaticDropEvent : Event
BalerAutomaticDropEvent = {}

--- Creates an empty `BalerAutomaticDropEvent` instance without data, used when the event is read from a network stream.
---@return table
function BalerAutomaticDropEvent.emptyNew() end

--- Creates the event with its data: the vehicle and a boolean.
---@param object table
---@param automaticDrop boolean
function BalerAutomaticDropEvent.new(object, automaticDrop) end

--- Reads the event data from the network stream (the vehicle and a boolean), then calls `run`.
---@param streamId integer
---@param connection Connection
function BalerAutomaticDropEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and a boolean).
---@param streamId integer
---@param connection Connection
function BalerAutomaticDropEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setBalerAutomaticDrop(value, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function BalerAutomaticDropEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param object table
---@param automaticDrop boolean
---@param noEventSend boolean
function BalerAutomaticDropEvent.sendEvent(object, automaticDrop, noEventSend) end
