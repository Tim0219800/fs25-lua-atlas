---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableFenceSegmentBatchEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event, main channel) that sends many fence segments in one message during bulk construction, instead of one add-segment event each. The server already validated and charged the segments, so it carries no price and is only processed by clients.
---@class PlaceableFenceSegmentBatchEvent : Event
PlaceableFenceSegmentBatchEvent = {}

--- Creates an empty event on `NetworkNode.CHANNEL_MAIN` for stream reading.
---@return PlaceableFenceSegmentBatchEvent
function PlaceableFenceSegmentBatchEvent.emptyNew() end

--- Creates the event with the fence placeable and the list of segments.
---@param fencePlaceable Placeable
---@param segments table
---@return PlaceableFenceSegmentBatchEvent
function PlaceableFenceSegmentBatchEvent.new(fencePlaceable, segments) end

--- Reads the placeable, logs an error and returns early if it is unknown (which would misalign the stream), then reads a count (UInt8, so at most 255) and each segment (coordinates and render flags) and creates it, then calls `run`.
---@param streamId integer
---@param connection Connection
function PlaceableFenceSegmentBatchEvent:readStream(streamId, connection) end

--- Writes the placeable, the segment count as UInt8 and each segment coordinates and render flags.
---@param streamId integer
---@param connection Connection
function PlaceableFenceSegmentBatchEvent:writeStream(streamId, connection) end

--- Ignored unless received from the server and the placeable is synchronized; then queues each segment with `addSegment` (async build spread over frames) and publishes the add-segment message for it.
---@param connection Connection
function PlaceableFenceSegmentBatchEvent:run(connection) end
