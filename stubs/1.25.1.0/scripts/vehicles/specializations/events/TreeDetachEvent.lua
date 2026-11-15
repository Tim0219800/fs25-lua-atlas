---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TreeDetachEvent.lua (generated stub, FS25 Lua Atlas)

---@class TreeDetachEvent : Event
TreeDetachEvent = {}

---@return table
function TreeDetachEvent.emptyNew() end

---@param object table
---@param ropeIndex table
---@return table
function TreeDetachEvent.new(object, ropeIndex) end

---@param streamId integer
---@param connection Connection
function TreeDetachEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function TreeDetachEvent:writeStream(streamId, connection) end

---@param connection Connection
function TreeDetachEvent:run(connection) end

---@param vehicle table
---@param ropeIndex boolean
---@param noEventSend boolean
function TreeDetachEvent.sendEvent(vehicle, ropeIndex, noEventSend) end
