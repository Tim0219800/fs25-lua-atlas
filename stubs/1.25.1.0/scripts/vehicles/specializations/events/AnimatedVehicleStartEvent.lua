---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AnimatedVehicleStartEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `AnimatedVehicleStartEvent` (extends `Event`) that replicates the start of a named animation on a vehicle. It carries the vehicle, the animation name, the play speed and the start animation time (floats). It belongs to the vehicle specialization events and defines nothing else.
---@class AnimatedVehicleStartEvent : Event
AnimatedVehicleStartEvent = {}

--- Creates an empty `AnimatedVehicleStartEvent` instance without data, used when the event is read from a network stream.
---@return table
function AnimatedVehicleStartEvent.emptyNew() end

--- Creates the event with its data: the vehicle, the animation name, the play speed and the start animation time (floats).
---@param object table
---@param name string
---@param speed number
---@param animTime number
function AnimatedVehicleStartEvent.new(object, name, speed, animTime) end

--- Reads the event data from the network stream (the vehicle, the animation name, the play speed and the start animation time (floats)), then calls `run`.
---@param streamId integer
---@param connection Connection
function AnimatedVehicleStartEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle, the animation name, the play speed and the start animation time (floats)).
---@param streamId integer
---@param connection Connection
function AnimatedVehicleStartEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `playAnimation(name, speed, animTime, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection any
function AnimatedVehicleStartEvent:run(connection) end
