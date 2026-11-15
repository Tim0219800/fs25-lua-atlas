---@meta
-- FS25 1.25.1.0 : player/networking/PlayerPositionalInterpolator.lua (generated stub, FS25 Lua Atlas)

---@class PlayerPositionalInterpolator
PlayerPositionalInterpolator = {}

---@param player Player
---@param targetNodeType integer
---@return PlayerPositionalInterpolator
function PlayerPositionalInterpolator.new(player, targetNodeType) end

---@param dt number
function PlayerPositionalInterpolator:update(dt) end

---@param dt number
function PlayerPositionalInterpolator:updateTick(dt) end

---@param targetPositionX number
---@param targetPositionY number
---@param targetPositionZ number
function PlayerPositionalInterpolator:setTargetPosition(targetPositionX, targetPositionY, targetPositionZ) end

---@return number
---@return number
---@return number
function PlayerPositionalInterpolator:getInterpolatedPosition() end

---@param targetYaw number
function PlayerPositionalInterpolator:setTargetYaw(targetYaw) end
