---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AIFieldWorkerStateEvent.lua (generated stub, FS25 Lua Atlas)

--- Server-to-client event that mirrors the field worker (AI field work) state of a vehicle on clients by calling `startFieldWorker` or `stopFieldWorker`. Writing it from a client triggers an assertion.
---@class AIFieldWorkerStateEvent : Event
AIFieldWorkerStateEvent = {}

--- Creates an empty event instance with the class metatable; used by the network layer before `readStream` fills it.
---@return table
function AIFieldWorkerStateEvent.emptyNew() end

--- Creates the event for a vehicle with the field worker active flag.
---@param vehicle table
---@param isActive boolean
function AIFieldWorkerStateEvent.new(vehicle, isActive) end

--- Reads the vehicle and the active flag, then calls `run`.
---@param streamId integer
---@param connection Connection
function AIFieldWorkerStateEvent:readStream(streamId, connection) end

--- Writes vehicle and flag. Asserts that it is only written on the server side (server to client event).
---@param streamId integer
---@param connection Connection
function AIFieldWorkerStateEvent:writeStream(streamId, connection) end

--- On a synchronized vehicle, calls `startFieldWorker` or `stopFieldWorker` depending on the flag.
---@param connection Connection
function AIFieldWorkerStateEvent:run(connection) end
