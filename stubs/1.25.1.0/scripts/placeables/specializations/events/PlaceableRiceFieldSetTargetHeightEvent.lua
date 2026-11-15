---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableRiceFieldSetTargetHeightEvent.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableRiceFieldSetTargetHeightEvent : Event
PlaceableRiceFieldSetTargetHeightEvent = {}

---@return table
function PlaceableRiceFieldSetTargetHeightEvent.emptyNew() end

---@param placeableRiceField any
---@param fieldIndex any
---@param targetHeight any
function PlaceableRiceFieldSetTargetHeightEvent.new(placeableRiceField, fieldIndex, targetHeight) end

---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldSetTargetHeightEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldSetTargetHeightEvent:writeStream(streamId, connection) end

---@param connection Connection
function PlaceableRiceFieldSetTargetHeightEvent:run(connection) end
