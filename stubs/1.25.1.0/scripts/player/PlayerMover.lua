---@meta
-- FS25 1.25.1.0 : player/PlayerMover.lua (stub généré, atlas Lua FS25)

---@class PlayerMover
PlayerMover = {}

---@param player Player
---@return PlayerMover
function PlayerMover.new(player) end

function PlayerMover:initialise() end

---@param moveScalar number
---@param doWading boolean
---@param minimumSpeed number
---@param maximumSpeed number
---@return number
function PlayerMover:calculateSmoothSpeed(moveScalar, doWading, minimumSpeed, maximumSpeed) end

function PlayerMover:toggleFlightActive() end

---@param isFlightActive boolean
---@param isForced boolean?
function PlayerMover:setFlightActive(isFlightActive, isForced) end

---@return boolean
function PlayerMover:getIsFlightCollisionDisabled() end

---@param isFlightCollisionDisabled boolean
function PlayerMover:setIsFlightCollisionDisabled(isFlightCollisionDisabled) end

---@return number
function PlayerMover:getMovementYaw() end

---@param x number
---@param y number
---@param z number
---@param setNodeTranslation boolean?
function PlayerMover:setPosition(x, y, z, setNodeTranslation) end

---@return number
function PlayerMover:getSpeed() end

---@param x number
---@param y number
---@param z number
---@param setNodeTranslation boolean?
---@param noEventSend boolean?
function PlayerMover:teleportTo(x, y, z, setNodeTranslation, noEventSend) end

---@param currentForceX number
---@param currentForceZ number
function PlayerMover:moveHorizontally(currentForceX, currentForceZ) end

---@param currentForceY number
function PlayerMover:moveVertically(currentForceY) end

---@param dt number
---@param isGrounded any
---@param currentX any
---@param currentY any
---@param currentZ any
function PlayerMover:updateFloorDistance(dt, isGrounded, currentX, currentY, currentZ) end

---@param hitObjectId number
---@param x number
---@param y number
---@param z number
function PlayerMover:onGroundRaycastCallback(hitObjectId, x, y, z) end

---@param currentX any
---@param currentY any
---@param currentZ any
function PlayerMover:updateWaterSubmergeDistance(currentX, currentY, currentZ) end

---@param hitObjectId number
---@param x number
---@param y number
---@param z number
function PlayerMover:onWaterRaycastCallback(hitObjectId, x, y, z) end

---@param dt number
function PlayerMover:update(dt) end

---@param x number
---@param y number
---@param textSize number
---@return number
function PlayerMover:debugDraw(x, y, textSize) end
