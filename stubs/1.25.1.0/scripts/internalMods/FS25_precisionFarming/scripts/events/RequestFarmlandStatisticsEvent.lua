---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/RequestFarmlandStatisticsEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) sent by a client to ask the server for the statistics of one farmland. The server answers with a FarmlandStatisticsEvent to that connection only.
---@class RequestFarmlandStatisticsEvent : Event
RequestFarmlandStatisticsEvent = {}

--- Creates an empty RequestFarmlandStatisticsEvent instance with the Event metatable; the network layer calls it before readStream fills the fields.
---@return table
function RequestFarmlandStatisticsEvent.emptyNew() end

--- Creates the request for a farmland id.
---@param farmlandId table
function RequestFarmlandStatisticsEvent.new(farmlandId) end

--- Server side: reads the farmland id, then calls run.
---@param streamId integer
---@param connection Connection
function RequestFarmlandStatisticsEvent:readStream(streamId, connection) end

--- Client side: writes the farmland id.
---@param streamId integer
---@param connection Connection
function RequestFarmlandStatisticsEvent:writeStream(streamId, connection) end

--- Executes only on the server: replies with a FarmlandStatisticsEvent for that farmland to the requesting connection alone.
---@param connection Connection
function RequestFarmlandStatisticsEvent:run(connection) end
