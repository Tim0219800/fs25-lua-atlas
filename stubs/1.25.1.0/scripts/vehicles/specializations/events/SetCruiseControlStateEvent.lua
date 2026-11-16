---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetCruiseControlStateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `SetCruiseControlStateEvent` (extends `Event`) that replicates the cruise control state. It carries the vehicle and a state (2 bits). It belongs to the vehicle specialization events and defines nothing else.
---@class SetCruiseControlStateEvent : Event
SetCruiseControlStateEvent = {}

--- Creates an empty `SetCruiseControlStateEvent` instance without data, used when the event is read from a network stream.
---@return table
function SetCruiseControlStateEvent.emptyNew() end

--- Creates the event with its data: the vehicle and a state (2 bits).
---@param vehicle table
---@param state integer
function SetCruiseControlStateEvent.new(vehicle, state) end

--- Reads the event data from the network stream (the vehicle and a state (2 bits)), then calls `run`.
---@param streamId integer
---@param connection Connection
function SetCruiseControlStateEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and a state (2 bits)).
---@param streamId integer
---@param connection Connection
function SetCruiseControlStateEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setCruiseControlState(state, true)` on the vehicle (no rebroadcast in `run`).
---@param connection Connection
function SetCruiseControlStateEvent:run(connection) end
