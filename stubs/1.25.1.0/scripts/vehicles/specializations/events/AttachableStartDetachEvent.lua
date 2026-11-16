---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AttachableStartDetachEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `AttachableStartDetachEvent` (extends `Event`) that replicates the start of the detach process of an attachable implement. It carries only the vehicle (the attachable). It belongs to the vehicle specialization events and defines nothing else.
---@class AttachableStartDetachEvent : Event
AttachableStartDetachEvent = {}

--- Creates an empty `AttachableStartDetachEvent` instance without data, used when the event is read from a network stream.
---@return table
function AttachableStartDetachEvent.emptyNew() end

--- Creates the event with its data: only the vehicle (the attachable).
---@param vehicle table
---@param state integer
---@param segmentIndex any
---@param segmentIsLeft any
function AttachableStartDetachEvent.new(vehicle, state, segmentIndex, segmentIsLeft) end

--- Reads the event data from the network stream (only the vehicle (the attachable)), then calls `run`.
---@param streamId integer
---@param connection Connection
function AttachableStartDetachEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (only the vehicle (the attachable)).
---@param streamId integer
---@param connection Connection
function AttachableStartDetachEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `startDetachProcess(true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function AttachableStartDetachEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param vehicle table
---@param noEventSend boolean
function AttachableStartDetachEvent.sendEvent(vehicle, noEventSend) end
