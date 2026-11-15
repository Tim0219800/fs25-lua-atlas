---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableObjectStorageStoreEvent.lua (stub généré, atlas Lua FS25)

---@class PlaceableObjectStorageStoreEvent : Event
PlaceableObjectStorageStoreEvent = {}

---@return table
function PlaceableObjectStorageStoreEvent.emptyNew() end

---@param placeable Object
---@return PlaceableObjectStorageStoreEvent
function PlaceableObjectStorageStoreEvent.new(placeable) end

---@param streamId integer
---@param connection Connection
function PlaceableObjectStorageStoreEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlaceableObjectStorageStoreEvent:writeStream(streamId, connection) end

---@param connection Connection
function PlaceableObjectStorageStoreEvent:run(connection) end
