---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/MotorClutchCreakingEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `MotorClutchCreakingEvent` (extends `Event`) that tells clients that the clutch is creaking. It carries the vehicle, an isEvent flag, a group-transmission flag and optional gear (6 bits) and group (5 bits) indexes. It belongs to the vehicle specialization events and defines nothing else.
---@class MotorClutchCreakingEvent : Event
MotorClutchCreakingEvent = {}

--- Creates an empty `MotorClutchCreakingEvent` instance without data, used when the event is read from a network stream.
---@return table
function MotorClutchCreakingEvent.emptyNew() end

--- Creates the event with its data: the vehicle, an isEvent flag, a group-transmission flag and optional gear (6 bits) and group (5 bits) indexes.
---@param vehicle table
---@param isEvent boolean
---@param groupTransmission any
---@param gearIndex any
---@param groupIndex any
function MotorClutchCreakingEvent.new(vehicle, isEvent, groupTransmission, gearIndex, groupIndex) end

--- Reads the event data from the network stream (the vehicle, an isEvent flag, a group-transmission flag and optional gear (6 bits) and group (5 bits) indexes), then calls `run`.
---@param streamId integer
---@param connection Connection
function MotorClutchCreakingEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle, an isEvent flag, a group-transmission flag and optional gear (6 bits) and group (5 bits) indexes).
---@param streamId integer
---@param connection Connection
function MotorClutchCreakingEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: raises the vehicle event `onClutchCreaking` with these values (no rebroadcast in `run`).
---@param connection Connection
function MotorClutchCreakingEvent:run(connection) end
