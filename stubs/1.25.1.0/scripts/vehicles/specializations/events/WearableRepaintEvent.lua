---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/WearableRepaintEvent.lua (stub généré, atlas Lua FS25)

---@class WearableRepaintEvent : Event
WearableRepaintEvent = {}

---@return table
function WearableRepaintEvent.emptyNew() end

---@param vehicle table
function WearableRepaintEvent.new(vehicle) end

---@param streamId integer
---@param connection Connection
function WearableRepaintEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function WearableRepaintEvent:writeStream(streamId, connection) end

---@param connection Connection
function WearableRepaintEvent:run(connection) end
