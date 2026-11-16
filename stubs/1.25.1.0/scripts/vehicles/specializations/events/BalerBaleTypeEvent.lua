---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/BalerBaleTypeEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `BalerBaleTypeEvent` (extends `Event`) that replicates the selected bale type of a baler. It carries the vehicle, a bale type index (`BalerBaleTypeEvent.BALE_TYPE_SEND_NUM_BITS` bits) and a force flag (false if nil). It belongs to the vehicle specialization events and defines nothing else.
---@class BalerBaleTypeEvent : Event
BalerBaleTypeEvent = {}

--- Creates an empty `BalerBaleTypeEvent` instance without data, used when the event is read from a network stream.
---@return table
function BalerBaleTypeEvent.emptyNew() end

--- Creates the event with its data: the vehicle, a bale type index (`BalerBaleTypeEvent.BALE_TYPE_SEND_NUM_BITS` bits) and a force flag (false if nil).
---@param object table
---@param baleTypeIndex integer
---@param force boolean
function BalerBaleTypeEvent.new(object, baleTypeIndex, force) end

--- Reads the event data from the network stream (the vehicle, a bale type index (`BalerBaleTypeEvent.BALE_TYPE_SEND_NUM_BITS` bits) and a force flag (false if nil)), then calls `run`.
---@param streamId integer
---@param connection Connection
function BalerBaleTypeEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle, a bale type index (`BalerBaleTypeEvent.BALE_TYPE_SEND_NUM_BITS` bits) and a force flag (false if nil)).
---@param streamId integer
---@param connection Connection
function BalerBaleTypeEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setBaleTypeIndex(index, force, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function BalerBaleTypeEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param object table
---@param baleTypeIndex integer
---@param force boolean
---@param noEventSend boolean
function BalerBaleTypeEvent.sendEvent(object, baleTypeIndex, force, noEventSend) end
