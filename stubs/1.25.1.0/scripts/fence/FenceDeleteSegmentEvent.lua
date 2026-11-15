---@meta
-- FS25 1.25.1.0 : fence/FenceDeleteSegmentEvent.lua (stub généré, atlas Lua FS25)

---@class FenceDeleteSegmentEvent : Event
FenceDeleteSegmentEvent = {}

---@return table
function FenceDeleteSegmentEvent.emptyNew() end

---@param streamId integer
---@param connection Connection
function FenceDeleteSegmentEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function FenceDeleteSegmentEvent:writeStream(streamId, connection) end

---@param connection Connection
function FenceDeleteSegmentEvent:run(connection) end
