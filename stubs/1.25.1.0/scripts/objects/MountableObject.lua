---@meta
-- FS25 1.25.1.0 : objects/MountableObject.lua (generated stub, FS25 Lua Atlas)

--- Subclass of PhysicsObject for objects that can be mounted (attached with a dynamic joint) to a vehicle or other carrier. Only a few members have bodies in the SDK dump: a periodic upward raycast that counts the mass of other mountable objects stacked above to scale the mount joint force, and a network pose override. Most of the mounting logic (mount types, joint creation, getAdditionalMountingDistance, FORCE_LIMIT_* constants) is not in the dump and is UNVERIFIED.
---@class MountableObject : PhysicsObject
MountableObject = {}

--- Called with dt while mounted: counts down a timer and, when it expires and no cast is pending, starts an asynchronous upward raycast against dynamic objects to measure the stacked mass. The result is applied in the raycast callback.
---@param dt any
function MountableObject:updateDynamicMountJointForceLimit(dt) end

--- Always returns 0; kept only so older callers keep working.
function MountableObject:getAdditionalMountingMass() end

--- Raycast callback: adds the mass of each other MountableObject found at the expected stacking distance. On the last hit it rescales the mount joint's linear drive force limit by the total mass ratio. Returns true to continue the cast.
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

--- Applies the parent's pose setter always on the server, but on a client only when the mount type is neither kinematic nor default, so mounted objects are not moved by network pose updates there.
---@param x number
---@param y number
---@param z number
---@param quatX number
---@param quatY number
---@param quatZ number
---@param quatW number
---@param changeInterp any
function MountableObject:setWorldPositionQuaternion(x, y, z, quatX, quatY, quatZ, quatW, changeInterp) end
