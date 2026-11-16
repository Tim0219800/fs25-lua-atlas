---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/FillUnitUnloadEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `FillUnitUnloadEvent` (extends `Event`) that is a client request to unload the fill units of a vehicle. It carries the vehicle, written only when the stream goes to the server. It belongs to the vehicle specialization events and defines nothing else.
---@class FillUnitUnloadEvent : Event
FillUnitUnloadEvent = {}

--- Creates an empty `FillUnitUnloadEvent` instance without data, used when the event is read from a network stream.
---@return table
function FillUnitUnloadEvent.emptyNew() end

--- Creates the event with its data: the vehicle, written only when the stream goes to the server.
---@param object table
function FillUnitUnloadEvent.new(object) end

--- Creates the event instance meant to go from the server to clients; it carries no vehicle data.
function FillUnitUnloadEvent.newServerToClient() end

--- Reads the event data from the network stream (the vehicle, written only when the stream goes to the server), then calls `run`.
---@param streamId integer
---@param connection Connection
function FillUnitUnloadEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle, written only when the stream goes to the server).
---@param streamId integer
---@param connection Connection
function FillUnitUnloadEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: on the server only, calls `unloadFillUnits(true)` on the vehicle.
---@param connection Connection
function FillUnitUnloadEvent:run(connection) end
