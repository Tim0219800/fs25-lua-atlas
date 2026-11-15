---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/LogGrabClawStateEvent.lua (stub généré, atlas Lua FS25)

---@class LogGrabClawStateEvent : Event
LogGrabClawStateEvent = {}

---@return table
function LogGrabClawStateEvent.emptyNew() end

---@param object table
---@param state table
---@param grabIndex any
---@return table
function LogGrabClawStateEvent.new(object, state, grabIndex) end

---@param streamId integer
---@param connection Connection
function LogGrabClawStateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function LogGrabClawStateEvent:writeStream(streamId, connection) end

---@param connection Connection
function LogGrabClawStateEvent:run(connection) end

---@param vehicle table
---@param state integer
---@param grabIndex boolean
---@param noEventSend boolean
function LogGrabClawStateEvent.sendEvent(vehicle, state, grabIndex, noEventSend) end
