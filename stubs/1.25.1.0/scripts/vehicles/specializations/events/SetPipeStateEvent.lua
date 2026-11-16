---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetPipeStateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes the open/close state index of a vehicle pipe between server and clients. The state is sent on 3 bits (values 0 to 7). Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class SetPipeStateEvent : Event
SetPipeStateEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function SetPipeStateEvent.emptyNew() end

--- Builds the event with the data to send (a node object and a pipe state on 3 bits); stored on the instance for `writeStream`.
---@param object table
---@param pipeState integer
function SetPipeStateEvent.new(object, pipeState) end

--- Reads a node object and a pipe state on 3 bits from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function SetPipeStateEvent:readStream(streamId, connection) end

--- Writes a node object and a pipe state on 3 bits to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function SetPipeStateEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: calls `setPipeState(state, true)` on the object if synchronized, then the server re-broadcasts to the other clients.
---@param connection Connection
function SetPipeStateEvent:run(connection) end
