---@meta
-- FS25 1.25.1.0 : vehicles/VehicleDetachEvent.lua (stub généré, atlas Lua FS25)

---@class VehicleDetachEvent : Event
VehicleDetachEvent = {}

---@return table
function VehicleDetachEvent.emptyNew() end

---@param vehicle table
---@param implement table
---@return table
function VehicleDetachEvent.new(vehicle, implement) end

---@param streamId integer
---@param connection Connection
function VehicleDetachEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function VehicleDetachEvent:writeStream(streamId, connection) end

---@param connection any
function VehicleDetachEvent:run(connection) end
