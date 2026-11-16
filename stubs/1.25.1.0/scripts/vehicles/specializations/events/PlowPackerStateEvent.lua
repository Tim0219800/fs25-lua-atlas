---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/PlowPackerStateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `PlowPackerStateEvent` (extends `Event`) that replicates the packer state of a plow. It carries the vehicle, a boolean state and an update-animations flag. It belongs to the vehicle specialization events and defines nothing else.
---@class PlowPackerStateEvent : Event
PlowPackerStateEvent = {}

--- Creates an empty `PlowPackerStateEvent` instance without data, used when the event is read from a network stream.
---@return table
function PlowPackerStateEvent.emptyNew() end

--- Creates the event with its data: the vehicle, a boolean state and an update-animations flag.
---@param object table
---@param state boolean
---@param updateAnimations boolean
function PlowPackerStateEvent.new(object, state, updateAnimations) end

--- Reads the event data from the network stream (the vehicle, a boolean state and an update-animations flag), then calls `run`.
---@param streamId integer
---@param connection Connection
function PlowPackerStateEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle, a boolean state and an update-animations flag).
---@param streamId integer
---@param connection Connection
function PlowPackerStateEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setPackerState(state, updateAnimations, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function PlowPackerStateEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param object table
---@param state boolean
---@param updateAnimations boolean
---@param noEventSend boolean
function PlowPackerStateEvent.sendEvent(object, state, updateAnimations, noEventSend) end
