---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AIModeSelectionSettingsEvent.lua (stub généré, atlas Lua FS25)

---@class AIModeSelectionSettingsEvent : Event
AIModeSelectionSettingsEvent = {}

---@return table
function AIModeSelectionSettingsEvent.emptyNew() end

---@param vehicle table
---@param fieldCourseSettings integer
function AIModeSelectionSettingsEvent.new(vehicle, fieldCourseSettings) end

---@param streamId integer
---@param connection Connection
function AIModeSelectionSettingsEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function AIModeSelectionSettingsEvent:writeStream(streamId, connection) end

---@param connection Connection
function AIModeSelectionSettingsEvent:run(connection) end

---@param vehicle table
---@param fieldCourseSettings integer
---@param noEventSend boolean
function AIModeSelectionSettingsEvent.sendEvent(vehicle, fieldCourseSettings, noEventSend) end
