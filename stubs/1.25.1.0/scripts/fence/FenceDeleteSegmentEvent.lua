---@meta
-- FS25 1.25.1.0 : fence/FenceDeleteSegmentEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that tells every peer to remove one fence segment, identified by its placeable and a 16-bit segment id. It is broadcast by the server (see FenceRequestDeleteSegmentEvent) and, on receipt, deletes the segment and publishes a message. Subclass of Event on the main channel.
---@class FenceDeleteSegmentEvent : Event
FenceDeleteSegmentEvent = {}

--- Creates an empty event instance on the main network channel, used when the event is received from a stream. There is no `new` constructor in this file, so senders must fill `fencePlaceable` and `segmentId` themselves.
---@return table
function FenceDeleteSegmentEvent.emptyNew() end

--- Reads the fence placeable (node object) and the UInt16 segment id from the stream, then immediately calls run.
---@param streamId integer
---@param connection Connection
function FenceDeleteSegmentEvent:readStream(streamId, connection) end

--- Writes the fence placeable as a node object followed by the segment id as UInt16.
---@param streamId integer
---@param connection Connection
function FenceDeleteSegmentEvent:writeStream(streamId, connection) end

--- If the placeable is synchronized: the server rebroadcasts the event, then the segment is removed from the fence, deleted, and a message is published with the placeable and segment. On the server, the placeable itself is deleted once no segment remains.
---@param connection Connection
function FenceDeleteSegmentEvent:run(connection) end
