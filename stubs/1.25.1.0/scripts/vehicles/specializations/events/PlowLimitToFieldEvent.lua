---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/PlowLimitToFieldEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `PlowLimitToFieldEvent` (extends `Event`) that replicates the limit-plowing-to-field option of a plow. It carries the vehicle and a boolean. It belongs to the vehicle specialization events and defines nothing else.
---@class PlowLimitToFieldEvent : Event
PlowLimitToFieldEvent = {}

--- Creates an empty `PlowLimitToFieldEvent` instance without data, used when the event is read from a network stream.
---@return table
function PlowLimitToFieldEvent.emptyNew() end

--- Creates the event with its data: the vehicle and a boolean.
---@param object table
---@param plowLimitToField boolean
function PlowLimitToFieldEvent.new(object, plowLimitToField) end

--- Reads the event data from the network stream (the vehicle and a boolean), then calls `run`.
---@param streamId integer
---@param connection Connection
function PlowLimitToFieldEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and a boolean).
---@param streamId integer
---@param connection Connection
function PlowLimitToFieldEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setPlowLimitToField(value, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function PlowLimitToFieldEvent:run(connection) end
