---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableObjectStorageUnloadEvent.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableObjectStorageUnloadEvent : Event
PlaceableObjectStorageUnloadEvent = {}

---@return table
function PlaceableObjectStorageUnloadEvent.emptyNew() end

---@param placeable table
---@param objectInfoIndex integer
---@param objectAmount boolean
function PlaceableObjectStorageUnloadEvent.new(placeable, objectInfoIndex, objectAmount) end

---@param streamId integer
---@param connection Connection
function PlaceableObjectStorageUnloadEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlaceableObjectStorageUnloadEvent:writeStream(streamId, connection) end

---@param connection Connection
function PlaceableObjectStorageUnloadEvent:run(connection) end
