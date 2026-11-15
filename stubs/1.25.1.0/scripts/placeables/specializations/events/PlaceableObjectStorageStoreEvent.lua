---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableObjectStorageStoreEvent.lua (generated stub, FS25 Lua Atlas)

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
