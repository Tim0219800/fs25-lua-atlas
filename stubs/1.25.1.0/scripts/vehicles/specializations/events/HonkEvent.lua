---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/HonkEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `HonkEvent` (extends `Event`) that replicates the horn starting or stopping. It carries the vehicle and an isPlaying boolean. It belongs to the vehicle specialization events and defines nothing else.
---@class HonkEvent : Event
HonkEvent = {}

--- Creates an empty `HonkEvent` instance without data, used when the event is read from a network stream.
---@return table
function HonkEvent.emptyNew() end

--- Creates the event with its data: the vehicle and an isPlaying boolean.
---@param object table
---@param isPlaying boolean
function HonkEvent.new(object, isPlaying) end

--- Reads the event data from the network stream (the vehicle and an isPlaying boolean), then calls `run`.
---@param streamId integer
---@param connection Connection
function HonkEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and an isPlaying boolean).
---@param streamId integer
---@param connection Connection
function HonkEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `playHonk(isPlaying, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function HonkEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param vehicle table
---@param isPlaying boolean
---@param noEventSend boolean
function HonkEvent.sendEvent(vehicle, isPlaying, noEventSend) end
