---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetTurnedOnEvent.lua (stub généré, atlas Lua FS25)

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
