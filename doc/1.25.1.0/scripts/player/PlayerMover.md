# player/PlayerMover.lua

*[Version française](../../fr/scripts/player/PlayerMover.md)*

Source: `dataS/scripts/player/PlayerMover.lua` — FS25 1.25.1.0

✍ Turns movement requests into actual on-foot player motion: accumulates forces, applies them through the player's capsule controller (CCT), and tracks speed, velocity, grounded/air/fall timers, water submersion (swimming) and a debug flight mode. It exposes an `onPositionTeleport` listener list and marks the player's dirty flag so the changes get synchronized. Helpers such as `getPosition`, `updateDeltas`, `updateRotation`, `updateFlightCollision`, `getIsPhysicsEnabled` and `calculateWadeScalar` are not in this dump (UNVERIFIED).

- **PlayerMover** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerMover.new(player: Player) → PlayerMover` | 59 | ✍ Creates the mover for a player with zeroed forces, velocity and timers, reserves a dirty flag from the player, and creates the `onPositionTeleport` listener list. A TODO in the code about the dirty flag is left unresolved. |
| `PlayerMover:initialise()` | 148 | ✍ Called when the player first loads: creates a transform group in the scene root that marks the movement direction. |
| `PlayerMover:calculateSmoothSpeed(moveScalar: number, doWading: boolean, minimumSpeed: number, maximumSpeed: number) → number` | 191 | ✍ Returns a speed interpolated between minimum and maximum by the move scalar. With wading enabled it returns 0 for a zero scalar, uses the swim speed as minimum when deeply submerged, and slows the scalar by the submersion depth. |
| `PlayerMover:toggleFlightActive()` | 216 | ✍ Inverts the flight mode through `setFlightActive`. Has no effect unless the flight command is turned on. |
| `PlayerMover:setFlightActive(isFlightActive: boolean, isForced: boolean?)` | 224 | ✍ Turns flight on or off and then refreshes the player's collision. Unless `isForced` is set, it is ignored when the player's flight command is missing or its value is false. |
| `PlayerMover:getIsFlightCollisionDisabled() → boolean` | 241 | ✍ Returns whether player collision is configured to be off while flying. |
| `PlayerMover:setIsFlightCollisionDisabled(isFlightCollisionDisabled: boolean)` | 248 | ✍ Sets whether collision is disabled while flying and immediately refreshes the collision state through `updateFlightCollision`. |
| `PlayerMover:getMovementYaw() → number` | 313 | ✍ Returns the yaw of the movement direction in world space; the visual model follows it smoothly. |
| `PlayerMover:setPosition(x: number, y: number, z: number, setNodeTranslation: boolean?)` | 368 | ✍ Moves the player's capsule controller to the given position (optionally also setting the node translation) and raises the default dirty flag. |
| `PlayerMover:getSpeed() → number` | 412 | ✍ Returns the stored horizontal speed of the player (m/s). |
| `PlayerMover:teleportTo(x: number, y: number, z: number, setNodeTranslation: boolean?, noEventSend: boolean?)` | 477 | ✍ Publishes `PLAYER_PRE_TELEPORT`, tells the server through a `PlayerTeleportEvent` when called by an owning client (unless `noEventSend`), remembers the old position, sets the new one and invokes `onPositionTeleport`. |
| `PlayerMover:moveHorizontally(currentForceX: number, currentForceZ: number)` | 564 | ✍ Adds an x/z movement to this frame's accumulated force and raises the dirty flag. The position itself is not changed until the next update. |
| `PlayerMover:moveVertically(currentForceY: number)` | 577 | ✍ Adds a y movement to this frame's accumulated force and raises the dirty flag. The position itself is not changed until the next update. |
| `PlayerMover:updateFloorDistance(dt: number, isGrounded: any, currentX: any, currentY: any, currentZ: any)` | 589 | ✍ Updates grounded state, ground distance, close-to-ground flag and the ground, air and fall timers. When airborne it raycasts down (up to 200 m, from 10 m above the player) against terrain, static objects and roads, and falls back to y = 0 if nothing is hit. |
| `PlayerMover:onGroundRaycastCallback(hitObjectId: number, x: number, y: number, z: number)` | 632 | ✍ Raycast callback for the ground check: stores the hit height as ground level when an object was hit. |
| `PlayerMover:updateWaterSubmergeDistance(currentX: any, currentY: any, currentZ: any)` | 640 | ✍ Starts an asynchronous downward raycast (6 m, from 3 m above the player) against the water collision group; the result is handled in `onWaterRaycastCallback`. |
| `PlayerMover:onWaterRaycastCallback(hitObjectId: number, x: number, y: number, z: number)` | 655 | ✍ Computes submersion depth from the water hit height and the player y position stored when the ray was cast, then sets `isInWater`, `needSwimming` and `isSwimming` (the latter with a 0.2 lower threshold than `needSwimming`). |
| `PlayerMover:update(dt: number)` | 678 | ✍ Per-frame update: if physics are enabled, computes the position deltas and moves the capsule controller. It then checks ground contact (server or physics-enabled only), refreshes water and floor data, and updates the movement yaw and rotation velocity. |
| `PlayerMover:debugDraw(x: number, y: number, textSize: number) → number` | 895 | ✍ Draws the movement direction node and debug text lines for position, velocity, yaw, speed, water and ground data. Returns the next y position. |

## Messages

- publishes `MessageType.PLAYER_PRE_TELEPORT` (l.479)
