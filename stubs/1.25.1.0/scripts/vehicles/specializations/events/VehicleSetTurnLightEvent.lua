---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/VehicleSetTurnLightEvent.lua (stub généré, atlas Lua FS25)

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
