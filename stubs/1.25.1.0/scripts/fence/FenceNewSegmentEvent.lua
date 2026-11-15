---@meta
-- FS25 1.25.1.0 : fence/FenceNewSegmentEvent.lua (stub généré, atlas Lua FS25)

---@class FenceNewSegmentEvent : Event
FenceNewSegmentEvent = {}

---@return table
function FenceNewSegmentEvent.emptyNew() end

---@param streamId integer
---@param connection Connection
function FenceNewSegmentEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function FenceNewSegmentEvent:writeStream(streamId, connection) end

---@param connection Connection
function FenceNewSegmentEvent:run(connection) end
