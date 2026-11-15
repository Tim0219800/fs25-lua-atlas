---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableFenceAddSegmentEvent.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableFenceAddSegmentEvent : Event
PlaceableFenceAddSegmentEvent = {}

---@return table
function PlaceableFenceAddSegmentEvent.emptyNew() end

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

---@param streamId integer
---@param connection Connection
function PlaceableFenceAddSegmentEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlaceableFenceAddSegmentEvent:writeStream(streamId, connection) end

---@param connection Connection
function PlaceableFenceAddSegmentEvent:run(connection) end
