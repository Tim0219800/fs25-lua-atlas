---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/FarmlandStatisticsResetEvent.lua (generated stub, FS25 Lua Atlas)

---@class FarmlandStatisticsResetEvent : Event
FarmlandStatisticsResetEvent = {}

---@return table
function FarmlandStatisticsResetEvent.emptyNew() end

---@param farmlandId table
function FarmlandStatisticsResetEvent.new(farmlandId) end

---@param streamId integer
---@param connection Connection
function FarmlandStatisticsResetEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function FarmlandStatisticsResetEvent:writeStream(streamId, connection) end
