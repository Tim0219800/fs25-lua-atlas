---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/ExtendedSprayerAmountEvent.lua (generated stub, FS25 Lua Atlas)

---@class ExtendedSprayerAmountEvent : Event
ExtendedSprayerAmountEvent = {}

---@return table
function ExtendedSprayerAmountEvent.emptyNew() end

---@param object table
---@param automaticMode boolean
---@param manualValue integer
function ExtendedSprayerAmountEvent.new(object, automaticMode, manualValue) end

---@param streamId integer
---@param connection Connection
function ExtendedSprayerAmountEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function ExtendedSprayerAmountEvent:writeStream(streamId, connection) end

---@param connection Connection
function ExtendedSprayerAmountEvent:run(connection) end

---@param object table
---@param automaticMode boolean
---@param manualValue any
---@param noEventSend boolean
function ExtendedSprayerAmountEvent.sendEvent(object, automaticMode, manualValue, noEventSend) end
