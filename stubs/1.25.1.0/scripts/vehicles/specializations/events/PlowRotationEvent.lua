---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/PlowRotationEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `PlowRotationEvent` (extends `Event`) that replicates the target side of the plow rotation. It carries the vehicle and a rotationMax boolean. It belongs to the vehicle specialization events and defines nothing else.
---@class PlowRotationEvent : Event
PlowRotationEvent = {}

--- Creates an empty `PlowRotationEvent` instance without data, used when the event is read from a network stream.
---@return table
function PlowRotationEvent.emptyNew() end

--- Creates the event with its data: the vehicle and a rotationMax boolean.
---@param object table
---@param rotationMax boolean
function PlowRotationEvent.new(object, rotationMax) end

--- Reads the event data from the network stream (the vehicle and a rotationMax boolean), then calls `run`.
---@param streamId integer
---@param connection Connection
function PlowRotationEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and a rotationMax boolean).
---@param streamId integer
---@param connection Connection
function PlowRotationEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setRotationMax(rotationMax, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function PlowRotationEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param object table
---@param rotationMax boolean
---@param noEventSend boolean
function PlowRotationEvent.sendEvent(object, rotationMax, noEventSend) end
