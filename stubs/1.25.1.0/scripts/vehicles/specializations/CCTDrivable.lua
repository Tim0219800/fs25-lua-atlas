---@meta
-- FS25 1.25.1.0 : vehicles/specializations/CCTDrivable.lua (generated stub, FS25 Lua Atlas)

---@class CCTDrivable
CCTDrivable = {}

---@param specializations table
---@return boolean
function CCTDrivable.prerequisitesPresent(specializations) end

function CCTDrivable.initSpecialization() end

---@param vehicleType table
function CCTDrivable.registerFunctions(vehicleType) end

---@param vehicleType any
function CCTDrivable.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType table
function CCTDrivable.registerEventListeners(vehicleType) end

---@param savegame table
function CCTDrivable:onLoad(savegame) end

function CCTDrivable:onDelete() end

---@param moveX any
---@param moveY any
---@param moveZ any
function CCTDrivable:moveCCT(moveX, moveY, moveZ) end

---@return integer
function CCTDrivable:getIsCCTOnGround() end

---@return integer
function CCTDrivable:getCCTCollisionMask() end

---@return number
---@return number
---@return number
function CCTDrivable:getCCTWorldTranslation() end

---@return boolean
function CCTDrivable:getIsAIMovingObstacle() end

---@param superFunc number
---@param x number
---@param y number
---@param z number
---@param xRot number
---@param yRot number
---@param zRot number
---@param i integer
---@param changeInterp boolean
function CCTDrivable:setWorldPosition(superFunc, x, y, z, xRot, yRot, zRot, i, changeInterp) end

---@param superFunc number
---@param x number
---@param y number
---@param z number
---@param qx number
---@param qy number
---@param qz number
---@param qw number
---@param i integer
---@param changeInterp boolean
function CCTDrivable:setWorldPositionQuaternion(superFunc, x, y, z, qx, qy, qz, qw, i, changeInterp) end

---@param superFunc function
---@return boolean
function CCTDrivable:removeFromPhysics(superFunc) end
