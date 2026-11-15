---@meta
-- FS25 1.25.1.0 : player/events/PlayerTeleportEvent.lua (stub généré, atlas Lua FS25)

---@class PlayerTeleportEvent : Event
PlayerTeleportEvent = {}

---@return table
function PlayerTeleportEvent.emptyNew() end

---@param x number
---@param y number
---@param z number
---@param isAbsolute boolean
---@param isRootNode boolean
---@return table
function PlayerTeleportEvent.new(x, y, z, isAbsolute, isRootNode) end

---@param exitVehicle table
---@return table
function PlayerTeleportEvent.newExitVehicle(exitVehicle) end

---@param streamId integer
---@param connection table
function PlayerTeleportEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection table
function PlayerTeleportEvent:writeStream(streamId, connection) end

---@param connection table
function PlayerTeleportEvent:run(connection) end
