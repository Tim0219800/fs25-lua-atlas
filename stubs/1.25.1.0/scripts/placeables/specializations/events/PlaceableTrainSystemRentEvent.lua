---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableTrainSystemRentEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes renting or returning the railroad of a PlaceableTrainSystem, along with the renting farm and a spline position. Use `sendEvent` to route it correctly from client or server. Note: the doc comments in the source (ai start, swath) were copied from other events and do not match.
---@class PlaceableTrainSystemRentEvent : Event
PlaceableTrainSystemRentEvent = {}

--- Creates an empty event using the class metatable, with the default channel.
---@return table
function PlaceableTrainSystemRentEvent.emptyNew() end

--- Builds the event from the train system object, a rented flag, the renting farm id and the spline position. Farm id and position only matter when rented.
---@param object table
---@param isRented integer
---@param farmId boolean
---@param splinePosition integer
function PlaceableTrainSystemRentEvent.new(object, isRented, farmId, splinePosition) end

--- Reads the object and the rented flag; if rented, also the farm id and the Float32 spline position. Then runs the event.
---@param streamId integer
---@param connection Connection
function PlaceableTrainSystemRentEvent:readStream(streamId, connection) end

--- Writes the object and the rented flag; if rented, also the farm id and the spline position.
---@param streamId integer
---@param connection Connection
function PlaceableTrainSystemRentEvent:writeStream(streamId, connection) end

--- If the object is synchronized, calls `rentRailroad` or `returnRailroad` (both with a no-send flag). When received by the server, it rebroadcasts a new event to the other clients, skipping the sender connection.
---@param connection Connection
function PlaceableTrainSystemRentEvent:run(connection) end

--- Static helper: unless `noEventSend` is true, the server broadcasts the event, while a client sends it to the server connection.
---@param object table
---@param isRented boolean
---@param farmId boolean
---@param splinePosition any
---@param noEventSend boolean
function PlaceableTrainSystemRentEvent.sendEvent(object, isRented, farmId, splinePosition, noEventSend) end
