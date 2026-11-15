---@meta
-- FS25 1.25.1.0 : fence/FenceSegmentEvent.lua (generated stub, FS25 Lua Atlas)

---@class FenceSegmentEvent : Event
FenceSegmentEvent = {}

---@return table
function FenceSegmentEvent.emptyNew() end

---@param fencePlaceable Placeable
---@param segment Segment
---@return FenceSegmentEvent
function FenceSegmentEvent.new(fencePlaceable, segment) end

---@param streamId integer
---@param connection Connection
function FenceSegmentEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function FenceSegmentEvent:writeStream(streamId, connection) end

---@param connection Connection
function FenceSegmentEvent:run(connection) end
