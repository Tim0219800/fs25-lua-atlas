---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/EnterablePassengerLeaveEvent.lua (stub généré, atlas Lua FS25)

---@class EnterablePassengerLeaveEvent : Event
EnterablePassengerLeaveEvent = {}

---@return table
function EnterablePassengerLeaveEvent.emptyNew() end

---@param vehicle table
---@param userId any
---@return table
function EnterablePassengerLeaveEvent.new(vehicle, userId) end

---@param streamId integer
---@param connection Connection
function EnterablePassengerLeaveEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function EnterablePassengerLeaveEvent:writeStream(streamId, connection) end

---@param connection Connection
function EnterablePassengerLeaveEvent:run(connection) end

---@param vehicle any
---@param userId any
---@param noEventSend any
function EnterablePassengerLeaveEvent.sendEvent(vehicle, userId, noEventSend) end
