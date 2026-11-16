---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetPipeDischargeToGroundEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes the 'discharge to ground' flag of a pipe (e.g. combine unloading pipe) between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class SetPipeDischargeToGroundEvent : Event
SetPipeDischargeToGroundEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function SetPipeDischargeToGroundEvent.emptyNew() end

--- Builds the event with the data to send (a node object and a boolean discharge state); stored on the instance for `writeStream`.
---@param object table
---@param dischargeState boolean
function SetPipeDischargeToGroundEvent.new(object, dischargeState) end

--- Reads a node object and a boolean discharge state from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function SetPipeDischargeToGroundEvent:readStream(streamId, connection) end

--- Writes a node object and a boolean discharge state to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function SetPipeDischargeToGroundEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: calls `setPipeDischargeToGround(state, true)` on the object if it is synchronized, then the server re-broadcasts to the other clients.
---@param connection Connection
function SetPipeDischargeToGroundEvent:run(connection) end

--- Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true.
---@param object table
---@param dischargeState boolean
---@param noEventSend boolean
function SetPipeDischargeToGroundEvent.sendEvent(object, dischargeState, noEventSend) end
