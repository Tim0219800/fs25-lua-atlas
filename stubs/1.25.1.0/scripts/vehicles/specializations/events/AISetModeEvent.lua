---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AISetModeEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronises the selected AI mode of a vehicle (1-based index, sent as index minus 1 on `AIModeSelection.NUM_BITS` bits). Clients send it to the server, which applies it and relays it to the others. Use `sendEvent` to emit it.
---@class AISetModeEvent : Event
AISetModeEvent = {}

--- Creates an empty event instance with the class metatable; used by the network layer before `readStream` fills it.
---@return table
function AISetModeEvent.emptyNew() end

--- Creates the event for a vehicle with the AI mode index to select.
---@param vehicle table
---@param aiMode integer
function AISetModeEvent.new(vehicle, aiMode) end

--- Reads the vehicle and the mode as an unsigned integer of `AIModeSelection.NUM_BITS` bits, adding 1, then calls `run`.
---@param streamId integer
---@param connection Connection
function AISetModeEvent:readStream(streamId, connection) end

--- Writes the vehicle and the mode minus 1 in `AIModeSelection.NUM_BITS` bits (modes are 1-based).
---@param streamId integer
---@param connection Connection
function AISetModeEvent:writeStream(streamId, connection) end

--- Calls `setAIModeSelection(mode, true)` on a synchronized vehicle; on the server it rebroadcasts to the other clients, excluding the sender.
---@param connection Connection
function AISetModeEvent:run(connection) end

--- Sends the event unless `noEventSend` is true: the server broadcasts it, a client sends it to the server.
---@param vehicle table
---@param aiMode integer
---@param noEventSend boolean
function AISetModeEvent.sendEvent(vehicle, aiMode, noEventSend) end
