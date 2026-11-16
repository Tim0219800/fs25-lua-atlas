# objects/MountableObject.lua

*[Version française](../../fr/scripts/objects/MountableObject.md)*

Source: `dataS/scripts/objects/MountableObject.lua` — FS25 1.25.1.0

✍ Subclass of PhysicsObject for objects that can be mounted (attached with a dynamic joint) to a vehicle or other carrier. Only a few members have bodies in the SDK dump: a periodic upward raycast that counts the mass of other mountable objects stacked above to scale the mount joint force, and a network pose override. Most of the mounting logic (mount types, joint creation, getAdditionalMountingDistance, FORCE_LIMIT_* constants) is not in the dump and is UNVERIFIED.

- **MountableObject** inherits from `PhysicsObject` (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `MountableObject:updateDynamicMountJointForceLimit(dt: any)` | 331 | ✍ Called with dt while mounted: counts down a timer and, when it expires and no cast is pending, starts an asynchronous upward raycast against dynamic objects to measure the stacked mass. The result is applied in the raycast callback. |
| `MountableObject:getAdditionalMountingMass()` | 350 | ✍ Always returns 0; kept only so older callers keep working. |
| `MountableObject:additionalMountingMassRaycastCallback(hitObjectId: integer, x: number, y: number, z: number, distance: number, nx: number, ny: number, nz: number, subShapeIndex: integer, shapeId: integer, isLast: boolean) → boolean` | 368 | ✍ Raycast callback: adds the mass of each other MountableObject found at the expected stacking distance. On the last hit it rescales the mount joint's linear drive force limit by the total mass ratio. Returns true to continue the cast. |
| `MountableObject:setWorldPositionQuaternion(x: number, y: number, z: number, quatX: number, quatY: number, quatZ: number, quatW: number, changeInterp: any)` | 430 | ✍ Applies the parent's pose setter always on the server, but on a client only when the mount type is neither kinematic nor default, so mounted objects are not moved by network pose updates there. |
