---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/VehicleSetTurnLightEvent.lua (generated stub, FS25 Lua Atlas)

---@class VehicleSetTurnLightEvent : Event
VehicleSetTurnLightEvent = {}

---@return table
function VehicleSetTurnLightEvent.emptyNew() end

---@param object table
---@param state integer
function VehicleSetTurnLightEvent.new(object, state) end

---@param streamId integer
---@param connection Connection
function VehicleSetTurnLightEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function VehicleSetTurnLightEvent:writeStream(streamId, connection) end

---@param connection Connection
function VehicleSetTurnLightEvent:run(connection) end
