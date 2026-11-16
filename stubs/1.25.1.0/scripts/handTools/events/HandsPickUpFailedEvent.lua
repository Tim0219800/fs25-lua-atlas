---@meta
-- FS25 1.25.1.0 : handTools/events/HandsPickUpFailedEvent.lua (generated stub, FS25 Lua Atlas)

--- Server-to-client network event telling a client that its hands hand tool failed to pick up the requested object. It is only allowed in the server to client direction (asserted in `run`).
---@class HandsPickUpFailedEvent : Event
HandsPickUpFailedEvent = {}

--- Creates an empty event instance for the network layer to fill in `readStream`.
---@return table
function HandsPickUpFailedEvent.emptyNew() end

--- Creates the event for the given hands hand tool.
---@param hands any
function HandsPickUpFailedEvent.new(hands) end

--- Reads the hands (node object) from the stream, then runs the event.
---@param streamId integer
---@param connection Connection
function HandsPickUpFailedEvent:readStream(streamId, connection) end

--- Writes the hands as a node object to the stream.
---@param streamId integer
---@param connection Connection
function HandsPickUpFailedEvent:writeStream(streamId, connection) end

--- Asserts it comes from the server; if the hands exist and are synchronized, calls `pickupFailed()` on them.
---@param connection Connection
function HandsPickUpFailedEvent:run(connection) end
