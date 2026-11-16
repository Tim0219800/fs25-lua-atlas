---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/PalletFillerStateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `PalletFillerStateEvent` (extends `Event`) that replicates the state of a pallet filler. It carries the vehicle and a state serialized through `PalletFillerState`. It belongs to the vehicle specialization events and defines nothing else.
---@class PalletFillerStateEvent : Event
PalletFillerStateEvent = {}

--- Creates an empty `PalletFillerStateEvent` instance without data, used when the event is read from a network stream.
---@return table
function PalletFillerStateEvent.emptyNew() end

--- Creates the event with its data: the vehicle and a state serialized through `PalletFillerState`.
---@param object table
---@param state table
---@return table
function PalletFillerStateEvent.new(object, state) end

--- Reads the event data from the network stream (the vehicle and a state serialized through `PalletFillerState`), then calls `run`.
---@param streamId integer
---@param connection Connection
function PalletFillerStateEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and a state serialized through `PalletFillerState`).
---@param streamId integer
---@param connection Connection
function PalletFillerStateEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setPalletFillerState(state, false, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function PalletFillerStateEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param vehicle table
---@param state integer
---@param noEventSend boolean
function PalletFillerStateEvent.sendEvent(vehicle, state, noEventSend) end
