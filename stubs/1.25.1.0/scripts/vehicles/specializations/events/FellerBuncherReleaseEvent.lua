---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/FellerBuncherReleaseEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `FellerBuncherReleaseEvent` (extends `Event`) that replicates the release of the trees held by a feller buncher. It carries only the vehicle. It belongs to the vehicle specialization events and defines nothing else.
---@class FellerBuncherReleaseEvent : Event
FellerBuncherReleaseEvent = {}

--- Creates an empty `FellerBuncherReleaseEvent` instance without data, used when the event is read from a network stream.
---@return table
function FellerBuncherReleaseEvent.emptyNew() end

--- Creates the event with its data: only the vehicle.
---@param object table
---@return table
function FellerBuncherReleaseEvent.new(object) end

--- Reads the event data from the network stream (only the vehicle), then calls `run`.
---@param streamId integer
---@param connection Connection
function FellerBuncherReleaseEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (only the vehicle).
---@param streamId integer
---@param connection Connection
function FellerBuncherReleaseEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `releaseMountedTrees(true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function FellerBuncherReleaseEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param vehicle table
---@param noEventSend boolean
function FellerBuncherReleaseEvent.sendEvent(vehicle, noEventSend) end
