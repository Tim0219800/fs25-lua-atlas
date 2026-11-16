---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableRiceFieldSetTargetHeightEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that changes the water target height of one rice field of a PlaceableRiceField. A client sends it to the server, which applies it and rebroadcasts it to every client.
---@class PlaceableRiceFieldSetTargetHeightEvent : Event
PlaceableRiceFieldSetTargetHeightEvent = {}

--- Creates an empty event using the class metatable; unlike sibling events, no channel is passed (default channel).
---@return table
function PlaceableRiceFieldSetTargetHeightEvent.emptyNew() end

--- Builds the event from the rice field placeable, a field index and a target water height.
---@param placeableRiceField any
---@param fieldIndex any
---@param targetHeight any
function PlaceableRiceFieldSetTargetHeightEvent.new(placeableRiceField, fieldIndex, targetHeight) end

--- Reads the rice field object, a UInt8 field index and a Float32 target height, then runs the event.
---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldSetTargetHeightEvent:readStream(streamId, connection) end

--- Writes the rice field object, the UInt8 field index and the Float32 target height.
---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldSetTargetHeightEvent:writeStream(streamId, connection) end

--- If the rice field is synchronized, calls `setWaterHeightTarget` with the field index, the target height and a flag set to true; on the server it then rebroadcasts the event to all clients.
---@param connection Connection
function PlaceableRiceFieldSetTargetHeightEvent:run(connection) end
