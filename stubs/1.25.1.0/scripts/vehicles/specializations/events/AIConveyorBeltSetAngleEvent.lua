---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AIConveyorBeltSetAngleEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronises the AI conveyor belt angle of a vehicle (signed 8-bit). A client sends it to the server, which applies it and relays it to the other clients.
---@class AIConveyorBeltSetAngleEvent : Event
AIConveyorBeltSetAngleEvent = {}

--- Creates an empty event instance with the class metatable; used by the network layer before `readStream` fills it.
---@return table
function AIConveyorBeltSetAngleEvent.emptyNew() end

--- Creates the event for a vehicle with the conveyor belt angle value to set.
---@param vehicle table
---@param currentAngle integer
function AIConveyorBeltSetAngleEvent.new(vehicle, currentAngle) end

--- Reads the vehicle and the angle as a signed 8-bit integer, then calls `run`.
---@param streamId integer
---@param connection Connection
function AIConveyorBeltSetAngleEvent:readStream(streamId, connection) end

--- Writes the vehicle and the angle as a signed 8-bit integer (so the value must fit -128..127).
---@param streamId integer
---@param connection Connection
function AIConveyorBeltSetAngleEvent:writeStream(streamId, connection) end

--- Calls `setAIConveyorBeltAngle(angle, true)` on a synchronized vehicle; on the server it rebroadcasts to the other clients, excluding the sender connection. No `sendEvent` helper exists.
---@param connection Connection
function AIConveyorBeltSetAngleEvent:run(connection) end
