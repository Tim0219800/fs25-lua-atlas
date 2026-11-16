---@meta
-- FS25 1.25.1.0 : vehicles/VehicleTeleportEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event asking the server to teleport a vehicle to a world position and heading. It is sent on the main channel and the handler only acts when the receiving side is the server. The file has no constructor or stream functions in this dump, only the empty constructor and `run`.
---@class VehicleTeleportEvent : Event
VehicleTeleportEvent = {}

--- Creates an empty event instance on the main network channel, used before reading a stream.
---@return table
function VehicleTeleportEvent.emptyNew() end

--- On the server only, if the vehicle exists and is synchronized, calls `g_currentMission:teleportVehicle` with the stored x, z and rotY. Ignored when received by a client.
---@param connection Connection
function VehicleTeleportEvent:run(connection) end
