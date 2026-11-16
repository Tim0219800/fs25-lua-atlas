---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/VariableWorkWidthStateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes which left and right work width sections of a vehicle are active (VariableWorkWidth specialization). Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class VariableWorkWidthStateEvent : Event
VariableWorkWidthStateEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function VariableWorkWidthStateEvent.emptyNew() end

--- Builds the event with the data to send (a node object and two section values (left, right) on VariableWorkWidth.SEND_NUM_BITS bits each); stored on the instance for `writeStream`.
---@param vehicle table
---@param leftSide integer
---@param rightSide integer
function VariableWorkWidthStateEvent.new(vehicle, leftSide, rightSide) end

--- Reads a node object and two section values (left, right) on VariableWorkWidth.SEND_NUM_BITS bits each from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function VariableWorkWidthStateEvent:readStream(streamId, connection) end

--- Writes a node object and two section values (left, right) on VariableWorkWidth.SEND_NUM_BITS bits each to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function VariableWorkWidthStateEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: calls `setSectionsActive(left, right, true)` on the vehicle if synchronized, then the server re-broadcasts. Note: the re-broadcast passes `self.object`, which is never set (the event uses `self.vehicle`), so that argument is nil.
---@param connection Connection
function VariableWorkWidthStateEvent:run(connection) end

--- Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true.
---@param vehicle table
---@param leftSide integer
---@param rightSide integer
---@param noEventSend boolean
function VariableWorkWidthStateEvent.sendEvent(vehicle, leftSide, rightSide, noEventSend) end
