---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/CraneShovelEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `CraneShovelEvent` (extends `Event`) that replicates the state of a crane shovel. It carries the vehicle and a boolean state. It belongs to the vehicle specialization events and defines nothing else.
---@class CraneShovelEvent : Event
CraneShovelEvent = {}

--- Creates an empty `CraneShovelEvent` instance without data, used when the event is read from a network stream.
---@return table
function CraneShovelEvent.emptyNew() end

--- Creates the event with its data: the vehicle and a boolean state.
---@param object table
---@param state any
function CraneShovelEvent.new(object, state) end

--- Reads the event data from the network stream (the vehicle and a boolean state), then calls `run`.
---@param streamId integer
---@param connection Connection
function CraneShovelEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and a boolean state).
---@param streamId integer
---@param connection Connection
function CraneShovelEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setCraneShovelState(state, nil, true)` on the vehicle (no rebroadcast in `run`).
---@param connection Connection
function CraneShovelEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param object table
---@param state boolean
---@param noEventSend boolean
function CraneShovelEvent.sendEvent(object, state, noEventSend) end
