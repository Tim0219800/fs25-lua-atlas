---@meta
-- FS25 1.25.1.0 : fence/FenceRequestDeleteSegmentEvent.lua (generated stub, FS25 Lua Atlas)

--- Client-to-server request to delete a fence segment, with a server-to-client reply carrying a success flag. The server deletes the segment, replies, and broadcasts a FenceDeleteSegmentEvent to the other clients. Subclass of Event on the main channel.
---@class FenceRequestDeleteSegmentEvent : Event
FenceRequestDeleteSegmentEvent = {}

--- Creates an empty event on the main network channel. The `new`/`newServerToClient` constructors used elsewhere in this file are not defined here (UNVERIFIED where they come from).
---@return table
function FenceRequestDeleteSegmentEvent.emptyNew() end

--- On the server side reads placeable and UInt16 segment id; on the client side reads the Bool success flag. Then calls run.
---@param streamId integer
---@param connection Connection
function FenceRequestDeleteSegmentEvent:readStream(streamId, connection) end

--- When sending to the server writes placeable and segment id; when sending to a client writes the success Bool.
---@param streamId integer
---@param connection Connection
function FenceRequestDeleteSegmentEvent:writeStream(streamId, connection) end

--- Client: publishes the success flag on the message center. Server: finds the segment, replies false if missing, otherwise removes and deletes it, replies true, and broadcasts a FenceDeleteSegmentEvent to all other connections.
---@param connection Connection
function FenceRequestDeleteSegmentEvent:run(connection) end
