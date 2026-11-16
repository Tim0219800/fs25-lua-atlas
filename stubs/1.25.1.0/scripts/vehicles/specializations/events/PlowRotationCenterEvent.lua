---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/PlowRotationCenterEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `PlowRotationCenterEvent` (extends `Event`) that replicates the plow rotation going to its centre position. It carries only the vehicle. It belongs to the vehicle specialization events and defines nothing else.
---@class PlowRotationCenterEvent : Event
PlowRotationCenterEvent = {}

--- Creates an empty `PlowRotationCenterEvent` instance without data, used when the event is read from a network stream.
---@return table
function PlowRotationCenterEvent.emptyNew() end

--- Creates the event with its data: only the vehicle.
---@param object table
function PlowRotationCenterEvent.new(object) end

--- Reads the event data from the network stream (only the vehicle), then calls `run`.
---@param streamId integer
---@param connection Connection
function PlowRotationCenterEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (only the vehicle).
---@param streamId integer
---@param connection Connection
function PlowRotationCenterEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setRotationCenter(true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function PlowRotationCenterEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param object table
---@param noEventSend boolean
function PlowRotationCenterEvent.sendEvent(object, noEventSend) end
