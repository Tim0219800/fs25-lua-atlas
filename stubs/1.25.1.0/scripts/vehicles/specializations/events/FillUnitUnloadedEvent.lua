---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/FillUnitUnloadedEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `FillUnitUnloadedEvent` (extends `Event`) that is the server result of a fill unit unload, carrying either a created pallet position or a warning/result. It carries the vehicle plus either a pallet with compressed world position and Euler angles, or a show-warning flag and a 2-bit result (0 nil, 1 false, 2 true). It belongs to the vehicle specialization events and defines nothing else.
---@class FillUnitUnloadedEvent : Event
FillUnitUnloadedEvent = {}

--- Creates an empty `FillUnitUnloadedEvent` instance without data, used when the event is read from a network stream.
---@return table
function FillUnitUnloadedEvent.emptyNew() end

--- Creates the event with its data: the vehicle plus either a pallet with compressed world position and Euler angles, or a show-warning flag and a 2-bit result (0 nil, 1 false, 2 true).
---@param object table
---@param pallet any
---@param showWarning any
---@param result any
function FillUnitUnloadedEvent.new(object, pallet, showWarning, result) end

--- Reads the event data from the network stream (the vehicle plus either a pallet with compressed world position and Euler angles, or a show-warning flag and a 2-bit result (0 nil, 1 false, 2 true)), then calls `run`.
---@param streamId integer
---@param connection Connection
function FillUnitUnloadedEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle plus either a pallet with compressed world position and Euler angles, or a show-warning flag and a 2-bit result (0 nil, 1 false, 2 true)).
---@param streamId integer
---@param connection Connection
function FillUnitUnloadedEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: with a pallet, unmounts it if needed, places it with `setWorldPositionQuaternion` and raises `onFillUnitUnloadPallet`; otherwise may show a no-space notification and raises `onFillUnitUnloaded` with the result.
---@param connection Connection
function FillUnitUnloadedEvent:run(connection) end
