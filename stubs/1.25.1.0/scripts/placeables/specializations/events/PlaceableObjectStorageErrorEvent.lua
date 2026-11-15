---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableObjectStorageErrorEvent.lua (stub généré, atlas Lua FS25)

---@class PlaceableObjectStorageErrorEvent : Event
PlaceableObjectStorageErrorEvent = {}

---@return table
function PlaceableObjectStorageErrorEvent.emptyNew() end

---@param placeable table
---@param errorId integer
function PlaceableObjectStorageErrorEvent.new(placeable, errorId) end

---@param streamId integer
---@param connection Connection
function PlaceableObjectStorageErrorEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlaceableObjectStorageErrorEvent:writeStream(streamId, connection) end

---@param connection Connection
function PlaceableObjectStorageErrorEvent:run(connection) end
