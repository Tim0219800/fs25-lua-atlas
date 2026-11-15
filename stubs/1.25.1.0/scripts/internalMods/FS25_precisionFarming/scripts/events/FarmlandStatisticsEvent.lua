---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/FarmlandStatisticsEvent.lua (generated stub, FS25 Lua Atlas)

---@class FarmlandStatisticsEvent : Event
FarmlandStatisticsEvent = {}

---@return table
function FarmlandStatisticsEvent.emptyNew() end

---@param farmlandId table
function FarmlandStatisticsEvent.new(farmlandId) end

---@param streamId integer
---@param connection Connection
function FarmlandStatisticsEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function FarmlandStatisticsEvent:writeStream(streamId, connection) end
