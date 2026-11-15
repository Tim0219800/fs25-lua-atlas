---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetSeedIndexEvent.lua (generated stub, FS25 Lua Atlas)

---@class SetSeedIndexEvent : Event
SetSeedIndexEvent = {}

---@return table
function SetSeedIndexEvent.emptyNew() end

---@param object table
---@param seedIndex integer
function SetSeedIndexEvent.new(object, seedIndex) end

---@param streamId integer
---@param connection Connection
function SetSeedIndexEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function SetSeedIndexEvent:writeStream(streamId, connection) end

---@param connection Connection
function SetSeedIndexEvent:run(connection) end

---@param object table
---@param seedIndex integer
---@param noEventSend boolean
function SetSeedIndexEvent.sendEvent(object, seedIndex, noEventSend) end
