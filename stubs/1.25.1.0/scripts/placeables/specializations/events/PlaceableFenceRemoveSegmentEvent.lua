---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableFenceRemoveSegmentEvent.lua (stub généré, atlas Lua FS25)

---@class PlaceableFenceRemoveSegmentEvent : Event
PlaceableFenceRemoveSegmentEvent = {}

---@return table
function PlaceableFenceRemoveSegmentEvent.emptyNew() end

---@param fence table
---@param segmentIndex integer
---@param poleIndex boolean
function PlaceableFenceRemoveSegmentEvent.new(fence, segmentIndex, poleIndex) end

---@param streamId integer
---@param connection Connection
function PlaceableFenceRemoveSegmentEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlaceableFenceRemoveSegmentEvent:writeStream(streamId, connection) end

---@param connection Connection
function PlaceableFenceRemoveSegmentEvent:run(connection) end
