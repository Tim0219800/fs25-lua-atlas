---@meta
-- FS25 1.25.1.0 : player/PlayerCamera.lua (stub généré, atlas Lua FS25)

---@class PlayerCamera
PlayerCamera = {}

---@param player Player
---@return PlayerCamera
function PlayerCamera.new(player) end

function PlayerCamera:initialise() end

function PlayerCamera:makeCurrent() end

function PlayerCamera:toggleThirdPersonMode() end

---@return boolean
function PlayerCamera:getIsCollisionEnabled() end

---@param isCollisionEnabled boolean
function PlayerCamera:setIsCollisionEnabled(isCollisionEnabled) end

---@return number
function PlayerCamera:getOffsetY() end

---@param offsetY number
function PlayerCamera:setOffsetY(offsetY) end

---@return number
function PlayerCamera:getCurrentZoomDistance() end

---@param zoomDistance number
---@param isForced boolean?
function PlayerCamera:setCurrentZoomDistance(zoomDistance, isForced) end

---@return number
function PlayerCamera:getDesiredZoomDistance() end

---@return number
---@return number
---@return number
function PlayerCamera:getFocusPosition() end

---@param x number
---@param y number
---@param z number
function PlayerCamera:setFocusPosition(x, y, z) end

---@return number
---@return number
---@return number
function PlayerCamera:getCameraPosition() end

---@return number
---@return number
---@return number
function PlayerCamera:getRotation() end

---@param pitch number
---@param yaw number
---@param roll number
function PlayerCamera:setRotation(pitch, yaw, roll) end

---@param directionX number
---@param directionZ number
---@return number
---@return number
function PlayerCamera:calculateWorldDirection(directionX, directionZ) end

---@param directionX number
---@param directionZ number
---@return number
---@return number
function PlayerCamera:calculateLocalDirection(directionX, directionZ) end

---@param dt number
function PlayerCamera:updateRotation(dt) end

---@param dt number
function PlayerCamera:updatePosition(dt) end

function PlayerCamera:focusOnPlayer() end

---@param x number
---@param y number
---@param z number
function PlayerCamera:focusOnPosition(x, y, z) end

---@param dt number
function PlayerCamera:tryApplyViewBobbing(dt) end
