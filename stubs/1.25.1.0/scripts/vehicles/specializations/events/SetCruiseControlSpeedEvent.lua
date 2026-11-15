---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetCruiseControlSpeedEvent.lua (generated stub, FS25 Lua Atlas)

---@class SetCruiseControlSpeedEvent : Event
SetCruiseControlSpeedEvent = {}

---@return table
function SetCruiseControlSpeedEvent.emptyNew() end

---@param vehicle table
---@param speed number
---@param speedReverse number
function SetCruiseControlSpeedEvent.new(vehicle, speed, speedReverse) end

---@param streamId integer
---@param connection Connection
function SetCruiseControlSpeedEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function SetCruiseControlSpeedEvent:writeStream(streamId, connection) end

---@param connection Connection
function SetCruiseControlSpeedEvent:run(connection) end
