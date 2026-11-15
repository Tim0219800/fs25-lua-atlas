---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/MotorGearShiftEvent.lua (generated stub, FS25 Lua Atlas)

---@class MotorGearShiftEvent : Event
MotorGearShiftEvent = {}

---@return table
function MotorGearShiftEvent.emptyNew() end

---@param vehicle table
---@param shiftType boolean
---@param shiftValue any
function MotorGearShiftEvent.new(vehicle, shiftType, shiftValue) end

---@param streamId integer
---@param connection Connection
function MotorGearShiftEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function MotorGearShiftEvent:writeStream(streamId, connection) end

---@param connection Connection
function MotorGearShiftEvent:run(connection) end

---@param vehicle table
---@param shiftType integer
---@param shiftValue integer?
function MotorGearShiftEvent.sendToServer(vehicle, shiftType, shiftValue) end
