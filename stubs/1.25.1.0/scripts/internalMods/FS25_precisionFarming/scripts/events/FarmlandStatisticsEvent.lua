---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/FarmlandStatisticsEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) that sends the statistics of one farmland from server to a client, in reply to RequestFarmlandStatisticsEvent.
---@class FarmlandStatisticsEvent : Event
FarmlandStatisticsEvent = {}

--- Creates an empty FarmlandStatisticsEvent instance with the Event metatable; the network layer calls it before readStream fills the fields.
---@return table
function FarmlandStatisticsEvent.emptyNew() end

--- Creates the event for a farmland id.
---@param farmlandId table
function FarmlandStatisticsEvent.new(farmlandId) end

--- Client side: reads the farmland id, then g_precisionFarming.farmlandStatistics:readStatisticFromStream reads the statistics, if the object exists.
---@param streamId integer
---@param connection Connection
function FarmlandStatisticsEvent:readStream(streamId, connection) end

--- Server side: writes the farmland id, then g_precisionFarming.farmlandStatistics:writeStatisticToStream writes the statistics, if the object exists.
---@param streamId integer
---@param connection Connection
function FarmlandStatisticsEvent:writeStream(streamId, connection) end
