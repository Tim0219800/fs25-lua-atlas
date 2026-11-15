---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/PlowRotationEvent.lua (stub généré, atlas Lua FS25)

---@class PlowRotationEvent : Event
PlowRotationEvent = {}

---@return table
function PlowRotationEvent.emptyNew() end

---@param object table
---@param rotationMax boolean
function PlowRotationEvent.new(object, rotationMax) end

---@param streamId integer
---@param connection Connection
function PlowRotationEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlowRotationEvent:writeStream(streamId, connection) end

---@param connection Connection
function PlowRotationEvent:run(connection) end

---@param object table
---@param rotationMax boolean
---@param noEventSend boolean
function PlowRotationEvent.sendEvent(object, rotationMax, noEventSend) end
