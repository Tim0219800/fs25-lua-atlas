---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableFenceAddGateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) used when a client joins: it carries a fence placeable, a segment index and the animated gate object of that segment so the gate can be registered as a network object. Its `run` is empty.
---@class PlaceableFenceAddGateEvent : Event
PlaceableFenceAddGateEvent = {}

--- Creates an empty event instance for stream reading.
---@return table
function PlaceableFenceAddGateEvent.emptyNew() end

--- Creates the event with the fence, segment index and animated gate object.
---@param fence table
---@param segmentIndex integer
---@param animatedObject boolean
function PlaceableFenceAddGateEvent.new(fence, segmentIndex, animatedObject) end

--- Client side on join: reads the fence and segment index, fetches the segment animated object, reads its id and state, finishes its registration, then calls `run`.
---@param streamId integer
---@param connection Connection
function PlaceableFenceAddGateEvent:readStream(streamId, connection) end

--- Server side on join: writes the fence, segment index, animated object id and state, and registers the object in the connection stream.
---@param streamId integer
---@param connection Connection
function PlaceableFenceAddGateEvent:writeStream(streamId, connection) end

--- Does nothing; all the work happens while reading the stream.
---@param connection Connection
function PlaceableFenceAddGateEvent:run(connection) end
