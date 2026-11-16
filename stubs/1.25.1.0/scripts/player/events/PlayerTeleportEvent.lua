---@meta
-- FS25 1.25.1.0 : player/events/PlayerTeleportEvent.lua (generated stub, FS25 Lua Atlas)

--- Client-to-server event ordering a player teleportation, either to world coordinates or to the exit point of a vehicle. It is processed only on the server, which looks up the player of the sending connection, and uses the main network channel.
---@class PlayerTeleportEvent : Event
PlayerTeleportEvent = {}

--- Creates an empty event on the main network channel for stream reading.
---@return table
function PlayerTeleportEvent.emptyNew() end

--- Builds a coordinate teleport event with x, y, z and two flags, `isAbsolute` and `isRootNode`, which are serialized.
---@param x number
---@param y number
---@param z number
---@param isAbsolute boolean
---@param isRootNode boolean
---@return table
function PlayerTeleportEvent.new(x, y, z, isAbsolute, isRootNode) end

--- Builds a teleport event that places the player at the exit point of the given vehicle.
---@param exitVehicle table
---@return table
function PlayerTeleportEvent.newExitVehicle(exitVehicle) end

--- Reads a boolean: if true, a vehicle node object; otherwise three floats and the two flags. Then runs the event.
---@param streamId integer
---@param connection table
function PlayerTeleportEvent:readStream(streamId, connection) end

--- Writes a boolean telling whether an exit vehicle is set, then either the vehicle node object or the x, y, z floats and the two flags.
---@param streamId integer
---@param connection table
function PlayerTeleportEvent:writeStream(streamId, connection) end

--- Ignored on clients. On the server, finds the player for the connection and calls `teleportToExitPoint` for a vehicle, or `teleportTo(x, y, z, true, true)` for coordinates; the stored `isAbsolute` and `isRootNode` are not used here.
---@param connection table
function PlayerTeleportEvent:run(connection) end
