---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/PushHandToolDriveModeEvent.lua (stub généré, atlas Lua FS25)

---@class PushHandToolDriveModeEvent : Event
PushHandToolDriveModeEvent = {}

---@return table
function PushHandToolDriveModeEvent.emptyNew() end

---@param object table
---@param driveModeState integer
---@return PushHandToolDriveModeEvent
function PushHandToolDriveModeEvent.new(object, driveModeState) end

---@param streamId integer
---@param connection Connection
function PushHandToolDriveModeEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PushHandToolDriveModeEvent:writeStream(streamId, connection) end

---@param connection Connection
function PushHandToolDriveModeEvent:run(connection) end

---@param vehicle table
---@param driveModeState integer
---@param noEventSend boolean
function PushHandToolDriveModeEvent.sendEvent(vehicle, driveModeState, noEventSend) end
