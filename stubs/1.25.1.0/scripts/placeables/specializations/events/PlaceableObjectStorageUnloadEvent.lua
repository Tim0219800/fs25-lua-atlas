---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableObjectStorageUnloadEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) asking the server to unload a number of stored objects of one kind from an object storage placeable. It carries the placeable, the object info index and the amount.
---@class PlaceableObjectStorageUnloadEvent : Event
PlaceableObjectStorageUnloadEvent = {}

--- Creates an empty event instance for stream reading.
---@return table
function PlaceableObjectStorageUnloadEvent.emptyNew() end

--- Creates the event with the storage placeable, the object info index and the amount to unload.
---@param placeable table
---@param objectInfoIndex integer
---@param objectAmount boolean
function PlaceableObjectStorageUnloadEvent.new(placeable, objectInfoIndex, objectAmount) end

--- Reads the placeable, the object info index (`NUM_BITS_OBJECT_INFO` bits) and the amount (`NUM_BITS_AMOUNT` bits), then calls `run`.
---@param streamId integer
---@param connection Connection
function PlaceableObjectStorageUnloadEvent:readStream(streamId, connection) end

--- Writes the placeable, the object info index and the amount with the same bit widths as reading.
---@param streamId integer
---@param connection Connection
function PlaceableObjectStorageUnloadEvent:writeStream(streamId, connection) end

--- If the placeable is synchronized and has `removeAbstractObjectsFromStorage`, calls it with the index, amount and connection.
---@param connection Connection
function PlaceableObjectStorageUnloadEvent:run(connection) end
