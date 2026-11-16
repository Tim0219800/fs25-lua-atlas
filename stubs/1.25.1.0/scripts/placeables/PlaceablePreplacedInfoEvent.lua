---@meta
-- FS25 1.25.1.0 : placeables/PlaceablePreplacedInfoEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event used when a client joins, to transfer information about preplaced placeables. It holds no data itself and delegates entirely to the placeable system's stream functions.
---@class PlaceablePreplacedInfoEvent : Event
PlaceablePreplacedInfoEvent = {}

--- Creates an empty event instance for the network layer.
function PlaceablePreplacedInfoEvent.emptyNew() end

--- Creates the event; it takes no arguments and stores nothing.
function PlaceablePreplacedInfoEvent.new() end

--- Forwards the stream to `g_currentMission.placeableSystem:readStreamPreplacedInfo`, which reads the preplaced placeable info.
---@param streamId any
---@param connection any
function PlaceablePreplacedInfoEvent:readStream(streamId, connection) end

--- Forwards the stream to `g_currentMission.placeableSystem:writeStreamPreplacedInfo`, which writes the preplaced placeable info.
---@param streamId any
---@param connection any
function PlaceablePreplacedInfoEvent:writeStream(streamId, connection) end
