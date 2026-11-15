---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableFenceAddGateEvent.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableFenceAddGateEvent : Event
PlaceableFenceAddGateEvent = {}

---@return table
function PlaceableFenceAddGateEvent.emptyNew() end

---@param fence table
---@param segmentIndex integer
---@param animatedObject boolean
function PlaceableFenceAddGateEvent.new(fence, segmentIndex, animatedObject) end

---@param streamId integer
---@param connection Connection
function PlaceableFenceAddGateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlaceableFenceAddGateEvent:writeStream(streamId, connection) end

---@param connection Connection
function PlaceableFenceAddGateEvent:run(connection) end
