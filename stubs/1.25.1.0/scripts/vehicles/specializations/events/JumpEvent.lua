---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/JumpEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `JumpEvent` (extends `Event`) that is a client request to make a vehicle jump. It carries the vehicle, written only when the stream goes to the server. It belongs to the vehicle specialization events and defines nothing else.
---@class JumpEvent : Event
JumpEvent = {}

--- Creates an empty `JumpEvent` instance without data, used when the event is read from a network stream.
---@return table
function JumpEvent.emptyNew() end

--- Creates the event with its data: the vehicle, written only when the stream goes to the server.
---@param object table
function JumpEvent.new(object) end

--- Reads the event data from the network stream (the vehicle, written only when the stream goes to the server), then calls `run`.
---@param streamId integer
---@param connection Connection
function JumpEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle, written only when the stream goes to the server).
---@param streamId integer
---@param connection Connection
function JumpEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `jump(true)` on the vehicle once synchronized; there is no client/server check in `run`.
---@param connection Connection
function JumpEvent:run(connection) end
