---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableRiceFieldEffectStateEvent.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableRiceFieldEffectStateEvent : Event
PlaceableRiceFieldEffectStateEvent = {}

---@return table
function PlaceableRiceFieldEffectStateEvent.emptyNew() end

---@param placeableRiceField any
---@param fieldIndex any
---@param isFilling any
---@param isEmptying any
function PlaceableRiceFieldEffectStateEvent.new(placeableRiceField, fieldIndex, isFilling, isEmptying) end

---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldEffectStateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldEffectStateEvent:writeStream(streamId, connection) end

---@param connection Connection
function PlaceableRiceFieldEffectStateEvent:run(connection) end
