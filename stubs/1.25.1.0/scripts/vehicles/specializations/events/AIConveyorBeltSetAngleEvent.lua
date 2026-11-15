---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AIConveyorBeltSetAngleEvent.lua (stub généré, atlas Lua FS25)

---@class AIConveyorBeltSetAngleEvent : Event
AIConveyorBeltSetAngleEvent = {}

---@return table
function AIConveyorBeltSetAngleEvent.emptyNew() end

---@param vehicle table
---@param currentAngle integer
function AIConveyorBeltSetAngleEvent.new(vehicle, currentAngle) end

---@param streamId integer
---@param connection Connection
function AIConveyorBeltSetAngleEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function AIConveyorBeltSetAngleEvent:writeStream(streamId, connection) end

---@param connection Connection
function AIConveyorBeltSetAngleEvent:run(connection) end
