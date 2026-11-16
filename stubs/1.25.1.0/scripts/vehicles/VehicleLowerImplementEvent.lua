---@meta
-- FS25 1.25.1.0 : vehicles/VehicleLowerImplementEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event synchronizing the lowering or raising of an implement on a given attacher joint. It carries the vehicle, a signed 8-bit joint index and the move-down flag, and calls `setJointMoveDown`. The server rebroadcasts events received from clients.
---@class VehicleLowerImplementEvent : Event
VehicleLowerImplementEvent = {}

--- Creates an empty event instance for stream deserialization.
---@return table
function VehicleLowerImplementEvent.emptyNew() end

--- Builds the event from vehicle, joint index and `moveDown` (true to lower).
---@param vehicle table
---@param jointIndex integer
---@param moveDown boolean
---@return table
function VehicleLowerImplementEvent.new(vehicle, jointIndex, moveDown) end

--- Reads the vehicle, a signed 8-bit joint index and the move-down flag, then calls `run`.
---@param streamId integer
---@param connection Connection
function VehicleLowerImplementEvent:readStream(streamId, connection) end

--- Writes the vehicle object, the signed 8-bit joint index and the move-down flag.
---@param streamId integer
---@param connection Connection
function VehicleLowerImplementEvent:writeStream(streamId, connection) end

--- If the vehicle is synchronized, calls `setJointMoveDown(jointIndex, moveDown, true)` (no event re-sent). On the server it also rebroadcasts to the other clients.
---@param connection Connection
function VehicleLowerImplementEvent:run(connection) end

--- Static helper: unless `noEventSend` is true, the server broadcasts the event and a client sends it to the server.
---@param vehicle table
---@param jointIndex integer
---@param moveDown boolean
---@param noEventSend boolean
function VehicleLowerImplementEvent.sendEvent(vehicle, jointIndex, moveDown, noEventSend) end
