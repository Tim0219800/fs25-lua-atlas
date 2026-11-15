---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/BaleWrapperAutomaticDropEvent.lua (generated stub, FS25 Lua Atlas)

---@class BaleWrapperAutomaticDropEvent : Event
BaleWrapperAutomaticDropEvent = {}

---@return table
function BaleWrapperAutomaticDropEvent.emptyNew() end

---@param object table
---@param automaticDrop boolean
function BaleWrapperAutomaticDropEvent.new(object, automaticDrop) end

---@param streamId integer
---@param connection Connection
function BaleWrapperAutomaticDropEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function BaleWrapperAutomaticDropEvent:writeStream(streamId, connection) end

---@param connection Connection
function BaleWrapperAutomaticDropEvent:run(connection) end

---@param object table
---@param automaticDrop boolean
---@param noEventSend boolean
function BaleWrapperAutomaticDropEvent.sendEvent(object, automaticDrop, noEventSend) end
