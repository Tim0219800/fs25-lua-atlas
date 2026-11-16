---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableObjectStorageErrorEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) from the server to a client telling that an object storage action failed. The client shows a blinking warning only for the owner farm and when the player is within a warning distance of the storage. Error ids and the distance constants are defined elsewhere in this class.
---@class PlaceableObjectStorageErrorEvent : Event
PlaceableObjectStorageErrorEvent = {}

--- Creates an empty event instance for stream reading.
---@return table
function PlaceableObjectStorageErrorEvent.emptyNew() end

--- Creates the event with the storage placeable and an error id.
---@param placeable table
---@param errorId integer
function PlaceableObjectStorageErrorEvent.new(placeable, errorId) end

--- Reads the placeable and the error id (`SEND_NUM_BITS` bits), then calls `run`.
---@param streamId integer
---@param connection Connection
function PlaceableObjectStorageErrorEvent:readStream(streamId, connection) end

--- Writes the placeable and the error id (`SEND_NUM_BITS` bits).
---@param streamId integer
---@param connection Connection
function PlaceableObjectStorageErrorEvent:writeStream(streamId, connection) end

--- If the placeable is synchronized, belongs to the local farm and is within `SHOW_WARNING_DISTANCE` (XZ) of the client, shows a blinking warning for the matching error: not enough space, storage full, bale or pallet slot limit, unsupported object, or max amount reached.
---@param connection Connection
function PlaceableObjectStorageErrorEvent:run(connection) end
