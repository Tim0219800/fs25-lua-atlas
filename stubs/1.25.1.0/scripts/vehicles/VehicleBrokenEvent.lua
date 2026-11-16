---@meta
-- FS25 1.25.1.0 : vehicles/VehicleBrokenEvent.lua (generated stub, FS25 Lua Atlas)

--- Minimal network event that marks a vehicle as broken on the receiving side. It only carries the vehicle object and calls `setBroken` on it.
---@class VehicleBrokenEvent : Event
VehicleBrokenEvent = {}

--- Creates an empty event instance for stream deserialization.
---@return table
function VehicleBrokenEvent.emptyNew() end

--- Builds the event for the given vehicle object (stored in `self.object`).
---@param object table
---@return table
function VehicleBrokenEvent.new(object) end

--- Reads the vehicle node object from the stream and calls `run`.
---@param streamId integer
---@param connection Connection
function VehicleBrokenEvent:readStream(streamId, connection) end

--- Writes the vehicle node object to the stream.
---@param streamId integer
---@param connection Connection
function VehicleBrokenEvent:writeStream(streamId, connection) end

--- If the object exists and is synchronized, calls its `setBroken()`. Does not rebroadcast.
---@param connection Connection
function VehicleBrokenEvent:run(connection) end
