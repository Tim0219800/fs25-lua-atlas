---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetFillUnitIsFillingEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `SetFillUnitIsFillingEvent` (extends `Event`) that replicates whether a fill unit is being filled. It carries the vehicle and an isFilling boolean. It belongs to the vehicle specialization events and defines nothing else.
---@class SetFillUnitIsFillingEvent : Event
SetFillUnitIsFillingEvent = {}

--- Creates an empty `SetFillUnitIsFillingEvent` instance without data, used when the event is read from a network stream.
---@return table
function SetFillUnitIsFillingEvent.emptyNew() end

--- Creates the event with its data: the vehicle and an isFilling boolean.
---@param vehicle table
---@param isFilling boolean
function SetFillUnitIsFillingEvent.new(vehicle, isFilling) end

--- Reads the event data from the network stream (the vehicle and an isFilling boolean), then calls `run`.
---@param streamId integer
---@param connection Connection
function SetFillUnitIsFillingEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and an isFilling boolean).
---@param streamId integer
---@param connection Connection
function SetFillUnitIsFillingEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setFillUnitIsFilling(isFilling, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function SetFillUnitIsFillingEvent:run(connection) end
