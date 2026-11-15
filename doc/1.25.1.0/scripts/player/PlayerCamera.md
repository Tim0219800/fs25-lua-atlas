# player/PlayerCamera.lua

Source : `dataS/scripts/player/PlayerCamera.lua` — FS25 1.25.1.0

- **PlayerCamera** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerCamera.new(player: Player) → PlayerCamera` | 59 |  |
| `PlayerCamera:initialise()` | 126 |  |
| `PlayerCamera:makeCurrent()` | 202 |  |
| `PlayerCamera:toggleThirdPersonMode()` | 214 |  |
| `PlayerCamera:getIsCollisionEnabled() → boolean` | 332 |  |
| `PlayerCamera:setIsCollisionEnabled(isCollisionEnabled: boolean)` | 339 |  |
| `PlayerCamera:getOffsetY() → number` | 368 |  |
| `PlayerCamera:setOffsetY(offsetY: number)` | 375 |  |
| `PlayerCamera:getCurrentZoomDistance() → number` | 382 |  |
| `PlayerCamera:setCurrentZoomDistance(zoomDistance: number, isForced: boolean?)` | 390 |  |
| `PlayerCamera:getDesiredZoomDistance() → number` | 398 |  |
| `PlayerCamera:getFocusPosition() → number, number, number` | 419 |  |
| `PlayerCamera:setFocusPosition(x: number, y: number, z: number)` | 428 |  |
| `PlayerCamera:getCameraPosition() → number, number, number` | 486 |  |
| `PlayerCamera:getRotation() → number, number, number` | 495 |  |
| `PlayerCamera:setRotation(pitch: number, yaw: number, roll: number)` | 509 |  |
| `PlayerCamera:calculateWorldDirection(directionX: number, directionZ: number) → number, number` | 521 |  |
| `PlayerCamera:calculateLocalDirection(directionX: number, directionZ: number) → number, number` | 532 |  |
| `PlayerCamera:updateRotation(dt: number)` | 553 |  |
| `PlayerCamera:updatePosition(dt: number)` | 580 |  |
| `PlayerCamera:focusOnPlayer()` | 600 |  |
| `PlayerCamera:focusOnPosition(x: number, y: number, z: number)` | 666 |  |
| `PlayerCamera:tryApplyViewBobbing(dt: number)` | 674 |  |

## Messages

- écoute `MessageType.SETTING_CHANGED` (l.117)
- écoute `MessageType.SETTING_CHANGED` (l.118)
