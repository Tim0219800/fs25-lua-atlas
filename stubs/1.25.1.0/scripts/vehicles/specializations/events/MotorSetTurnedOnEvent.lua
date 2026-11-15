---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/MotorSetTurnedOnEvent.lua (stub généré, atlas Lua FS25)

---@class MotorSetTurnedOnEvent : Event
MotorSetTurnedOnEvent = {}

---@return table
function MotorSetTurnedOnEvent.emptyNew() end

---@param vehicle table
---@param turnedOn boolean
function MotorSetTurnedOnEvent.new(vehicle, turnedOn) end

---@param streamId integer
---@param connection Connection
function MotorSetTurnedOnEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function MotorSetTurnedOnEvent:writeStream(streamId, connection) end

---@param connection Connection
function MotorSetTurnedOnEvent:run(connection) end

---@param vehicle table
---@param turnedOn boolean
---@param noEventSend boolean
function MotorSetTurnedOnEvent.sendEvent(vehicle, turnedOn, noEventSend) end
