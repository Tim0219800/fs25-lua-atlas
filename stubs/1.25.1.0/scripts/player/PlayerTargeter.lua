---@meta
-- FS25 1.25.1.0 : player/PlayerTargeter.lua (generated stub, FS25 Lua Atlas)

--- Client-side helper owned by the local player that casts a ray from the player's look direction and records the closest hit for each registered target type (a key, a collision mask and a distance range, with optional filter functions). Other player code asks it which node is targeted for a given key. Target tables are recycled through an `ObjectPool`.
---@class PlayerTargeter
PlayerTargeter = {}

--- Creates a targeter for the given player, with empty target tables, a target pool and no stored ray yet.
---@param player Player
---@return PlayerTargeter
function PlayerTargeter.new(player) end

--- Returns the origin (x, y, z) and direction (x, y, z) of the last ray fired; values are nil before the first valid ray.
---@return number
---@return number
---@return number
---@return number
---@return number
---@return number
function PlayerTargeter:getLastLookRay() end

--- Returns true if a target type is registered under this key.
---@param targetKey CollisionFlag
---@return boolean
function PlayerTargeter:getHasTargetedKey(targetKey) end

--- Registers a target type with a key, collision mask and distance range. Ignored if the key already exists; raises the ray length to the largest max distance and rebuilds the combined mask.
---@param targetKey any
---@param targetMask CollisionFlag
---@param minDistance number?
---@param maxDistance number
function PlayerTargeter:addTargetType(targetKey, targetMask, minDistance, maxDistance) end

--- Adds a filter function called as `filter(hitNode, x, y, z)` to a target type; all filters must return true for a hit to be kept. The key must already exist.
---@param targetKey any
---@param filterFunction function
function PlayerTargeter:addFilterToTargetType(targetKey, filterFunction) end

--- Removes a target type, then rebuilds the combined mask and recomputes the highest max distance from the remaining types.
---@param targetKey any
function PlayerTargeter:removeTargetType(targetKey) end

--- Rebuilds the combined collision mask by OR-ing the masks of all registered target types.
function PlayerTargeter:recalculateCombinedTargetMask() end

--- Returns the node of the closest hit found for this key, or nil if none. How and when that table is filled from the raycast results is not shown in this file (UNVERIFIED).
---@param targetKey any
---@return integer?
function PlayerTargeter:getClosestTargetedNodeFromType(targetKey) end

--- Reads the player's look ray (does nothing if invalid), clears the state through `resetState` (not in this file, UNVERIFIED) and starts an asynchronous raycast with the combined mask. Hits come back to a `raycastCallback` method not shown in this file.
---@param dt number
function PlayerTargeter:update(dt) end

--- Keeps a hit as the current target of a mask if it is inside the distance range, has the mask's collision group, is closer than the existing one and passes every filter. The hit data is stored in a pooled table.
---@param hitNode integer
---@param x number
---@param y number
---@param z number
---@param targetedMask table
---@param distance number
function PlayerTargeter:tryAddTargetWithMask(hitNode, x, y, z, targetedMask, distance) end

--- Draws the targeter debug text: combined mask name and, for each registered mask, the name of its current target node. Returns the next y position.
---@param x number
---@param y number
---@param textSize number
---@return number
function PlayerTargeter:debugDraw(x, y, textSize) end
