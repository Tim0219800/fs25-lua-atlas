---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/MotorStateEvent.lua (stub généré, atlas Lua FS25)

---@class MotorStateEvent : Event
MotorStateEvent = {}

---@return table
function MotorStateEvent.emptyNew() end

---@param vehicle table
---@param motorState integer
function MotorStateEvent.new(vehicle, motorState) end

---@param streamId integer
---@param connection Connection
function MotorStateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function MotorStateEvent:writeStream(streamId, connection) end

---@param connection Connection
function MotorStateEvent:run(connection) end

---@param vehicle table
---@param motorState integer
---@param noEventSend boolean
function MotorStateEvent.sendEvent(vehicle, motorState, noEventSend) end
