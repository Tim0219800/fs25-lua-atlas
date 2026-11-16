# objects/PhysicsObject.lua

*[Version française](../../fr/scripts/objects/PhysicsObject.md)*

Source: `dataS/scripts/objects/PhysicsObject.lua` — FS25 1.25.1.0

✍ Base class (extends Object) for networked rigid-body objects such as bales and pallets. It owns a scene node, adds it to physics, sends compressed position and rotation from the server when it moved beyond a small threshold, and on clients interpolates the received pose with kinematic bodies. It also provides scope and priority tests based on clip distance, ghost add/remove and node-to-object registration with the mission.

- **PhysicsObject** inherits from `Object` (l.4)

## Functions

| Function | Line | Description |
|---|---|---|
| `PhysicsObject.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 16 | ✍ Creates the object with no node, a network time interpolator (1.2), a forced clip distance of 60 and a dirty flag for pose updates. |
| `PhysicsObject:delete()` | 32 | ✍ Unmaps the node's children from the mission, deletes the scene node, marks the object deleted, then calls the parent delete. |
| `PhysicsObject:getAllowsAutoDelete() → boolean` | 48 | ✍ Returns true: this object may be removed automatically by the game. |
| `PhysicsObject:loadOnCreate(nodeId: integer)` | 55 | ✍ Uses a node from the map's i3D: assigns it with setNodeId and, on a client, puts it in ghost (hidden, out of physics) state. |
| `PhysicsObject:setNodeId(nodeId: integer)` | 65 | ✍ Stores the node, sets its rigid body type (default type: dynamic on server, kinematic on client), adds it to physics, remembers the initial pose, creates the interpolators on clients and registers the node tree. |
| `PhysicsObject:readStream(streamId: integer, connection: table, objectId: any)` | 88 | ✍ Client join: after the parent readStream, reads the compressed world position and rotation and applies it immediately, then resets the network time interpolator. Asserts that a node exists. |
| `PhysicsObject:writeStream(streamId: integer, connection: table)` | 113 | ✍ Server join: after the parent writeStream, writes the node's compressed world position and rotation. |
| `PhysicsObject:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 135 | ✍ Client update: when the flag is set, reads a compressed pose and sets it as the interpolation target, starting a new network phase. |
| `PhysicsObject:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 160 | ✍ Server update: if the pose dirty flag is set in the mask, writes the last sent position and rotation (compressed). |
| `PhysicsObject:update(dt: number)` | 179 | ✍ Does nothing if already deleted. Client: advances the interpolators and applies the interpolated pose, staying active while interpolating. Server: stays active while the body is not asleep. |
| `PhysicsObject:updateMove() → boolean` | 207 | ✍ Compares the node's world pose with the last sent one (0.005 for position, 0.02 for rotation). If it moved, raises the pose dirty flag and stores the new pose. Returns whether it moved. |
| `PhysicsObject:updateTick(dt: number)` | 225 | ✍ On the server only, calls updateMove to detect movement for network sync. |
| `PhysicsObject:testScope(x: number, y: number, z: number, coeff: number) → boolean` | 238 | ✍ Returns true if the object is closer to the viewer position than the node's clip distance times coeff, capped by forcedClipDistance. Used to decide which clients receive the object. |
| `PhysicsObject:getUpdatePriority(skipCount: number, x: number, y: number, z: number, coeff: number, connection: table, isGuiVisible: any) → number` | 258 | ✍ Computes the network update priority: closer objects score higher (80 percent weight), with a bonus for how many updates were skipped (20 percent weight). |
| `PhysicsObject:onGhostRemove()` | 267 | ✍ Hides the node and removes it from physics (ghost state). |
| `PhysicsObject:onGhostAdd()` | 274 | ✍ Shows the node and adds it back to physics. |
| `PhysicsObject:wakeUp()` | 281 | ✍ Wakes the node's physics body through I3DUtil.wakeUpObject. |
| `PhysicsObject:setWorldPositionQuaternion(x: number, y: number, z: number, quatX: number, quatY: number, quatZ: number, quatW: number, changeInterp: any)` | 302 | ✍ Sets the node's world position and quaternion. If changeInterp is set, a client resets its interpolators to this pose, and the server raises the dirty flag and stores it as the last sent pose. |
| `PhysicsObject:setLocalPositionQuaternion(x: number, y: number, z: number, quatX: number, quatY: number, quatZ: number, quatW: number, changeInterp: any)` | 327 | ✍ Same as the world version but with local translation and quaternion; with changeInterp, the interpolators or sent pose use the resulting world pose. |
| `PhysicsObject:getDefaultRigidBodyType() → string` | 347 | ✍ Returns DYNAMIC on the server and KINEMATIC on clients, as the server drives the physics. |
| `PhysicsObject:addChildenToNodeObject(nodeId: integer)` | 373 | ✍ Recursively walks the node tree; every node with a rigid body is mapped to this object in the mission, and on the server gets a wake-up report calling onPhysicObjectWakeUpCallback. The name keeps the original spelling 'Childen'. |
