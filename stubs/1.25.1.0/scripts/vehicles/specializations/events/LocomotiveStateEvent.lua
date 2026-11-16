---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/LocomotiveStateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `LocomotiveStateEvent` (extends `Event`) that replicates the state of a locomotive. It carries the vehicle and a state (`Locomotive.NUM_BITS_STATE` bits). It belongs to the vehicle specialization events and defines nothing else.
---@class LocomotiveStateEvent : Event
LocomotiveStateEvent = {}

--- Creates an empty `LocomotiveStateEvent` instance without data, used when the event is read from a network stream.
---@return table
function LocomotiveStateEvent.emptyNew() end

--- Creates the event with its data: the vehicle and a state (`Locomotive.NUM_BITS_STATE` bits).
---@param object table
---@param state boolean
function LocomotiveStateEvent.new(object, state) end

--- Reads the event data from the network stream (the vehicle and a state (`Locomotive.NUM_BITS_STATE` bits)), then calls `run`.
---@param streamId integer
---@param connection Connection
function LocomotiveStateEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and a state (`Locomotive.NUM_BITS_STATE` bits)).
---@param streamId integer
---@param connection Connection
function LocomotiveStateEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setLocomotiveState(state, true)` on the vehicle (no rebroadcast in `run`).
---@param connection Connection
function LocomotiveStateEvent:run(connection) end
