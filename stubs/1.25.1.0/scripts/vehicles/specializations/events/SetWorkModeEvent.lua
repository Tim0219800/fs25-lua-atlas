---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetWorkModeEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes the selected work mode of a vehicle between server and clients. The mode index uses WorkMode.WORKMODE_SEND_NUM_BITS bits. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class SetWorkModeEvent : Event
SetWorkModeEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function SetWorkModeEvent.emptyNew() end

--- Builds the event with the data to send (a node object and a work mode index (WorkMode.WORKMODE_SEND_NUM_BITS bits)); stored on the instance for `writeStream`.
---@param vehicle table
---@param state integer
function SetWorkModeEvent.new(vehicle, state) end

--- Reads a node object and a work mode index (WorkMode.WORKMODE_SEND_NUM_BITS bits) from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function SetWorkModeEvent:readStream(streamId, connection) end

--- Writes a node object and a work mode index (WorkMode.WORKMODE_SEND_NUM_BITS bits) to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function SetWorkModeEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: calls `setWorkMode(state, true)` on the vehicle if synchronized, then the server re-broadcasts. Note: the re-broadcast passes `self.object`, which is never set on this event (it uses `self.vehicle`), so that argument is nil.
---@param connection Connection
function SetWorkModeEvent:run(connection) end

--- Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true.
---@param vehicle table
---@param state integer
---@param noEventSend boolean
function SetWorkModeEvent.sendEvent(vehicle, state, noEventSend) end
