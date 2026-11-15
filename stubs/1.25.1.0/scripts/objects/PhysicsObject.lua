---@meta
-- FS25 1.25.1.0 : objects/PhysicsObject.lua (generated stub, FS25 Lua Atlas)

---@class PhysicsObject : Object
PhysicsObject = {}

---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function PhysicsObject.new(isServer, isClient, customMt) end

function PhysicsObject:delete() end

---@return boolean
function PhysicsObject:getAllowsAutoDelete() end

---@param nodeId integer
function PhysicsObject:loadOnCreate(nodeId) end

---@param nodeId integer
function PhysicsObject:setNodeId(nodeId) end

---@param streamId integer
---@param connection table
---@param objectId any
function PhysicsObject:readStream(streamId, connection, objectId) end

---@param streamId integer
---@param connection table
function PhysicsObject:writeStream(streamId, connection) end

---@param streamId integer
---@param timestamp integer
---@param connection table
function PhysicsObject:readUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function PhysicsObject:writeUpdateStream(streamId, connection, dirtyMask) end

---@param dt number
function PhysicsObject:update(dt) end

---@return boolean
function PhysicsObject:updateMove() end

---@param dt number
function PhysicsObject:updateTick(dt) end

---@param x number
---@param y number
---@param z number
---@param coeff number
---@return boolean
function PhysicsObject:testScope(x, y, z, coeff) end

---@param skipCount number
---@param x number
---@param y number
---@param z number
---@param coeff number
---@param connection table
---@param isGuiVisible any
---@return number
function PhysicsObject:getUpdatePriority(skipCount, x, y, z, coeff, connection, isGuiVisible) end

function PhysicsObject:onGhostRemove() end

function PhysicsObject:onGhostAdd() end

function PhysicsObject:wakeUp() end

---@param x number
---@param y number
---@param z number
---@param quatX number
---@param quatY number
---@param quatZ number
---@param quatW number
---@param changeInterp any
function PhysicsObject:setWorldPositionQuaternion(x, y, z, quatX, quatY, quatZ, quatW, changeInterp) end

---@param x number
---@param y number
---@param z number
---@param quatX number
---@param quatY number
---@param quatZ number
---@param quatW number
---@param changeInterp any
function PhysicsObject:setLocalPositionQuaternion(x, y, z, quatX, quatY, quatZ, quatW, changeInterp) end

---@return string
function PhysicsObject:getDefaultRigidBodyType() end

---@param nodeId integer
function PhysicsObject:addChildenToNodeObject(nodeId) end
