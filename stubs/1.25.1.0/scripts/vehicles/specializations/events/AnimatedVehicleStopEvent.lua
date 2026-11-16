---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AnimatedVehicleStopEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `AnimatedVehicleStopEvent` (extends `Event`) that replicates the stop of a named animation on a vehicle. It carries the vehicle and the animation name. It belongs to the vehicle specialization events and defines nothing else.
---@class AnimatedVehicleStopEvent : Event
AnimatedVehicleStopEvent = {}

--- Creates an empty `AnimatedVehicleStopEvent` instance without data, used when the event is read from a network stream.
---@return table
function AnimatedVehicleStopEvent.emptyNew() end

--- Creates the event with its data: the vehicle and the animation name.
---@param object table
---@param name string
function AnimatedVehicleStopEvent.new(object, name) end

--- Reads the event data from the network stream (the vehicle and the animation name), then calls `run`.
---@param streamId integer
---@param connection Connection
function AnimatedVehicleStopEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and the animation name).
---@param streamId integer
---@param connection Connection
function AnimatedVehicleStopEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `stopAnimation(name, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function AnimatedVehicleStopEvent:run(connection) end
