---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/RequestEnvironmentalScoreEvent.lua (generated stub, FS25 Lua Atlas)

---@class RequestEnvironmentalScoreEvent : Event
RequestEnvironmentalScoreEvent = {}

---@return table
function RequestEnvironmentalScoreEvent.emptyNew() end

---@param farmId table
function RequestEnvironmentalScoreEvent.new(farmId) end

---@param streamId integer
---@param connection Connection
function RequestEnvironmentalScoreEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function RequestEnvironmentalScoreEvent:writeStream(streamId, connection) end

---@param connection Connection
function RequestEnvironmentalScoreEvent:run(connection) end
