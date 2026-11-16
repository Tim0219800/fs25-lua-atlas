# player/PlayerCamera.lua

*[Version française](../../fr/scripts/player/PlayerCamera.md)*

Source: `dataS/scripts/player/PlayerCamera.lua` — FS25 1.25.1.0

✍ Camera of a player, usable in first or third person. It owns the yaw node, the pitch node and the camera root node, handles rotation from input, following the player, zoom and collision distance, first-person view bobbing, and temporary target overrides. It subscribes to the player field-of-view settings. Several helpers it calls (`initialiseCameraNodes`, `switchToPerspective`, `applyZoom`, `getHasOverriddenTarget`, `getBaseOffsetY`) are not in this dump (UNVERIFIED).

- **PlayerCamera** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerCamera.new(player: Player) → PlayerCamera` | 59 | ✍ Creates the camera for a player, starting in first person with collision on and default zoom, and subscribes to the first- and third-person FOV setting changes. No scene nodes exist yet. |
| `PlayerCamera:initialise()` | 126 | ✍ Called when the player first loads; delegates to `initialiseCameraNodes` (not in this dump) to build the camera nodes in the scene. |
| `PlayerCamera:makeCurrent()` | 202 | ✍ Makes this camera the active one in `g_cameraManager`: the first-person camera, the third-person conversation camera while in a conversation, or the normal third-person camera. |
| `PlayerCamera:toggleThirdPersonMode()` | 214 | ✍ Switches between first and third person by calling `switchToPerspective` with the opposite of the current mode. |
| `PlayerCamera:getIsCollisionEnabled() → boolean` | 332 | ✍ Returns the stored collision flag. Note: the code simply returns the variable, so it is not forced to false in first person despite what the name might suggest elsewhere. |
| `PlayerCamera:setIsCollisionEnabled(isCollisionEnabled: boolean)` | 339 | ✍ Sets whether the camera collides with objects behind it. |
| `PlayerCamera:getOffsetY() → number` | 368 | ✍ Returns the extra vertical camera offset, used for fine adjustments such as swimming. |
| `PlayerCamera:setOffsetY(offsetY: number)` | 375 | ✍ Sets the extra vertical offset, 0 when nil is given. |
| `PlayerCamera:getCurrentZoomDistance() → number` | 382 | ✍ Returns the current distance between the camera root and the focus point. |
| `PlayerCamera:setCurrentZoomDistance(zoomDistance: number, isForced: boolean?)` | 390 | ✍ Stores the zoom distance and moves the camera root node back by that amount on its local z axis. The `isForced` parameter is unused. |
| `PlayerCamera:getDesiredZoomDistance() → number` | 398 | ✍ Returns the zoom distance the player wants, or 0 in first person. |
| `PlayerCamera:getFocusPosition() → number, number, number` | 419 | ✍ Returns the world position of the yaw node, which is the point the camera orbits and looks at. |
| `PlayerCamera:setFocusPosition(x: number, y: number, z: number)` | 428 | ✍ Moves the yaw node to the given world position. |
| `PlayerCamera:getCameraPosition() → number, number, number` | 486 | ✍ Returns the world position of the camera root node itself. |
| `PlayerCamera:getRotation() → number, number, number` | 495 | ✍ Returns pitch, yaw and roll computed from the camera's forward direction, which avoids the engine's Euler flipping; roll is read directly from the node. |
| `PlayerCamera:setRotation(pitch: number, yaw: number, roll: number)` | 509 | ✍ Applies pitch to the pitch node, yaw to the yaw node and roll to the camera root node (which is also turned by pi). Nil values count as 0. |
| `PlayerCamera:calculateWorldDirection(directionX: number, directionZ: number) → number, number` | 521 | ✍ Converts a local x/z direction relative to the yaw node into a world x/z direction (the y component is dropped). |
| `PlayerCamera:calculateLocalDirection(directionX: number, directionZ: number) → number, number` | 532 | ✍ Converts a world x/z direction into a direction local to the yaw node (the y component is dropped). |
| `PlayerCamera:updateRotation(dt: number)` | 553 | ✍ Rotates the camera from the player's input deltas scaled by the camera sensitivity setting, clamping pitch between `LOWEST_PITCH` and `HIGHEST_PITCH`. While a target override is active it follows the target instead. |
| `PlayerCamera:updatePosition(dt: number)` | 580 | ✍ Per-frame position update: follows the player, applies first-person bobbing and the zoom logic (`applyZoom`, not in this dump). With a target override it only updates from the target. |
| `PlayerCamera:focusOnPlayer()` | 600 | ✍ Focuses the camera on the player's graphical (interpolated) position. |
| `PlayerCamera:focusOnPosition(x: number, y: number, z: number)` | 666 | ✍ Moves the focus point to the given position plus the current y offset and the base y offset (`getBaseOffsetY`, not in this dump). |
| `PlayerCamera:tryApplyViewBobbing(dt: number)` | 674 | ✍ Applies camera bobbing (x/y offset and roll, smoothed per frame) in first person while walking on the ground, if the CAMERA_BOBBING setting is on. In third person or with the setting off, it just resets the camera offset; it does nothing when the player speed exceeds 10. |

## Messages

- subscribes `MessageType.SETTING_CHANGED` (l.117)
- subscribes `MessageType.SETTING_CHANGED` (l.118)
