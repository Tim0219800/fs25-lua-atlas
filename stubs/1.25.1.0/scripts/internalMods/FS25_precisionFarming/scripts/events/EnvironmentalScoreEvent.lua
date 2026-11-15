---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/EnvironmentalScoreEvent.lua (stub généré, atlas Lua FS25)

---@class EnvironmentalScoreEvent : Event
EnvironmentalScoreEvent = {}

---@return table
function EnvironmentalScoreEvent.emptyNew() end

---@param farmId table
function EnvironmentalScoreEvent.new(farmId) end

---@param streamId integer
---@param connection Connection
function EnvironmentalScoreEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function EnvironmentalScoreEvent:writeStream(streamId, connection) end
