---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableTrainSystemSellEvent.lua (generated stub, FS25 Lua Atlas)

--- Client-to-server network event asking a PlaceableTrainSystem to sell its goods. The server executes `sellGoods`; the effects on money or fill levels are implemented elsewhere (UNVERIFIED).
---@class PlaceableTrainSystemSellEvent : Event
PlaceableTrainSystemSellEvent = {}

--- Creates an empty event instance with the class metatable, used by the network layer before reading a stream.
---@return table
function PlaceableTrainSystemSellEvent.emptyNew() end

--- Builds the event from the train system object.
---@param object table
---@return PlaceableTrainSystemSellEvent
function PlaceableTrainSystemSellEvent.new(object) end

--- Reads the object from the stream and runs the event.
---@param streamId integer
---@param connection Connection
function PlaceableTrainSystemSellEvent:readStream(streamId, connection) end

--- Writes only the train system object reference.
---@param streamId integer
---@param connection Connection
function PlaceableTrainSystemSellEvent:writeStream(streamId, connection) end

--- Acts only on the server side (when the connection is not the server's): if the object is synchronized, calls `sellGoods` on it. No rebroadcast.
---@param connection Connection
function PlaceableTrainSystemSellEvent:run(connection) end
