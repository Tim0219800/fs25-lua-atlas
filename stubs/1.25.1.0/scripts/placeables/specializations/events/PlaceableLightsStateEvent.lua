---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableLightsStateEvent.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableLightsStateEvent : Event
PlaceableLightsStateEvent = {}

---@return table
function PlaceableLightsStateEvent.emptyNew() end

---@param placeable table
---@param groupIndex integer
---@param isActive boolean
function PlaceableLightsStateEvent.new(placeable, groupIndex, isActive) end

---@param streamId integer
---@param connection Connection
function PlaceableLightsStateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlaceableLightsStateEvent:writeStream(streamId, connection) end

---@param connection Connection
function PlaceableLightsStateEvent:run(connection) end

---@param placeable table
---@param groupIndex integer
---@param isActive boolean
---@param noEventSend any
function PlaceableLightsStateEvent.sendEvent(placeable, groupIndex, isActive, noEventSend) end
