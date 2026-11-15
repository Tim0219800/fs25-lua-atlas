---@meta
-- FS25 1.25.1.0 : events/BaleUnpackEvent.lua (generated stub, FS25 Lua Atlas)

---@class BaleUnpackEvent : Event
BaleUnpackEvent = {}

---@return table
function BaleUnpackEvent.emptyNew() end

---@param bale table
---@return table
function BaleUnpackEvent.new(bale) end

---@param streamId integer
---@param connection Connection
function BaleUnpackEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function BaleUnpackEvent:writeStream(streamId, connection) end

---@param connection Connection
function BaleUnpackEvent:run(connection) end
