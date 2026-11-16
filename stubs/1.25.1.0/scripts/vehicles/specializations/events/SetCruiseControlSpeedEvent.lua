---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetCruiseControlSpeedEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `SetCruiseControlSpeedEvent` (extends `Event`) that replicates the cruise control target speeds (forward and reverse). It carries the vehicle and two uint8 speeds (forward, reverse). It belongs to the vehicle specialization events and defines nothing else.
---@class SetCruiseControlSpeedEvent : Event
SetCruiseControlSpeedEvent = {}

--- Creates an empty `SetCruiseControlSpeedEvent` instance without data, used when the event is read from a network stream.
---@return table
function SetCruiseControlSpeedEvent.emptyNew() end

--- Creates the event with its data: the vehicle and two uint8 speeds (forward, reverse).
---@param vehicle table
---@param speed number
---@param speedReverse number
function SetCruiseControlSpeedEvent.new(vehicle, speed, speedReverse) end

--- Reads the event data from the network stream (the vehicle and two uint8 speeds (forward, reverse)), then calls `run`.
---@param streamId integer
---@param connection Connection
function SetCruiseControlSpeedEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and two uint8 speeds (forward, reverse)).
---@param streamId integer
---@param connection Connection
function SetCruiseControlSpeedEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setCruiseControlMaxSpeed(speed, speedReverse)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function SetCruiseControlSpeedEvent:run(connection) end
