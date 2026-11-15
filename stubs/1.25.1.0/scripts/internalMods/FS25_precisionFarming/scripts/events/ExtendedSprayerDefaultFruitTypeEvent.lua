---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/ExtendedSprayerDefaultFruitTypeEvent.lua (stub généré, atlas Lua FS25)

---@class ExtendedSprayerDefaultFruitTypeEvent : Event
ExtendedSprayerDefaultFruitTypeEvent = {}

---@return table
function ExtendedSprayerDefaultFruitTypeEvent.emptyNew() end

---@param object table
---@param fruitRequirementIndex integer
function ExtendedSprayerDefaultFruitTypeEvent.new(object, fruitRequirementIndex) end

---@param streamId integer
---@param connection Connection
function ExtendedSprayerDefaultFruitTypeEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function ExtendedSprayerDefaultFruitTypeEvent:writeStream(streamId, connection) end

---@param connection Connection
function ExtendedSprayerDefaultFruitTypeEvent:run(connection) end

---@param object table
---@param fruitRequirementIndex boolean
---@param noEventSend boolean
function ExtendedSprayerDefaultFruitTypeEvent.sendEvent(object, fruitRequirementIndex, noEventSend) end
