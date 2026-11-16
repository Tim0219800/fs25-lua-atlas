---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/BaleWrapperStateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `BaleWrapperStateEvent` (extends `Event`) that replicates a state change of a bale wrapper. It carries the vehicle, an int8 state id and, only for `BaleWrapper.CHANGE_GRAB_BALE`, the network id of the nearest bale. It belongs to the vehicle specialization events and defines nothing else.
---@class BaleWrapperStateEvent : Event
BaleWrapperStateEvent = {}

--- Creates an empty `BaleWrapperStateEvent` instance without data, used when the event is read from a network stream.
---@return table
function BaleWrapperStateEvent.emptyNew() end

--- Creates the event with its data: the vehicle, an int8 state id and, only for `BaleWrapper.CHANGE_GRAB_BALE`, the network id of the nearest bale.
---@param object table
---@param stateId integer
---@param nearestBaleServerId integer?
---@return BaleWrapperStateEvent
function BaleWrapperStateEvent.new(object, stateId, nearestBaleServerId) end

--- Reads the event data from the network stream (the vehicle, an int8 state id and, only for `BaleWrapper.CHANGE_GRAB_BALE`, the network id of the nearest bale), then calls `run`.
---@param streamId integer
---@param connection Connection
function BaleWrapperStateEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle, an int8 state id and, only for `BaleWrapper.CHANGE_GRAB_BALE`, the network id of the nearest bale).
---@param streamId integer
---@param connection Connection
function BaleWrapperStateEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `doStateChange(stateId, nearestBaleServerId)` on the vehicle (no rebroadcast in `run`).
---@param connection Connection
function BaleWrapperStateEvent:run(connection) end
