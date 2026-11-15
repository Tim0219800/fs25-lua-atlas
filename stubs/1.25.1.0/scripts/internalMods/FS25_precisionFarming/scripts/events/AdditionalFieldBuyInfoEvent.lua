---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/AdditionalFieldBuyInfoEvent.lua (generated stub, FS25 Lua Atlas)

---@class AdditionalFieldBuyInfoEvent : Event
AdditionalFieldBuyInfoEvent = {}

---@return table
function AdditionalFieldBuyInfoEvent.emptyNew() end

---@param farmlandId table
function AdditionalFieldBuyInfoEvent.new(farmlandId) end

---@param streamId integer
---@param connection Connection
function AdditionalFieldBuyInfoEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function AdditionalFieldBuyInfoEvent:writeStream(streamId, connection) end
