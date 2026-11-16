---@meta
-- FS25 1.25.1.0 : objects/PhysicsObject.lua (generated stub, FS25 Lua Atlas)

--- Base class (extends Object) for networked rigid-body objects such as bales and pallets. It owns a scene node, adds it to physics, sends compressed position and rotation from the server when it moved beyond a small threshold, and on clients interpolates the received pose with kinematic bodies. It also provides scope and priority tests based on clip distance, ghost add/remove and node-to-object registration with the mission.
---@class PhysicsObject : Object
PhysicsObject = {}

--- Creates the object with no node, a network time interpolator (1.2), a forced clip distance of 60 and a dirty flag for pose updates.
---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function PhysicsObject.new(isServer, isClient, customMt) end

--- Unmaps the node's children from the mission, deletes the scene node, marks the object deleted, then calls the parent delete.
function PhysicsObject:delete() end

--- Returns true: this object may be removed automatically by the game.
---@return boolean
function PhysicsObject:getAllowsAutoDelete() end

--- Uses a node from the map's i3D: assigns it with setNodeId and, on a client, puts it in ghost (hidden, out of physics) state.
---@param nodeId integer
function PhysicsObject:loadOnCreate(nodeId) end

--- Stores the node, sets its rigid body type (default type: dynamic on server, kinematic on client), adds it to physics, remembers the initial pose, creates the interpolators on clients and registers the node tree.
---@param nodeId integer
function PhysicsObject:setNodeId(nodeId) end

--- Client join: after the parent readStream, reads the compressed world position and rotation and applies it immediately, then resets the network time interpolator. Asserts that a node exists.
---@param streamId integer
---@param connection table
---@param objectId any
function PhysicsObject:readStream(streamId, connection, objectId) end

--- Server join: after the parent writeStream, writes the node's compressed world position and rotation.
---@param streamId integer
---@param connection table
function PhysicsObject:writeStream(streamId, connection) end

--- Client update: when the flag is set, reads a compressed pose and sets it as the interpolation target, starting a new network phase.
---@param streamId integer
---@param timestamp integer
---@param connection table
function PhysicsObject:readUpdateStream(streamId, timestamp, connection) end

--- Server update: if the pose dirty flag is set in the mask, writes the last sent position and rotation (compressed).
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function PhysicsObject:writeUpdateStream(streamId, connection, dirtyMask) end

--- Does nothing if already deleted. Client: advances the interpolators and applies the interpolated pose, staying active while interpolating. Server: stays active while the body is not asleep.
---@param dt number
function PhysicsObject:update(dt) end

--- Compares the node's world pose with the last sent one (0.005 for position, 0.02 for rotation). If it moved, raises the pose dirty flag and stores the new pose. Returns whether it moved.
---@return boolean
function PhysicsObject:updateMove() end

--- On the server only, calls updateMove to detect movement for network sync.
---@param dt number
function PhysicsObject:updateTick(dt) end

--- Returns true if the object is closer to the viewer position than the node's clip distance times coeff, capped by forcedClipDistance. Used to decide which clients receive the object.
---@param x number
---@param y number
---@param z number
---@param coeff number
---@return boolean
function PhysicsObject:testScope(x, y, z, coeff) end

--- Computes the network update priority: closer objects score higher (80 percent weight), with a bonus for how many updates were skipped (20 percent weight).
---@param skipCount number
---@param x number
---@param y number
---@param z number
---@param coeff number
---@param connection table
---@param isGuiVisible any
---@return number
function PhysicsObject:getUpdatePriority(skipCount, x, y, z, coeff, connection, isGuiVisible) end

--- Hides the node and removes it from physics (ghost state).
function PhysicsObject:onGhostRemove() end

--- Shows the node and adds it back to physics.
function PhysicsObject:onGhostAdd() end

--- Wakes the node's physics body through I3DUtil.wakeUpObject.
function PhysicsObject:wakeUp() end

--- Sets the node's world position and quaternion. If changeInterp is set, a client resets its interpolators to this pose, and the server raises the dirty flag and stores it as the last sent pose.
---@param x number
---@param y number
---@param z number
---@param quatX number
---@param quatY number
---@param quatZ number
---@param quatW number
---@param changeInterp any
function PhysicsObject:setWorldPositionQuaternion(x, y, z, quatX, quatY, quatZ, quatW, changeInterp) end

--- Same as the world version but with local translation and quaternion; with changeInterp, the interpolators or sent pose use the resulting world pose.
---@param x number
---@param y number
---@param z number
---@param quatX number
---@param quatY number
---@param quatZ number
---@param quatW number
---@param changeInterp any
function PhysicsObject:setLocalPositionQuaternion(x, y, z, quatX, quatY, quatZ, quatW, changeInterp) end

--- Returns DYNAMIC on the server and KINEMATIC on clients, as the server drives the physics.
---@return string
function PhysicsObject:getDefaultRigidBodyType() end

--- Recursively walks the node tree; every node with a rigid body is mapped to this object in the mission, and on the server gets a wake-up report calling onPhysicObjectWakeUpCallback. The name keeps the original spelling 'Childen'.
---@param nodeId integer
function PhysicsObject:addChildenToNodeObject(nodeId) end
