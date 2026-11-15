---@meta
-- FS25 1.25.1.0 : handTools/events/HandsThrowObjectEvent.lua (stub généré, atlas Lua FS25)

---@class HandsThrowObjectEvent : Event
HandsThrowObjectEvent = {}

---@return table
function HandsThrowObjectEvent.emptyNew() end

---@param streamId integer
---@param connection table
function HandsThrowObjectEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection table
function HandsThrowObjectEvent:writeStream(streamId, connection) end

---@param connection table
function HandsThrowObjectEvent:run(connection) end
