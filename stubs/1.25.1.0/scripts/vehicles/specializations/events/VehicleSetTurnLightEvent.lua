---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/VehicleSetTurnLightEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes the turn signal state (off, left, right, hazard) of a vehicle. The constructor asserts the state is between 0 and Lights.TURNLIGHT_HAZARD. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class VehicleSetTurnLightEvent : Event
VehicleSetTurnLightEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function VehicleSetTurnLightEvent.emptyNew() end

--- Builds the event with the data to send (a node object and a turn light state (Lights.turnLightSendNumBits bits)); stored on the instance for `writeStream`.
---@param object table
---@param state integer
function VehicleSetTurnLightEvent.new(object, state) end

--- Reads a node object and a turn light state (Lights.turnLightSendNumBits bits) from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function VehicleSetTurnLightEvent:readStream(streamId, connection) end

--- Writes a node object and a turn light state (Lights.turnLightSendNumBits bits) to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function VehicleSetTurnLightEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: calls `setTurnLightState(state, true, true)` on the object if synchronized, then the server re-broadcasts to the other clients.
---@param connection Connection
function VehicleSetTurnLightEvent:run(connection) end
