---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/InlineWrapperPushOffEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `InlineWrapperPushOffEvent` (extends `Event`) that is a client request to push the bale off an inline wrapper. It carries the wrapper vehicle, written only when the stream goes to the server. It belongs to the vehicle specialization events and defines nothing else.
---@class InlineWrapperPushOffEvent : Event
InlineWrapperPushOffEvent = {}

--- Creates an empty `InlineWrapperPushOffEvent` instance without data, used when the event is read from a network stream.
---@return table
function InlineWrapperPushOffEvent.emptyNew() end

--- Creates the event with its data: the wrapper vehicle, written only when the stream goes to the server.
---@param inlineWrapper table
---@return table
function InlineWrapperPushOffEvent.new(inlineWrapper) end

--- Reads the event data from the network stream (the wrapper vehicle, written only when the stream goes to the server), then calls `run`.
---@param streamId integer
---@param connection Connection
function InlineWrapperPushOffEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the wrapper vehicle, written only when the stream goes to the server).
---@param streamId integer
---@param connection Connection
function InlineWrapperPushOffEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: on the server only, calls `pushOffInlineBale()` on the wrapper.
---@param connection Connection
function InlineWrapperPushOffEvent:run(connection) end
