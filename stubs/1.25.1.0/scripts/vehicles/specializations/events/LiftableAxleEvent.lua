---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/LiftableAxleEvent.lua (generated stub, FS25 Lua Atlas)

---@class LiftableAxleEvent : Event
LiftableAxleEvent = {}

---@return table
function LiftableAxleEvent.emptyNew() end

---@param object table
---@param state any
---@param fixedHeight any
function LiftableAxleEvent.new(object, state, fixedHeight) end

---@param streamId integer
---@param connection Connection
function LiftableAxleEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function LiftableAxleEvent:writeStream(streamId, connection) end

---@param connection Connection
function LiftableAxleEvent:run(connection) end

---@param object table
---@param state boolean
---@param fixedHeight boolean
---@param noEventSend boolean
function LiftableAxleEvent.sendEvent(object, state, fixedHeight, noEventSend) end
