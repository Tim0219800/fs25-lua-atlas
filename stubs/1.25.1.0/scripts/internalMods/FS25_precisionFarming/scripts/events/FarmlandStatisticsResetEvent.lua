---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/FarmlandStatisticsResetEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) that tells a client to reset the statistics of one farmland. Its payload is only the farmland id.
---@class FarmlandStatisticsResetEvent : Event
FarmlandStatisticsResetEvent = {}

--- Creates an empty FarmlandStatisticsResetEvent instance with the Event metatable; the network layer calls it before readStream fills the fields.
---@return table
function FarmlandStatisticsResetEvent.emptyNew() end

--- Creates the event for a farmland id.
---@param farmlandId table
function FarmlandStatisticsResetEvent.new(farmlandId) end

--- Client side: reads the farmland id and calls g_precisionFarming.farmlandStatistics:resetStatistic on it, if the object exists. It does not call run.
---@param streamId integer
---@param connection Connection
function FarmlandStatisticsResetEvent:readStream(streamId, connection) end

--- Writes only the farmland id.
---@param streamId integer
---@param connection Connection
function FarmlandStatisticsResetEvent:writeStream(streamId, connection) end
