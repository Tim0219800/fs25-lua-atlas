---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/BalerBaleTypeEvent.lua (generated stub, FS25 Lua Atlas)

---@class BalerBaleTypeEvent : Event
BalerBaleTypeEvent = {}

---@return table
function BalerBaleTypeEvent.emptyNew() end

---@param object table
---@param baleTypeIndex integer
---@param force boolean
function BalerBaleTypeEvent.new(object, baleTypeIndex, force) end

---@param streamId integer
---@param connection Connection
function BalerBaleTypeEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function BalerBaleTypeEvent:writeStream(streamId, connection) end

---@param connection Connection
function BalerBaleTypeEvent:run(connection) end

---@param object table
---@param baleTypeIndex integer
---@param force boolean
---@param noEventSend boolean
function BalerBaleTypeEvent.sendEvent(object, baleTypeIndex, force, noEventSend) end
