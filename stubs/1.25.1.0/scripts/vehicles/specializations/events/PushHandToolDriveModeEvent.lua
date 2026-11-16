---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/PushHandToolDriveModeEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `PushHandToolDriveModeEvent` (extends `Event`) that replicates the drive mode of a push hand tool. It carries the vehicle and a drive-mode boolean. It belongs to the vehicle specialization events and defines nothing else.
---@class PushHandToolDriveModeEvent : Event
PushHandToolDriveModeEvent = {}

--- Creates an empty `PushHandToolDriveModeEvent` instance without data, used when the event is read from a network stream.
---@return table
function PushHandToolDriveModeEvent.emptyNew() end

--- Creates the event with its data: the vehicle and a drive-mode boolean.
---@param object table
---@param driveModeState integer
---@return PushHandToolDriveModeEvent
function PushHandToolDriveModeEvent.new(object, driveModeState) end

--- Reads the event data from the network stream (the vehicle and a drive-mode boolean), then calls `run`.
---@param streamId integer
---@param connection Connection
function PushHandToolDriveModeEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and a drive-mode boolean).
---@param streamId integer
---@param connection Connection
function PushHandToolDriveModeEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setPushHandToolDriveMode(state, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function PushHandToolDriveModeEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param vehicle table
---@param driveModeState integer
---@param noEventSend boolean
function PushHandToolDriveModeEvent.sendEvent(vehicle, driveModeState, noEventSend) end
