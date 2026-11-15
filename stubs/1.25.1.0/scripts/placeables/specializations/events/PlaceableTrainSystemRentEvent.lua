---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableTrainSystemRentEvent.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableTrainSystemRentEvent : Event
PlaceableTrainSystemRentEvent = {}

---@return table
function PlaceableTrainSystemRentEvent.emptyNew() end

---@param object table
---@param isRented integer
---@param farmId boolean
---@param splinePosition integer
function PlaceableTrainSystemRentEvent.new(object, isRented, farmId, splinePosition) end

---@param streamId integer
---@param connection Connection
function PlaceableTrainSystemRentEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlaceableTrainSystemRentEvent:writeStream(streamId, connection) end

---@param connection Connection
function PlaceableTrainSystemRentEvent:run(connection) end

---@param object table
---@param isRented boolean
---@param farmId boolean
---@param splinePosition any
---@param noEventSend boolean
function PlaceableTrainSystemRentEvent.sendEvent(object, isRented, farmId, splinePosition, noEventSend) end
