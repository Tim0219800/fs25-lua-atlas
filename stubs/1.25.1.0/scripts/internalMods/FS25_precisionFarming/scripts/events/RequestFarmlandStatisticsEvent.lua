---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/RequestFarmlandStatisticsEvent.lua (generated stub, FS25 Lua Atlas)

---@class RequestFarmlandStatisticsEvent : Event
RequestFarmlandStatisticsEvent = {}

---@return table
function RequestFarmlandStatisticsEvent.emptyNew() end

---@param farmlandId table
function RequestFarmlandStatisticsEvent.new(farmlandId) end

---@param streamId integer
---@param connection Connection
function RequestFarmlandStatisticsEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function RequestFarmlandStatisticsEvent:writeStream(streamId, connection) end

---@param connection Connection
function RequestFarmlandStatisticsEvent:run(connection) end
