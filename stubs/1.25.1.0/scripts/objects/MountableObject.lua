---@meta
-- FS25 1.25.1.0 : objects/MountableObject.lua (stub généré, atlas Lua FS25)

---@class MountableObject : PhysicsObject
MountableObject = {}

---@param dt any
function MountableObject:updateDynamicMountJointForceLimit(dt) end

function MountableObject:getAdditionalMountingMass() end

---@param hitObjectId integer
---@param x number
---@param y number
---@param z number
---@param distance number
---@param nx number
---@param ny number
---@param nz number
---@param subShapeIndex integer
---@param shapeId integer
---@param isLast boolean
---@return boolean
function MountableObject:additionalMountingMassRaycastCallback(hitObjectId, x, y, z, distance, nx, ny, nz, subShapeIndex, shapeId, isLast) end

---@param x number
---@param y number
---@param z number
---@param quatX number
---@param quatY number
---@param quatZ number
---@param quatW number
---@param changeInterp any
function MountableObject:setWorldPositionQuaternion(x, y, z, quatX, quatY, quatZ, quatW, changeInterp) end
