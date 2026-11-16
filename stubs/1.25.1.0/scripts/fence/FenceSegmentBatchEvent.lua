---@meta
-- FS25 1.25.1.0 : fence/FenceSegmentBatchEvent.lua (generated stub, FS25 Lua Atlas)

--- Server-to-client event with two forms in one class: a batch of freshly built fence segments (bulk construction), or a progress report (request id, done steps, total steps) with no segments, sent only to the requesting client. The first stream Bool selects the form. Subclass of Event on the main channel.
---@class FenceSegmentBatchEvent : Event
FenceSegmentBatchEvent = {}

--- Creates an empty event on the main network channel.
---@return FenceSegmentBatchEvent
function FenceSegmentBatchEvent.emptyNew() end

--- Creates the batch form for a placeable and an array of built segments. The source documents a cap named MAX_SEGMENTS (not defined in this file, UNVERIFIED); the count is written as a UInt8.
---@param fencePlaceable Placeable
---@param segments table
---@return FenceSegmentBatchEvent
function FenceSegmentBatchEvent.newSegments(fencePlaceable, segments) end

--- Creates the progress form from a build-run request id, steps done and total steps. Meant for the requesting client only, since run ids are per client.
---@param requestId integer
---@param doneSteps integer
---@param totalSteps integer
---@return FenceSegmentBatchEvent
function FenceSegmentBatchEvent.newProgress(requestId, doneSteps, totalSteps) end

--- Reads the form Bool. Progress form: UInt8 request id and two UInt16 counters, then run. Batch form: reads the placeable (logs an error and aborts if unknown, which misaligns the stream), then per segment a UInt8 template index and the segment data (no chained previous segment), then run.
---@param streamId integer
---@param connection Connection
function FenceSegmentBatchEvent:readStream(streamId, connection) end

--- Writes the form Bool (true if segments are set), then either the progress counters or the placeable, the segment count and each segment's template index and data.
---@param streamId integer
---@param connection Connection
function FenceSegmentBatchEvent:writeStream(streamId, connection) end

--- Progress form: publishes request id, done and total steps on the message center. Batch form: if the placeable is not synchronized, deletes the segments just created; otherwise updates meshes (true, false) and finalizes each one.
---@param connection Connection
function FenceSegmentBatchEvent:run(connection) end
