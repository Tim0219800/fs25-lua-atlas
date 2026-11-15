---@meta
-- FS25 1.25.1.0 : player/PlayerCCT.lua (generated stub, FS25 Lua Atlas)

---@class PlayerCCT
PlayerCCT = {}

---@return PlayerCCT
function PlayerCCT.new() end

function PlayerCCT:delete() end

function PlayerCCT:rebuild() end

---@param movementX number
---@param movementY number
---@param movementZ number
function PlayerCCT:move(movementX, movementY, movementZ) end

---@return number
---@return number
---@return number
function PlayerCCT:getPosition() end

---@param x number
---@param y number
---@param z number
---@param setNodeTranslation boolean?
function PlayerCCT:setPosition(x, y, z, setNodeTranslation) end

---@return boolean
function PlayerCCT:calculateIfBottomTouchesGround() end

---@param x number
---@param y number
---@param textSize number
---@return number
function PlayerCCT:debugDraw(x, y, textSize) end
