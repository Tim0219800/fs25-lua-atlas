---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/VehicleSetBeaconLightEvent.lua (stub généré, atlas Lua FS25)

---@class VehicleSetBeaconLightEvent : Event
VehicleSetBeaconLightEvent = {}

---@return table
function VehicleSetBeaconLightEvent.emptyNew() end

---@param object table
---@param active boolean
function VehicleSetBeaconLightEvent.new(object, active) end

---@param streamId integer
---@param connection Connection
function VehicleSetBeaconLightEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function VehicleSetBeaconLightEvent:writeStream(streamId, connection) end

---@param connection Connection
function VehicleSetBeaconLightEvent:run(connection) end
