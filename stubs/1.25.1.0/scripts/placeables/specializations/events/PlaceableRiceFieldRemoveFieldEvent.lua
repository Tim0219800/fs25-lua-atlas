---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableRiceFieldRemoveFieldEvent.lua (stub généré, atlas Lua FS25)

---@class PlaceableRiceFieldRemoveFieldEvent : Event
PlaceableRiceFieldRemoveFieldEvent = {}

---@return table
function PlaceableRiceFieldRemoveFieldEvent.emptyNew() end

---@param placeableRiceField any
---@param fieldIndex any
function PlaceableRiceFieldRemoveFieldEvent.new(placeableRiceField, fieldIndex) end

---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldRemoveFieldEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldRemoveFieldEvent:writeStream(streamId, connection) end

---@param connection Connection
function PlaceableRiceFieldRemoveFieldEvent:run(connection) end
