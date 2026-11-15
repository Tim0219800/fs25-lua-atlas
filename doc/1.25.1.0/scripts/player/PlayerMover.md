# player/PlayerMover.lua

Source: `dataS/scripts/player/PlayerMover.lua` — FS25 1.25.1.0

- **PlayerMover** (l.12)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlayerMover.new(player: Player) → PlayerMover` | 59 |  |
| `PlayerMover:initialise()` | 148 |  |
| `PlayerMover:calculateSmoothSpeed(moveScalar: number, doWading: boolean, minimumSpeed: number, maximumSpeed: number) → number` | 191 |  |
| `PlayerMover:toggleFlightActive()` | 216 |  |
| `PlayerMover:setFlightActive(isFlightActive: boolean, isForced: boolean?)` | 224 |  |
| `PlayerMover:getIsFlightCollisionDisabled() → boolean` | 241 |  |
| `PlayerMover:setIsFlightCollisionDisabled(isFlightCollisionDisabled: boolean)` | 248 |  |
| `PlayerMover:getMovementYaw() → number` | 313 |  |
| `PlayerMover:setPosition(x: number, y: number, z: number, setNodeTranslation: boolean?)` | 368 |  |
| `PlayerMover:getSpeed() → number` | 412 |  |
| `PlayerMover:teleportTo(x: number, y: number, z: number, setNodeTranslation: boolean?, noEventSend: boolean?)` | 477 |  |
| `PlayerMover:moveHorizontally(currentForceX: number, currentForceZ: number)` | 564 |  |
| `PlayerMover:moveVertically(currentForceY: number)` | 577 |  |
| `PlayerMover:updateFloorDistance(dt: number, isGrounded: any, currentX: any, currentY: any, currentZ: any)` | 589 |  |
| `PlayerMover:onGroundRaycastCallback(hitObjectId: number, x: number, y: number, z: number)` | 632 |  |
| `PlayerMover:updateWaterSubmergeDistance(currentX: any, currentY: any, currentZ: any)` | 640 |  |
| `PlayerMover:onWaterRaycastCallback(hitObjectId: number, x: number, y: number, z: number)` | 655 |  |
| `PlayerMover:update(dt: number)` | 678 |  |
| `PlayerMover:debugDraw(x: number, y: number, textSize: number) → number` | 895 |  |

## Messages

- publishes `MessageType.PLAYER_PRE_TELEPORT` (l.479)
