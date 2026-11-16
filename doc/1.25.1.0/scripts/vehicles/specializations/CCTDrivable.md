# vehicles/specializations/CCTDrivable.lua

*[Version française](../../../fr/scripts/vehicles/specializations/CCTDrivable.md)*

Source: `dataS/scripts/vehicles/specializations/CCTDrivable.lua` — FS25 1.25.1.0

✍ Specialization for vehicles driven as a character controller (CCT) instead of a rigid-body vehicle, such as kinematic animal-like or walking mounts. It reads cctDrivable XML values (radius, height, slope limit, step offset), builds collision groups and masks, and on the server keeps a transform group that follows the vehicle and moves the controller. Several registered functions (getTouchingNode, moveCCTExternal) and the addToPhysics override have no definition in this file, UNVERIFIED.

- **CCTDrivable** (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `CCTDrivable.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Always returns true: no other specialization is required. |
| `CCTDrivable.initSpecialization()` | 26 | ✍ Opens and closes the CCTDrivable XML specialization type; no keys are registered in this dump. |
| `CCTDrivable.registerFunctions(vehicleType: table)` | 41 | ✍ Registers getTouchingNode, moveCCTExternal, moveCCT, getIsCCTOnGround, getCCTCollisionMask, getCCTWorldTranslation and getIsAIMovingObstacle. Note: getTouchingNode and moveCCTExternal are not defined in this file, so they register as nil (UNVERIFIED). |
| `CCTDrivable.registerOverwrittenFunctions(vehicleType: any)` | 53 | ✍ Overrides addToPhysics, removeFromPhysics, setWorldPosition and setWorldPositionQuaternion. Note: CCTDrivable.addToPhysics is not defined in this file (UNVERIFIED). |
| `CCTDrivable.registerEventListeners(vehicleType: table)` | 63 | ✍ Registers onLoad and onDelete. |
| `CCTDrivable:onLoad(savegame: table)` | 71 | ✍ Reads cctRadius, cctHeight, cctSlopeLimit and cctStepOffset from XML, sets the CCT centre offset to minus the radius, and builds the kinematic and movement collision group and mask (excluding vehicles, water, triggers in some cases, blocking flags). On the server creates the cctDrivable transform group under the root node. |
| `CCTDrivable:onDelete()` | 119 | ✍ Removes the CCT controller if one exists and deletes the transform group. |
| `CCTDrivable:moveCCT(moveX: any, moveY: any, moveZ: any)` | 135 | ✍ Server only: moves the controller by the given offset using the movement collision group and mask, then raises the vehicle active. Does nothing if no controller has been created. |
| `CCTDrivable:getIsCCTOnGround() → integer` | 167 | ✍ Server only: returns the on-ground flag reported by the engine for the controller, false if client or no controller. |
| `CCTDrivable:getCCTCollisionMask() → integer` | 179 | ✍ Returns the kinematic collision mask built in onLoad. |
| `CCTDrivable:getCCTWorldTranslation() → number, number, number` | 189 | ✍ Returns x, y, z of the controller centre: the node position with the centre offset added to y. |
| `CCTDrivable:getIsAIMovingObstacle() → boolean` | 199 | ✍ Always returns true: AI helpers must consider this vehicle a moving obstacle, even though its rigid body is kinematic. |
| `CCTDrivable:setWorldPosition(superFunc: number, x: number, y: number, z: number, xRot: number, yRot: number, zRot: number, i: integer, changeInterp: boolean)` | 213 | ✍ Calls the parent, then on the server, for component 1, moves the CCT node to the same position shifted by the centre offset. Rotation is not applied to the node. |
| `CCTDrivable:setWorldPositionQuaternion(superFunc: number, x: number, y: number, z: number, qx: number, qy: number, qz: number, qw: number, i: integer, changeInterp: boolean)` | 232 | ✍ Same as setWorldPosition but with a quaternion rotation: calls the parent, then on the server for component 1 moves the CCT node to the shifted position. |
| `CCTDrivable:removeFromPhysics(superFunc: function) → boolean` | 265 | ✍ On the server, removes the CCT controller before calling the parent implementation and returning its result. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getTouchingNode` | 42 |
| registerFunction | `moveCCTExternal` | 43 |
| registerFunction | `moveCCT` | 44 |
| registerFunction | `getIsCCTOnGround` | 45 |
| registerFunction | `getCCTCollisionMask` | 46 |
| registerFunction | `getCCTWorldTranslation` | 47 |
| registerFunction | `getIsAIMovingObstacle` | 48 |
| registerOverwrittenFunction | `addToPhysics` | 54 |
| registerOverwrittenFunction | `removeFromPhysics` | 55 |
| registerOverwrittenFunction | `setWorldPosition` | 56 |
| registerOverwrittenFunction | `setWorldPositionQuaternion` | 57 |
| registerEventListener | `onLoad` | 64 |
| registerEventListener | `onDelete` | 65 |
