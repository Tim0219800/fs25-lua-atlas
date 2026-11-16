---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/RidgeMarkerSetStateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `RidgeMarkerSetStateEvent` (extends `Event`) that replicates the ridge marker state. It carries the vehicle and a state (`RidgeMarker.SEND_NUM_BITS` bits; the constructor asserts it is below `RidgeMarker.MAX_NUM_RIDGEMARKERS`). It belongs to the vehicle specialization events and defines nothing else.
---@class RidgeMarkerSetStateEvent : Event
RidgeMarkerSetStateEvent = {}

--- Creates an empty `RidgeMarkerSetStateEvent` instance without data, used when the event is read from a network stream.
---@return table
function RidgeMarkerSetStateEvent.emptyNew() end

--- Creates the event with its data: the vehicle and a state (`RidgeMarker.SEND_NUM_BITS` bits; the constructor asserts it is below `RidgeMarker.MAX_NUM_RIDGEMARKERS`).
---@param vehicle table
---@param state integer
function RidgeMarkerSetStateEvent.new(vehicle, state) end

--- Reads the event data from the network stream (the vehicle and a state (`RidgeMarker.SEND_NUM_BITS` bits; the constructor asserts it is below `RidgeMarker.MAX_NUM_RIDGEMARKERS`)), then calls `run`.
---@param streamId integer
---@param connection Connection
function RidgeMarkerSetStateEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and a state (`RidgeMarker.SEND_NUM_BITS` bits; the constructor asserts it is below `RidgeMarker.MAX_NUM_RIDGEMARKERS`)).
---@param streamId integer
---@param connection Connection
function RidgeMarkerSetStateEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setRidgeMarkerState(state, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function RidgeMarkerSetStateEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param vehicle table
---@param state integer
---@param noEventSend boolean
function RidgeMarkerSetStateEvent.sendEvent(vehicle, state, noEventSend) end
