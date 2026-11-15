---@meta
-- FS25 1.25.1.0 : vehicles/VehicleBrokenEvent.lua (stub généré, atlas Lua FS25)

---@class VehicleBrokenEvent : Event
VehicleBrokenEvent = {}

---@return table
function VehicleBrokenEvent.emptyNew() end

---@param object table
---@return table
function VehicleBrokenEvent.new(object) end

---@param streamId integer
---@param connection Connection
function VehicleBrokenEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function VehicleBrokenEvent:writeStream(streamId, connection) end

---@param connection Connection
function VehicleBrokenEvent:run(connection) end
