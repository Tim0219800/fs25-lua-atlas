---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/BalerAutomaticDropEvent.lua (generated stub, FS25 Lua Atlas)

---@class BalerAutomaticDropEvent : Event
BalerAutomaticDropEvent = {}

---@return table
function BalerAutomaticDropEvent.emptyNew() end

---@param object table
---@param automaticDrop boolean
function BalerAutomaticDropEvent.new(object, automaticDrop) end

---@param streamId integer
---@param connection Connection
function BalerAutomaticDropEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function BalerAutomaticDropEvent:writeStream(streamId, connection) end

---@param connection Connection
function BalerAutomaticDropEvent:run(connection) end

---@param object table
---@param automaticDrop boolean
---@param noEventSend boolean
function BalerAutomaticDropEvent.sendEvent(object, automaticDrop, noEventSend) end
