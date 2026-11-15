---@meta
-- FS25 1.25.1.0 : vehicles/VehicleAttachEvent.lua (stub généré, atlas Lua FS25)

---@class VehicleAttachEvent : Event
VehicleAttachEvent = {}

---@return table
function VehicleAttachEvent.emptyNew() end

---@param vehicle table
---@param implement table
---@param inputJointIndex integer
---@param jointIndex integer
---@param startLowered boolean
---@return table
function VehicleAttachEvent.new(vehicle, implement, inputJointIndex, jointIndex, startLowered) end

---@param streamId integer
---@param connection Connection
function VehicleAttachEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function VehicleAttachEvent:writeStream(streamId, connection) end

---@param connection Connection
function VehicleAttachEvent:run(connection) end
