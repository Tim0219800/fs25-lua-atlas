---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TreeAttachRequestEvent.lua (generated stub, FS25 Lua Atlas)

---@class TreeAttachRequestEvent : Event
TreeAttachRequestEvent = {}

---@return table
function TreeAttachRequestEvent.emptyNew() end

---@param object table
---@param splitShapeId table
---@param x any
---@param y any
---@param z any
---@param ropeIndex any
---@param setupRope any
---@return table
function TreeAttachRequestEvent.new(object, splitShapeId, x, y, z, ropeIndex, setupRope) end

---@param streamId integer
---@param connection Connection
function TreeAttachRequestEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function TreeAttachRequestEvent:writeStream(streamId, connection) end

---@param connection Connection
function TreeAttachRequestEvent:run(connection) end
