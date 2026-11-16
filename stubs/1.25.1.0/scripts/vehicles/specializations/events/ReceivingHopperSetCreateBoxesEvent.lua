---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/ReceivingHopperSetCreateBoxesEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `ReceivingHopperSetCreateBoxesEvent` (extends `Event`) that replicates whether a receiving hopper creates boxes. It carries the vehicle and a boolean. It belongs to the vehicle specialization events and defines nothing else.
---@class ReceivingHopperSetCreateBoxesEvent : Event
ReceivingHopperSetCreateBoxesEvent = {}

--- Creates an empty `ReceivingHopperSetCreateBoxesEvent` instance without data, used when the event is read from a network stream.
---@return table
function ReceivingHopperSetCreateBoxesEvent.emptyNew() end

--- Creates the event with its data: the vehicle and a boolean.
---@param object table
---@param state boolean
function ReceivingHopperSetCreateBoxesEvent.new(object, state) end

--- Reads the event data from the network stream (the vehicle and a boolean), then calls `run`.
---@param streamId integer
---@param connection Connection
function ReceivingHopperSetCreateBoxesEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and a boolean).
---@param streamId integer
---@param connection Connection
function ReceivingHopperSetCreateBoxesEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setCreateBoxes(state, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function ReceivingHopperSetCreateBoxesEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param vehicle table
---@param state boolean
---@param noEventSend boolean
function ReceivingHopperSetCreateBoxesEvent.sendEvent(vehicle, state, noEventSend) end
