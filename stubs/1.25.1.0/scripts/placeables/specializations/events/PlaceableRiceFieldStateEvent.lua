---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableRiceFieldStateEvent.lua (stub généré, atlas Lua FS25)

---@class PlaceableRiceFieldStateEvent : Event
PlaceableRiceFieldStateEvent = {}

---@return table
function PlaceableRiceFieldStateEvent.emptyNew() end

---@param placeableRiceField any
---@param fieldIndex any
function PlaceableRiceFieldStateEvent.new(placeableRiceField, fieldIndex) end

---@param placeableRiceField any
---@param fieldIndex any
---@param fruitTypeIndex any
---@param growthStateIndex any
function PlaceableRiceFieldStateEvent.newServerToClient(placeableRiceField, fieldIndex, fruitTypeIndex, growthStateIndex) end

---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldStateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldStateEvent:writeStream(streamId, connection) end

---@param connection Connection
function PlaceableRiceFieldStateEvent:run(connection) end
