---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableFenceRemoveSegmentEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) for removing a fence panel identified by segment and pole index. A client sends it to the server, which applies it and broadcasts it to all clients.
---@class PlaceableFenceRemoveSegmentEvent : Event
PlaceableFenceRemoveSegmentEvent = {}

--- Creates an empty event instance for stream reading.
---@return table
function PlaceableFenceRemoveSegmentEvent.emptyNew() end

--- Creates the event with the fence, segment index and pole index.
---@param fence table
---@param segmentIndex integer
---@param poleIndex boolean
function PlaceableFenceRemoveSegmentEvent.new(fence, segmentIndex, poleIndex) end

--- Reads the fence, segment index and pole index (32-bit integers), then calls `run`.
---@param streamId integer
---@param connection Connection
function PlaceableFenceRemoveSegmentEvent:readStream(streamId, connection) end

--- Writes the fence, segment index and pole index as 32-bit integers.
---@param streamId integer
---@param connection Connection
function PlaceableFenceRemoveSegmentEvent:writeStream(streamId, connection) end

--- If the fence is synchronized, deletes the panel through `doDeletePanel` and publishes the remove-segment message; on the server it then broadcasts the event to all clients.
---@param connection Connection
function PlaceableFenceRemoveSegmentEvent:run(connection) end
