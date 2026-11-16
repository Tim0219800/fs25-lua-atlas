---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AIVehicleIsBlockedEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `AIVehicleIsBlockedEvent` (extends `Event`) that tells clients that an AI-driven vehicle became blocked or free again. It carries the vehicle object and a blocked flag. It belongs to the vehicle specialization events and defines nothing else.
---@class AIVehicleIsBlockedEvent : Event
AIVehicleIsBlockedEvent = {}

--- Creates an empty `AIVehicleIsBlockedEvent` instance without data, used when the event is read from a network stream.
---@return table
function AIVehicleIsBlockedEvent.emptyNew() end

--- Creates the event with its data: the vehicle object and a blocked flag.
---@param object table
---@param isBlocked boolean
function AIVehicleIsBlockedEvent.new(object, isBlocked) end

--- Reads the event data from the network stream (the vehicle object and a blocked flag), then calls `run`.
---@param streamId integer
---@param connection Connection
function AIVehicleIsBlockedEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle object and a blocked flag).
---@param streamId integer
---@param connection Connection
function AIVehicleIsBlockedEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `aiBlock()` or `aiContinue()` on the vehicle once it is synchronized (no rebroadcast in `run`).
---@param connection Connection
function AIVehicleIsBlockedEvent:run(connection) end
