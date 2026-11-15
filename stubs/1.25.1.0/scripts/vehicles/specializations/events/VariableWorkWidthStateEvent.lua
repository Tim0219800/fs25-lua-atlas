---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/VariableWorkWidthStateEvent.lua (generated stub, FS25 Lua Atlas)

---@class VariableWorkWidthStateEvent : Event
VariableWorkWidthStateEvent = {}

---@return table
function VariableWorkWidthStateEvent.emptyNew() end

---@param vehicle table
---@param leftSide integer
---@param rightSide integer
function VariableWorkWidthStateEvent.new(vehicle, leftSide, rightSide) end

---@param streamId integer
---@param connection Connection
function VariableWorkWidthStateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function VariableWorkWidthStateEvent:writeStream(streamId, connection) end

---@param connection Connection
function VariableWorkWidthStateEvent:run(connection) end

---@param vehicle table
---@param leftSide integer
---@param rightSide integer
---@param noEventSend boolean
function VariableWorkWidthStateEvent.sendEvent(vehicle, leftSide, rightSide, noEventSend) end
