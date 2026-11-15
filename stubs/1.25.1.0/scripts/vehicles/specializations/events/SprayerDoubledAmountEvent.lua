---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SprayerDoubledAmountEvent.lua (stub généré, atlas Lua FS25)

---@class SprayerDoubledAmountEvent : Event
SprayerDoubledAmountEvent = {}

---@return table
function SprayerDoubledAmountEvent.emptyNew() end

---@param object table
---@param isActive integer
function SprayerDoubledAmountEvent.new(object, isActive) end

---@param streamId integer
---@param connection Connection
function SprayerDoubledAmountEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function SprayerDoubledAmountEvent:writeStream(streamId, connection) end

---@param connection Connection
function SprayerDoubledAmountEvent:run(connection) end

---@param vehicle table
---@param isActive boolean
---@param noEventSend boolean
function SprayerDoubledAmountEvent.sendEvent(vehicle, isActive, noEventSend) end
