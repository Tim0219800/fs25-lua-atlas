---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AIAutomaticSteeringStateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that switches the automatic steering of a vehicle on or off, optionally with the segment index and side to start on. Clients send it to the server, which applies it and rebroadcasts. Use `sendEvent` to emit it.
---@class AIAutomaticSteeringStateEvent : Event
AIAutomaticSteeringStateEvent = {}

--- Creates an empty event instance with the class metatable; used by the network layer before `readStream` fills it.
---@return table
function AIAutomaticSteeringStateEvent.emptyNew() end

--- Creates the event with vehicle, on/off state, and optional segment index and side.
---@param vehicle table
---@param state integer
---@param segmentIndex any
---@param segmentIsLeft any
function AIAutomaticSteeringStateEvent.new(vehicle, state, segmentIndex, segmentIsLeft) end

--- Reads the vehicle, the state flag and an optional segment (UInt16 index plus left flag), then calls `run`.
---@param streamId integer
---@param connection Connection
function AIAutomaticSteeringStateEvent:readStream(streamId, connection) end

--- Writes vehicle, state and, if the segment index is set and above 0, the index and left flag.
---@param streamId integer
---@param connection Connection
function AIAutomaticSteeringStateEvent:writeStream(streamId, connection) end

--- Applies `setAIAutomaticSteeringEnabled` on a synchronized vehicle (which may return the effective segment), and when received on the server rebroadcasts a new event to clients.
---@param connection Connection
function AIAutomaticSteeringStateEvent:run(connection) end

--- Sends the event unless `noEventSend` is true: the server broadcasts it, a client sends it to the server.
---@param vehicle table
---@param state integer
---@param segmentIndex boolean
---@param segmentIsLeft any
---@param noEventSend boolean
function AIAutomaticSteeringStateEvent.sendEvent(vehicle, state, segmentIndex, segmentIsLeft, noEventSend) end
