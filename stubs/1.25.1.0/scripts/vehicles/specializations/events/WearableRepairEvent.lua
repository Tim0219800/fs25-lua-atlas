---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/WearableRepairEvent.lua (stub généré, atlas Lua FS25)

---@class WearableRepairEvent : Event
WearableRepairEvent = {}

---@return table
function WearableRepairEvent.emptyNew() end

---@param vehicle table
---@param atSellingPoint any
function WearableRepairEvent.new(vehicle, atSellingPoint) end

---@param streamId integer
---@param connection Connection
function WearableRepairEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function WearableRepairEvent:writeStream(streamId, connection) end

---@param connection Connection
function WearableRepairEvent:run(connection) end
