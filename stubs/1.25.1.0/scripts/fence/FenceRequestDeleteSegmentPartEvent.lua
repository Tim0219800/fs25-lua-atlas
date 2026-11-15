---@meta
-- FS25 1.25.1.0 : fence/FenceRequestDeleteSegmentPartEvent.lua (generated stub, FS25 Lua Atlas)

---@class FenceRequestDeleteSegmentPartEvent : Event
FenceRequestDeleteSegmentPartEvent = {}

---@return table
function FenceRequestDeleteSegmentPartEvent.emptyNew() end

---@param fencePlaceable Placeable
---@param segmentId integer
---@param childIndex integer
---@param hitX number
---@param hitY number
---@param hitZ number
---@param wholeSegment boolean
---@return FenceRequestDeleteSegmentPartEvent
function FenceRequestDeleteSegmentPartEvent.newClientToServer(fencePlaceable, segmentId, childIndex, hitX, hitY, hitZ, wholeSegment) end

---@param success boolean
---@return FenceRequestDeleteSegmentPartEvent
function FenceRequestDeleteSegmentPartEvent.newServerToClient(success) end

---@param streamId integer
---@param connection Connection
function FenceRequestDeleteSegmentPartEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function FenceRequestDeleteSegmentPartEvent:writeStream(streamId, connection) end

---@param connection Connection
function FenceRequestDeleteSegmentPartEvent:run(connection) end
