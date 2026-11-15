---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/PalletFillerBuyPalletEvent.lua (generated stub, FS25 Lua Atlas)

---@class PalletFillerBuyPalletEvent : Event
PalletFillerBuyPalletEvent = {}

---@return table
function PalletFillerBuyPalletEvent.emptyNew() end

---@param object table
---@return table
function PalletFillerBuyPalletEvent.new(object) end

---@param streamId integer
---@param connection Connection
function PalletFillerBuyPalletEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PalletFillerBuyPalletEvent:writeStream(streamId, connection) end

---@param connection Connection
function PalletFillerBuyPalletEvent:run(connection) end
