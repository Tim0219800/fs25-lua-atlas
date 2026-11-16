---@meta
-- FS25 1.25.1.0 : placeables/specializations/events/PlaceableRiceFieldEffectStateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that carries the effect visibility of one rice field (filling or emptying water effects) of a PlaceableRiceField, so that the effects appear on the receiving side. It derives from `Event` with the default channel and has no sender helper; it is created by the placeable code, which is not part of this file.
---@class PlaceableRiceFieldEffectStateEvent : Event
PlaceableRiceFieldEffectStateEvent = {}

--- Creates an empty event instance with the class metatable, used by the network layer before reading a stream.
---@return table
function PlaceableRiceFieldEffectStateEvent.emptyNew() end

--- Builds the event with the rice field placeable, a field index and two booleans telling whether water effects for filling or emptying are shown.
---@param placeableRiceField any
---@param fieldIndex any
---@param isFilling any
---@param isEmptying any
function PlaceableRiceFieldEffectStateEvent.new(placeableRiceField, fieldIndex, isFilling, isEmptying) end

--- Reads the rice field object, a UInt8 field index and the two flags, then runs the event immediately. No server/client branching in the code.
---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldEffectStateEvent:readStream(streamId, connection) end

--- Writes the rice field object, the UInt8 field index and the two boolean flags, mirroring `readStream`.
---@param streamId integer
---@param connection Connection
function PlaceableRiceFieldEffectStateEvent:writeStream(streamId, connection) end

--- Ignored if the rice field is nil or not yet synchronized; otherwise calls `setEffectVisibility` on it with the field index and the filling/emptying flags.
---@param connection Connection
function PlaceableRiceFieldEffectStateEvent:run(connection) end
