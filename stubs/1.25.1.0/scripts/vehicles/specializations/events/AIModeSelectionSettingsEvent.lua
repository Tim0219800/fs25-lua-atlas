---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AIModeSelectionSettingsEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronises the AI mode field course settings (`FieldCourseSettings`) of a vehicle. Clients send it to the server, which applies it and relays it to the others. Use `sendEvent` to emit it.
---@class AIModeSelectionSettingsEvent : Event
AIModeSelectionSettingsEvent = {}

--- Creates an empty event instance with the class metatable; used by the network layer before `readStream` fills it.
---@return table
function AIModeSelectionSettingsEvent.emptyNew() end

--- Creates the event for a vehicle with the `FieldCourseSettings` object to sync.
---@param vehicle table
---@param fieldCourseSettings integer
function AIModeSelectionSettingsEvent.new(vehicle, fieldCourseSettings) end

--- Reads the vehicle and the settings attributes, rebuilds a `FieldCourseSettings` for it and calls `run`.
---@param streamId integer
---@param connection Connection
function AIModeSelectionSettingsEvent:readStream(streamId, connection) end

--- Writes the vehicle and the field course settings.
---@param streamId integer
---@param connection Connection
function AIModeSelectionSettingsEvent:writeStream(streamId, connection) end

--- Calls `setAIModeFieldCourseSettings` on a synchronized vehicle; on the server it rebroadcasts to the other clients, excluding the sender.
---@param connection Connection
function AIModeSelectionSettingsEvent:run(connection) end

--- Sends the event unless `noEventSend` is true: the server broadcasts it, a client sends it to the server.
---@param vehicle table
---@param fieldCourseSettings integer
---@param noEventSend boolean
function AIModeSelectionSettingsEvent.sendEvent(vehicle, fieldCourseSettings, noEventSend) end
