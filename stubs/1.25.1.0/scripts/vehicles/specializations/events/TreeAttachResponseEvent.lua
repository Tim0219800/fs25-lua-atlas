---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TreeAttachResponseEvent.lua (generated stub, FS25 Lua Atlas)

---@class TreeAttachResponseEvent : Event
TreeAttachResponseEvent = {}

---@return table
function TreeAttachResponseEvent.emptyNew() end

---@param object table
---@param failedReason table
---@param ropeIndex any
---@return table
function TreeAttachResponseEvent.new(object, failedReason, ropeIndex) end

---@param streamId integer
---@param connection Connection
function TreeAttachResponseEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function TreeAttachResponseEvent:writeStream(streamId, connection) end

---@param connection Connection
function TreeAttachResponseEvent:run(connection) end
