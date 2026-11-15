---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableFenceSegmentBatchEvent.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableFenceSegmentBatchEvent : Event
PlaceableFenceSegmentBatchEvent = {}

---@return PlaceableFenceSegmentBatchEvent
function PlaceableFenceSegmentBatchEvent.emptyNew() end

---@param fencePlaceable Placeable
---@param segments table
---@return PlaceableFenceSegmentBatchEvent
function PlaceableFenceSegmentBatchEvent.new(fencePlaceable, segments) end

---@param streamId integer
---@param connection Connection
function PlaceableFenceSegmentBatchEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlaceableFenceSegmentBatchEvent:writeStream(streamId, connection) end

---@param connection Connection
function PlaceableFenceSegmentBatchEvent:run(connection) end
