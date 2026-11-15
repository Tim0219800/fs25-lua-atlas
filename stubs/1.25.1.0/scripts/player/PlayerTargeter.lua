---@meta
-- FS25 1.25.1.0 : player/PlayerTargeter.lua (generated stub, FS25 Lua Atlas)

---@class PlayerTargeter
PlayerTargeter = {}

---@param player Player
---@return PlayerTargeter
function PlayerTargeter.new(player) end

---@return number
---@return number
---@return number
---@return number
---@return number
---@return number
function PlayerTargeter:getLastLookRay() end

---@param targetKey CollisionFlag
---@return boolean
function PlayerTargeter:getHasTargetedKey(targetKey) end

---@param targetKey any
---@param targetMask CollisionFlag
---@param minDistance number?
---@param maxDistance number
function PlayerTargeter:addTargetType(targetKey, targetMask, minDistance, maxDistance) end

---@param targetKey any
---@param filterFunction function
function PlayerTargeter:addFilterToTargetType(targetKey, filterFunction) end

---@param targetKey any
function PlayerTargeter:removeTargetType(targetKey) end

function PlayerTargeter:recalculateCombinedTargetMask() end

---@param targetKey any
---@return integer?
function PlayerTargeter:getClosestTargetedNodeFromType(targetKey) end

---@param dt number
function PlayerTargeter:update(dt) end

---@param hitNode integer
---@param x number
---@param y number
---@param z number
---@param targetedMask table
---@param distance number
function PlayerTargeter:tryAddTargetWithMask(hitNode, x, y, z, targetedMask, distance) end

---@param x number
---@param y number
---@param textSize number
---@return number
function PlayerTargeter:debugDraw(x, y, textSize) end
