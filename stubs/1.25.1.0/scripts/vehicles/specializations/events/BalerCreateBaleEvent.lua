---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/BalerCreateBaleEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `BalerCreateBaleEvent` (extends `Event`) that tells clients that a baler created a bale. It carries the vehicle, the bale time (float32), the bale fill type, and optionally the network id of the bale object. It belongs to the vehicle specialization events and defines nothing else.
---@class BalerCreateBaleEvent : Event
BalerCreateBaleEvent = {}

--- Creates an empty `BalerCreateBaleEvent` instance without data, used when the event is read from a network stream.
---@return table
function BalerCreateBaleEvent.emptyNew() end

--- Creates the event with its data: the vehicle, the bale time (float32), the bale fill type, and optionally the network id of the bale object.
---@param object table
---@param baleFillType integer
---@param baleTime number
---@param baleServerId any
function BalerCreateBaleEvent.new(object, baleFillType, baleTime, baleServerId) end

--- Reads the event data from the network stream (the vehicle, the bale time (float32), the bale fill type, and optionally the network id of the bale object), then calls `run`.
---@param streamId integer
---@param connection Connection
function BalerCreateBaleEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle, the bale time (float32), the bale fill type, and optionally the network id of the bale object).
---@param streamId integer
---@param connection Connection
function BalerCreateBaleEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `createBale(fillType, nil, baleServerId)`, then sets the time of the last entry of `spec_baler.bales` (no rebroadcast in `run`).
---@param connection Connection
function BalerCreateBaleEvent:run(connection) end
