---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableRiceFieldFieldAnswerEvent.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableRiceFieldFieldAnswerEvent : Event
PlaceableRiceFieldFieldAnswerEvent = {}

---@return table
function PlaceableRiceFieldFieldAnswerEvent.emptyNew() end

---@param placeableRiceField any
---@param statusCode any
function PlaceableRiceFieldFieldAnswerEvent.new(placeableRiceField, statusCode) end

---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldFieldAnswerEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldFieldAnswerEvent:writeStream(streamId, connection) end

---@param connection Connection
function PlaceableRiceFieldFieldAnswerEvent:run(connection) end
