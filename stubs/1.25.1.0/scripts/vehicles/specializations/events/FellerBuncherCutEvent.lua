---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/FellerBuncherCutEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `FellerBuncherCutEvent` (extends `Event`) that replicates a tree cut by a feller buncher. It carries only the vehicle. It belongs to the vehicle specialization events and defines nothing else.
---@class FellerBuncherCutEvent : Event
FellerBuncherCutEvent = {}

--- Creates an empty `FellerBuncherCutEvent` instance without data, used when the event is read from a network stream.
---@return table
function FellerBuncherCutEvent.emptyNew() end

--- Creates the event with its data: only the vehicle.
---@param object table
---@return table
function FellerBuncherCutEvent.new(object) end

--- Reads the event data from the network stream (only the vehicle), then calls `run`.
---@param streamId integer
---@param connection Connection
function FellerBuncherCutEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (only the vehicle).
---@param streamId integer
---@param connection Connection
function FellerBuncherCutEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `cutTree(true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function FellerBuncherCutEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param vehicle table
---@param noEventSend boolean
function FellerBuncherCutEvent.sendEvent(vehicle, noEventSend) end
