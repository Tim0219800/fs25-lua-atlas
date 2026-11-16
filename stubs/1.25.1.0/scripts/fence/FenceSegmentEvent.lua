---@meta
-- FS25 1.25.1.0 : fence/FenceSegmentEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event, sent by the server to all clients, that announces a newly built fence segment. Carries the fence placeable, the segment template index and the segment's own serialized data. Subclass of Event on the main channel.
---@class FenceSegmentEvent : Event
FenceSegmentEvent = {}

--- Creates an empty event on the main network channel, for use when reading from a stream.
---@return table
function FenceSegmentEvent.emptyNew() end

--- Creates an event holding the given fence placeable and segment, ready to be broadcast.
---@param fencePlaceable Placeable
---@param segment Segment
---@return FenceSegmentEvent
function FenceSegmentEvent.new(fencePlaceable, segment) end

--- Reads the placeable and a UInt8 template index, asks the fence to create a segment for that template, lets the segment read its own data, then calls run.
---@param streamId integer
---@param connection Connection
function FenceSegmentEvent:readStream(streamId, connection) end

--- Writes the placeable, the UInt8 template index looked up from the segment id, then the segment's own data.
---@param streamId integer
---@param connection Connection
function FenceSegmentEvent:writeStream(streamId, connection) end

--- If the placeable is synchronized, updates the segment meshes (flags true, false) and finalizes it. No validation here: the server is assumed to have validated it already.
---@param connection Connection
function FenceSegmentEvent:run(connection) end
