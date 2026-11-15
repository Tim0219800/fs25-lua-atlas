---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/TramlineMapInitialEvent.lua (generated stub, FS25 Lua Atlas)

---@class TramlineMapInitialEvent : Event
TramlineMapInitialEvent = {}

---@return table
function TramlineMapInitialEvent.emptyNew() end

---@param farmlandTramlineStates table
function TramlineMapInitialEvent.new(farmlandTramlineStates) end

---@param streamId integer
---@param connection Connection
function TramlineMapInitialEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function TramlineMapInitialEvent:writeStream(streamId, connection) end

---@param connection Connection
function TramlineMapInitialEvent:run(connection) end
