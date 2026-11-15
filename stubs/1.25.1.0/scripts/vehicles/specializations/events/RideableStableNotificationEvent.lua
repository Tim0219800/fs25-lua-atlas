---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/RideableStableNotificationEvent.lua (stub généré, atlas Lua FS25)

---@class RideableStableNotificationEvent : Event
RideableStableNotificationEvent = {}

---@return table
function RideableStableNotificationEvent.emptyNew() end

---@param isInStable table
---@param name integer
function RideableStableNotificationEvent.new(isInStable, name) end

---@param streamId integer
---@param connection Connection
function RideableStableNotificationEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function RideableStableNotificationEvent:writeStream(streamId, connection) end

---@param connection Connection
function RideableStableNotificationEvent:run(connection) end
