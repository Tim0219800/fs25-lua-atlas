---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/VehicleSetLightEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes the lights bit mask of a vehicle. The mask width is sent first on 5 bits, then the mask itself. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class VehicleSetLightEvent : Event
VehicleSetLightEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function VehicleSetLightEvent.emptyNew() end

--- Builds the event with the data to send (a node object, a bit count (5 bits) and the lights type mask on that many bits); stored on the instance for `writeStream`.
---@param object table
---@param lightsTypesMask integer
---@param numBits any
function VehicleSetLightEvent.new(object, lightsTypesMask, numBits) end

--- Reads a node object, a bit count (5 bits) and the lights type mask on that many bits from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function VehicleSetLightEvent:readStream(streamId, connection) end

--- Writes a node object, a bit count (5 bits) and the lights type mask on that many bits to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function VehicleSetLightEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: calls `setLightsTypesMask(mask, true, true)` on the object if synchronized, then the server re-broadcasts to the other clients.
---@param connection Connection
function VehicleSetLightEvent:run(connection) end
