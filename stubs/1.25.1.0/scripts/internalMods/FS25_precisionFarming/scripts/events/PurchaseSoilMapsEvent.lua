---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/PurchaseSoilMapsEvent.lua (generated stub, FS25 Lua Atlas)

---@class PurchaseSoilMapsEvent : Event
PurchaseSoilMapsEvent = {}

---@return table
function PurchaseSoilMapsEvent.emptyNew() end

---@param farmlandId table
function PurchaseSoilMapsEvent.new(farmlandId) end

---@param streamId integer
---@param connection Connection
function PurchaseSoilMapsEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PurchaseSoilMapsEvent:writeStream(streamId, connection) end

---@param connection Connection
function PurchaseSoilMapsEvent:run(connection) end
