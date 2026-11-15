---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetTurnedOnEvent.lua (generated stub, FS25 Lua Atlas)

---@class SetTurnedOnEvent : Event
SetTurnedOnEvent = {}

---@return table
function SetTurnedOnEvent.emptyNew() end

---@param object table
---@param isTurnedOn boolean
function SetTurnedOnEvent.new(object, isTurnedOn) end

---@param streamId integer
---@param connection Connection
function SetTurnedOnEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function SetTurnedOnEvent:writeStream(streamId, connection) end

---@param connection Connection
function SetTurnedOnEvent:run(connection) end

---@param vehicle table
---@param isTurnedOn boolean
---@param noEventSend boolean
function SetTurnedOnEvent.sendEvent(vehicle, isTurnedOn, noEventSend) end
