---@meta
-- FS25 1.25.1.0 : vehicles/VehicleLeaveEvent.lua (stub généré, atlas Lua FS25)

---@class VehicleLeaveEvent : Event
VehicleLeaveEvent = {}

---@return table
function VehicleLeaveEvent.emptyNew() end

---@param vehicle table
---@param userId any
---@return table
function VehicleLeaveEvent.new(vehicle, userId) end

---@param streamId integer
---@param connection Connection
function VehicleLeaveEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function VehicleLeaveEvent:writeStream(streamId, connection) end

---@param connection Connection
function VehicleLeaveEvent:run(connection) end

---@param vehicle any
---@param userId any
---@param noEventSend any
function VehicleLeaveEvent.sendEvent(vehicle, userId, noEventSend) end
