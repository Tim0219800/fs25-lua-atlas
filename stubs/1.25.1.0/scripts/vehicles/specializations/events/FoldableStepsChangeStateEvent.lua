---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/FoldableStepsChangeStateEvent.lua (generated stub, FS25 Lua Atlas)

---@class FoldableStepsChangeStateEvent : Event
FoldableStepsChangeStateEvent = {}

---@return table
function FoldableStepsChangeStateEvent.emptyNew() end

---@param object table
---@param targetState table
---@return table
function FoldableStepsChangeStateEvent.new(object, targetState) end

---@param streamId integer
---@param connection Connection
function FoldableStepsChangeStateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function FoldableStepsChangeStateEvent:writeStream(streamId, connection) end

---@param connection Connection
function FoldableStepsChangeStateEvent:run(connection) end

---@param vehicle table
---@param targetState integer
---@param noEventSend boolean
function FoldableStepsChangeStateEvent.sendEvent(vehicle, targetState, noEventSend) end
