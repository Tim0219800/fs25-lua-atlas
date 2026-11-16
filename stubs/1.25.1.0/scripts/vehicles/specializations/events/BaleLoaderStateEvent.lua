---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/BaleLoaderStateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `BaleLoaderStateEvent` (extends `Event`) that replicates a state change of a bale loader. It carries the vehicle, an int8 state id and, only for `BaleLoader.CHANGE_GRAB_BALE`, the network id of the nearest bale. It belongs to the vehicle specialization events and defines nothing else.
---@class BaleLoaderStateEvent : Event
BaleLoaderStateEvent = {}

--- Creates an empty `BaleLoaderStateEvent` instance without data, used when the event is read from a network stream.
---@return table
function BaleLoaderStateEvent.emptyNew() end

--- Creates the event with its data: the vehicle, an int8 state id and, only for `BaleLoader.CHANGE_GRAB_BALE`, the network id of the nearest bale.
---@param object table
---@param stateId integer
---@param nearestBaleServerId integer?
---@return BaleLoaderStateEvent
function BaleLoaderStateEvent.new(object, stateId, nearestBaleServerId) end

--- Reads the event data from the network stream (the vehicle, an int8 state id and, only for `BaleLoader.CHANGE_GRAB_BALE`, the network id of the nearest bale), then calls `run`.
---@param streamId integer
---@param connection Connection
function BaleLoaderStateEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle, an int8 state id and, only for `BaleLoader.CHANGE_GRAB_BALE`, the network id of the nearest bale).
---@param streamId integer
---@param connection Connection
function BaleLoaderStateEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `doStateChange(stateId, nearestBaleServerId)` on the vehicle (no rebroadcast in `run`).
---@param connection Connection
function BaleLoaderStateEvent:run(connection) end
