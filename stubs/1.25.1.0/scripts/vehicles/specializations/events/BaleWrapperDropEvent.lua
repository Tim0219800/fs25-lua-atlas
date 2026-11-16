---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/BaleWrapperDropEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `BaleWrapperDropEvent` (extends `Event`) that replicates the dropping of a wrapped bale. It carries the vehicle and a drop animation index (4 bits). It belongs to the vehicle specialization events and defines nothing else.
---@class BaleWrapperDropEvent : Event
BaleWrapperDropEvent = {}

--- Creates an empty `BaleWrapperDropEvent` instance without data, used when the event is read from a network stream.
---@return table
function BaleWrapperDropEvent.emptyNew() end

--- Creates the event with its data: the vehicle and a drop animation index (4 bits).
---@param object table
---@param dropAnimationIndex integer
---@return BaleWrapperDropEvent
function BaleWrapperDropEvent.new(object, dropAnimationIndex) end

--- Reads the event data from the network stream (the vehicle and a drop animation index (4 bits)), then calls `run`.
---@param streamId integer
---@param connection Connection
function BaleWrapperDropEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and a drop animation index (4 bits)).
---@param streamId integer
---@param connection Connection
function BaleWrapperDropEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: sets the drop animation with `setBaleWrapperDropAnimation`, then calls `doStateChange(BaleWrapper.CHANGE_WRAPPER_START_DROP_BALE)`. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function BaleWrapperDropEvent:run(connection) end
