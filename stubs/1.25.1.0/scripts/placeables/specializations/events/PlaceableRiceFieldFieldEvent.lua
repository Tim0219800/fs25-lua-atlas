---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableRiceFieldFieldEvent.lua (stub généré, atlas Lua FS25)

---@class PlaceableRiceFieldFieldEvent : Event
PlaceableRiceFieldFieldEvent = {}

---@return table
function PlaceableRiceFieldFieldEvent.emptyNew() end

---@param placeableRiceField any
---@param field any
function PlaceableRiceFieldFieldEvent.new(placeableRiceField, field) end

---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldFieldEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldFieldEvent:writeStream(streamId, connection) end

---@param connection Connection
function PlaceableRiceFieldFieldEvent:run(connection) end
