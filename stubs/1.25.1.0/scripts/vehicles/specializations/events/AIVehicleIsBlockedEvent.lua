---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AIVehicleIsBlockedEvent.lua (stub généré, atlas Lua FS25)

---@class AIVehicleIsBlockedEvent : Event
AIVehicleIsBlockedEvent = {}

---@return table
function AIVehicleIsBlockedEvent.emptyNew() end

---@param object table
---@param isBlocked boolean
function AIVehicleIsBlockedEvent.new(object, isBlocked) end

---@param streamId integer
---@param connection Connection
function AIVehicleIsBlockedEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function AIVehicleIsBlockedEvent:writeStream(streamId, connection) end

---@param connection Connection
function AIVehicleIsBlockedEvent:run(connection) end
