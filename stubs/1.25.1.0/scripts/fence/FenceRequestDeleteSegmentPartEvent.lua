---@meta
-- FS25 1.25.1.0 : fence/FenceRequestDeleteSegmentPartEvent.lua (generated stub, FS25 Lua Atlas)

--- Client-to-server request to delete a single panel of a fence segment, or the whole segment, with a Bool reply from the server. The server re-checks permissions, rebuilds the remaining sub-segments, and broadcasts FenceDeleteSegmentEvent plus FenceSegmentEvent to clients. Subclass of Event on the main channel.
---@class FenceRequestDeleteSegmentPartEvent : Event
FenceRequestDeleteSegmentPartEvent = {}

--- Creates an empty event on the main network channel, for reception from a stream.
---@return table
function FenceRequestDeleteSegmentPartEvent.emptyNew() end

--- Builds the request: placeable, segment id, child index of the panel node, its world position as a fallback locator, and a flag choosing whole-segment deletion over a single panel.
---@param fencePlaceable Placeable
---@param segmentId integer
---@param childIndex integer
---@param hitX number
---@param hitY number
---@param hitZ number
---@param wholeSegment boolean
---@return FenceRequestDeleteSegmentPartEvent
function FenceRequestDeleteSegmentPartEvent.newClientToServer(fencePlaceable, segmentId, childIndex, hitX, hitY, hitZ, wholeSegment) end

--- Builds the server reply carrying only the success flag.
---@param success boolean
---@return FenceRequestDeleteSegmentPartEvent
function FenceRequestDeleteSegmentPartEvent.newServerToClient(success) end

--- Server side: reads placeable, UInt16 segment id and child index, three compressed world positions (using the mission's vehicle position compression params) and the whole-segment Bool. Client side: reads the success Bool. Then calls run.
---@param streamId integer
---@param connection Connection
function FenceRequestDeleteSegmentPartEvent:readStream(streamId, connection) end

--- Mirror of readStream: to the server writes placeable, ids, compressed hit position and whole-segment flag; to a client writes only the success Bool.
---@param streamId integer
---@param connection Connection
function FenceRequestDeleteSegmentPartEvent:writeStream(streamId, connection) end

--- Client: publishes the result. Server: replies false unless the placeable is synchronized, the segment exists, deletion is allowed, and the player's farm may modify and delete it. It then resolves the panel by child index (fallback: nearest child to the hit position via findNearestChild, not defined in this file, UNVERIFIED) and calls deleteSegmentPart. It deletes the placeable if no segment remains, otherwise broadcasts the old segment's deletion and the new segments, then replies true.
---@param connection Connection
function FenceRequestDeleteSegmentPartEvent:run(connection) end
