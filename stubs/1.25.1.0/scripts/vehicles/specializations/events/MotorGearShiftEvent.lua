---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/MotorGearShiftEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `MotorGearShiftEvent` (extends `Event`) that is a request to change gear, group or direction on a motorized vehicle. It carries the vehicle, a shift type (4 bits) and, for gear or group selection only, a value (5 bits). It belongs to the vehicle specialization events and defines nothing else.
---@class MotorGearShiftEvent : Event
MotorGearShiftEvent = {}

--- Creates an empty `MotorGearShiftEvent` instance without data, used when the event is read from a network stream.
---@return table
function MotorGearShiftEvent.emptyNew() end

--- Creates the event with its data: the vehicle, a shift type (4 bits) and, for gear or group selection only, a value (5 bits).
---@param vehicle table
---@param shiftType boolean
---@param shiftValue any
function MotorGearShiftEvent.new(vehicle, shiftType, shiftValue) end

--- Reads the event data from the network stream (the vehicle, a shift type (4 bits) and, for gear or group selection only, a value (5 bits)), then calls `run`.
---@param streamId integer
---@param connection Connection
function MotorGearShiftEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle, a shift type (4 bits) and, for gear or group selection only, a value (5 bits)).
---@param streamId integer
---@param connection Connection
function MotorGearShiftEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: dispatches on the shift type to `shiftGear`, `selectGear`, `shiftGroup`, `selectGroup` or `changeDirection` of `spec_motorized.motor`.
---@param connection Connection
function MotorGearShiftEvent:run(connection) end

--- Helper that sends a new gear-shift event to the server connection when `g_client` exists.
---@param vehicle table
---@param shiftType integer
---@param shiftValue integer?
function MotorGearShiftEvent.sendToServer(vehicle, shiftType, shiftValue) end
