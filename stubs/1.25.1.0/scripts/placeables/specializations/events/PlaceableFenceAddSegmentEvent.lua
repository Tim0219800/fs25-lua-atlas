---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableFenceAddSegmentEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) for adding one fence segment from the build tool. A client sends it to the server, which creates the segment, charges the purchase price to the fence owner farm and broadcasts it to the other clients. Local listeners are told via a message-center publish.
---@class PlaceableFenceAddSegmentEvent : Event
PlaceableFenceAddSegmentEvent = {}

--- Creates an empty event instance for stream reading.
---@return table
function PlaceableFenceAddSegmentEvent.emptyNew() end

--- Creates the event with the fence, segment end points (x1, z1, x2, z2), the render-first and render-last flags, an optional gate index and the price.
---@param fence table
---@param x1 integer
---@param z1 boolean
---@param x2 any
---@param z2 any
---@param renderFirst any
---@param renderLast any
---@param gateIndex any
---@param price any
function PlaceableFenceAddSegmentEvent.new(fence, x1, z1, x2, z2, renderFirst, renderLast, gateIndex, price) end

--- Reads the fence, four coordinates, both render flags, the gate index (0 means none) and the price, then calls `run`.
---@param streamId integer
---@param connection Connection
function PlaceableFenceAddSegmentEvent:readStream(streamId, connection) end

--- Writes the same fields in the same order (gate index written as 0 when nil).
---@param streamId integer
---@param connection Connection
function PlaceableFenceAddSegmentEvent:writeStream(streamId, connection) end

--- If the fence is synchronized, creates and adds the segment (built synchronously on clients when it has a gate) and publishes the add-segment message. On the server side it also deducts the price from the owner farm as a property purchase and broadcasts the event.
---@param connection Connection
function PlaceableFenceAddSegmentEvent:run(connection) end
