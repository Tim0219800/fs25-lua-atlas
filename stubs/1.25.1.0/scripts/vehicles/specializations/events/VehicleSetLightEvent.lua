---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/VehicleSetLightEvent.lua (generated stub, FS25 Lua Atlas)

---@class VehicleSetLightEvent : Event
VehicleSetLightEvent = {}

---@return table
function VehicleSetLightEvent.emptyNew() end

---@param object table
---@param lightsTypesMask integer
---@param numBits any
function VehicleSetLightEvent.new(object, lightsTypesMask, numBits) end

---@param streamId integer
---@param connection Connection
function VehicleSetLightEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function VehicleSetLightEvent:writeStream(streamId, connection) end

---@param connection Connection
function VehicleSetLightEvent:run(connection) end
