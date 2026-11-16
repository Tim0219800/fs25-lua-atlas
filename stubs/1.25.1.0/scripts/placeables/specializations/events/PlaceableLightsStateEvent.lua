---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableLightsStateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) that switches a light group of a placeable on or off. A client sends it to the server, which rebroadcasts it to the other clients and applies it locally.
---@class PlaceableLightsStateEvent : Event
PlaceableLightsStateEvent = {}

--- Creates an empty event instance for stream reading.
---@return table
function PlaceableLightsStateEvent.emptyNew() end

--- Creates the event with the placeable, the light group index and the target active state.
---@param placeable table
---@param groupIndex integer
---@param isActive boolean
function PlaceableLightsStateEvent.new(placeable, groupIndex, isActive) end

--- Reads the placeable, the group index (`PlaceableLights.MAX_NUM_BITS` bits) and the active flag, then calls `run`.
---@param streamId integer
---@param connection Connection
function PlaceableLightsStateEvent:readStream(streamId, connection) end

--- Writes the placeable, the group index (`PlaceableLights.MAX_NUM_BITS` bits) and the active flag.
---@param streamId integer
---@param connection Connection
function PlaceableLightsStateEvent:writeStream(streamId, connection) end

--- On the server, rebroadcasts to other connections (not the sender); then, if the placeable is synchronized and has `setGroupIsActive`, applies the state locally without resending.
---@param connection Connection
function PlaceableLightsStateEvent:run(connection) end

--- Unless `noEventSend` is true, broadcasts the event from the server, or sends it to the server from a client.
---@param placeable table
---@param groupIndex integer
---@param isActive boolean
---@param noEventSend any
function PlaceableLightsStateEvent.sendEvent(placeable, groupIndex, isActive, noEventSend) end
