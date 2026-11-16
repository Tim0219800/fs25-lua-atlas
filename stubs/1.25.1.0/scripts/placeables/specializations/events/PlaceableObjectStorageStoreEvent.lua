---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableObjectStorageStoreEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) asking the server to store the objects pending in the object storage placeable. It only carries the placeable reference.
---@class PlaceableObjectStorageStoreEvent : Event
PlaceableObjectStorageStoreEvent = {}

--- Creates an empty event instance for stream reading.
---@return table
function PlaceableObjectStorageStoreEvent.emptyNew() end

--- Creates the event for the given storage placeable.
---@param placeable Object
---@return PlaceableObjectStorageStoreEvent
function PlaceableObjectStorageStoreEvent.new(placeable) end

--- Reads the placeable, then calls `run`.
---@param streamId integer
---@param connection Connection
function PlaceableObjectStorageStoreEvent:readStream(streamId, connection) end

--- Writes the placeable reference.
---@param streamId integer
---@param connection Connection
function PlaceableObjectStorageStoreEvent:writeStream(streamId, connection) end

--- If the placeable is synchronized and has `storePendingManualObjects`, calls it to store the waiting objects.
---@param connection Connection
function PlaceableObjectStorageStoreEvent:run(connection) end
