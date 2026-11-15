---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/BalerDropFromPlatformEvent.lua (generated stub, FS25 Lua Atlas)

---@class BalerDropFromPlatformEvent : Event
BalerDropFromPlatformEvent = {}

---@return table
function BalerDropFromPlatformEvent.emptyNew() end

---@param object table
---@param waitForNextBale boolean
function BalerDropFromPlatformEvent.new(object, waitForNextBale) end

---@param streamId integer
---@param connection Connection
function BalerDropFromPlatformEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function BalerDropFromPlatformEvent:writeStream(streamId, connection) end

---@param connection Connection
function BalerDropFromPlatformEvent:run(connection) end

---@param object table
---@param waitForNextBale boolean
---@param noEventSend boolean
function BalerDropFromPlatformEvent.sendEvent(object, waitForNextBale, noEventSend) end
