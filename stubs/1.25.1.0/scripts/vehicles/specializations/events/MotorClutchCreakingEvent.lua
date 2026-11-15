---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/MotorClutchCreakingEvent.lua (stub généré, atlas Lua FS25)

---@class MotorClutchCreakingEvent : Event
MotorClutchCreakingEvent = {}

---@return table
function MotorClutchCreakingEvent.emptyNew() end

---@param vehicle table
---@param isEvent boolean
---@param groupTransmission any
---@param gearIndex any
---@param groupIndex any
function MotorClutchCreakingEvent.new(vehicle, isEvent, groupTransmission, gearIndex, groupIndex) end

---@param streamId integer
---@param connection Connection
function MotorClutchCreakingEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function MotorClutchCreakingEvent:writeStream(streamId, connection) end

---@param connection Connection
function MotorClutchCreakingEvent:run(connection) end
