---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/BalerSetBaleTimeEvent.lua (generated stub, FS25 Lua Atlas)

--- Creates an empty `BalerSetBaleTimeEvent` instance without data, used when the event is read from a network stream.
---@return table
function BalerSetBaleTimeEvent.emptyNew() end

--- Creates the event with its data: the vehicle, a bale index (int32) and a time (float32).
---@param object table
---@param bale integer
---@param baleTime number
function BalerSetBaleTimeEvent.new(object, bale, baleTime) end

--- Reads the event data from the network stream (the vehicle, a bale index (int32) and a time (float32)), then calls `run`.
---@param streamId integer
---@param connection Connection
function BalerSetBaleTimeEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle, a bale index (int32) and a time (float32)).
---@param streamId integer
---@param connection Connection
function BalerSetBaleTimeEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setBaleTime(bale, baleTime)` on the vehicle (no rebroadcast in `run`).
---@param connection Connection
function BalerSetBaleTimeEvent:run(connection) end
