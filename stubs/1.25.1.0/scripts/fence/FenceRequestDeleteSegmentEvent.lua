---@meta
-- FS25 1.25.1.0 : fence/FenceRequestDeleteSegmentEvent.lua (stub généré, atlas Lua FS25)

---@class FenceRequestDeleteSegmentEvent : Event
FenceRequestDeleteSegmentEvent = {}

---@return table
function FenceRequestDeleteSegmentEvent.emptyNew() end

---@param streamId integer
---@param connection Connection
function FenceRequestDeleteSegmentEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function FenceRequestDeleteSegmentEvent:writeStream(streamId, connection) end

---@param connection Connection
function FenceRequestDeleteSegmentEvent:run(connection) end
