---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/RequestFieldBuyInfoEvent.lua (stub généré, atlas Lua FS25)

---@class RequestFieldBuyInfoEvent : Event
RequestFieldBuyInfoEvent = {}

---@return table
function RequestFieldBuyInfoEvent.emptyNew() end

---@param farmlandId table
function RequestFieldBuyInfoEvent.new(farmlandId) end

---@param streamId integer
---@param connection Connection
function RequestFieldBuyInfoEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function RequestFieldBuyInfoEvent:writeStream(streamId, connection) end

---@param connection Connection
function RequestFieldBuyInfoEvent:run(connection) end
