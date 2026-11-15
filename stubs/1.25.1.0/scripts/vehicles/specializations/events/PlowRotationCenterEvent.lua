---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/PlowRotationCenterEvent.lua (generated stub, FS25 Lua Atlas)

---@class PlowRotationCenterEvent : Event
PlowRotationCenterEvent = {}

---@return table
function PlowRotationCenterEvent.emptyNew() end

---@param object table
function PlowRotationCenterEvent.new(object) end

---@param streamId integer
---@param connection Connection
function PlowRotationCenterEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlowRotationCenterEvent:writeStream(streamId, connection) end

---@param connection Connection
function PlowRotationCenterEvent:run(connection) end

---@param object table
---@param noEventSend boolean
function PlowRotationCenterEvent.sendEvent(object, noEventSend) end
