---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/FoldableStepsChangeStateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `FoldableStepsChangeStateEvent` (extends `Event`) that replicates the target state of a stepped foldable implement. It carries the vehicle and a target state (`FoldableSteps.STATE_NUM_BITS` bits). It belongs to the vehicle specialization events and defines nothing else.
---@class FoldableStepsChangeStateEvent : Event
FoldableStepsChangeStateEvent = {}

--- Creates an empty `FoldableStepsChangeStateEvent` instance without data, used when the event is read from a network stream.
---@return table
function FoldableStepsChangeStateEvent.emptyNew() end

--- Creates the event with its data: the vehicle and a target state (`FoldableSteps.STATE_NUM_BITS` bits).
---@param object table
---@param targetState table
---@return table
function FoldableStepsChangeStateEvent.new(object, targetState) end

--- Reads the event data from the network stream (the vehicle and a target state (`FoldableSteps.STATE_NUM_BITS` bits)), then calls `run`.
---@param streamId integer
---@param connection Connection
function FoldableStepsChangeStateEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and a target state (`FoldableSteps.STATE_NUM_BITS` bits)).
---@param streamId integer
---@param connection Connection
function FoldableStepsChangeStateEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setFoldableStepsFoldState(targetState, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function FoldableStepsChangeStateEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param vehicle table
---@param targetState integer
---@param noEventSend boolean
function FoldableStepsChangeStateEvent.sendEvent(vehicle, targetState, noEventSend) end
