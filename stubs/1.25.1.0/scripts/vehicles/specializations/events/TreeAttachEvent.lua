---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TreeAttachEvent.lua (generated stub, FS25 Lua Atlas)

---@class TreeAttachEvent : Event
TreeAttachEvent = {}

---@return table
function TreeAttachEvent.emptyNew() end

---@param object table
---@param splitShapeId table
---@param x any
---@param y any
---@param z any
---@param ropeIndex any
---@return table
function TreeAttachEvent.new(object, splitShapeId, x, y, z, ropeIndex) end

---@param streamId integer
---@param connection Connection
function TreeAttachEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function TreeAttachEvent:writeStream(streamId, connection) end

---@param connection Connection
function TreeAttachEvent:run(connection) end

---@param vehicle table
---@param splitShapeId boolean
---@param x any
---@param y any
---@param z any
---@param ropeIndex any
---@param noEventSend boolean
function TreeAttachEvent.sendEvent(vehicle, splitShapeId, x, y, z, ropeIndex, noEventSend) end
