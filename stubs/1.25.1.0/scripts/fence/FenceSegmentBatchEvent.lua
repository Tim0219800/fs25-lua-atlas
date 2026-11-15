---@meta
-- FS25 1.25.1.0 : fence/FenceSegmentBatchEvent.lua (generated stub, FS25 Lua Atlas)

---@class FenceSegmentBatchEvent : Event
FenceSegmentBatchEvent = {}

---@return FenceSegmentBatchEvent
function FenceSegmentBatchEvent.emptyNew() end

---@param fencePlaceable Placeable
---@param segments table
---@return FenceSegmentBatchEvent
function FenceSegmentBatchEvent.newSegments(fencePlaceable, segments) end

---@param requestId integer
---@param doneSteps integer
---@param totalSteps integer
---@return FenceSegmentBatchEvent
function FenceSegmentBatchEvent.newProgress(requestId, doneSteps, totalSteps) end

---@param streamId integer
---@param connection Connection
function FenceSegmentBatchEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function FenceSegmentBatchEvent:writeStream(streamId, connection) end

---@param connection Connection
function FenceSegmentBatchEvent:run(connection) end
