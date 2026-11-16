# gui/base/GuiTopDownCamera.lua

*[Version française](../../../fr/scripts/gui/base/GuiTopDownCamera.md)*

Source: `dataS/scripts/gui/base/GuiTopDownCamera.lua` — FS25 1.25.1.0

✍ Bird's-eye camera controller used by UI modes that act on the world, such as placing objects or editing terrain. It owns a scene camera on a base node, follows the terrain height, and smoothly moves, zooms, tilts and rotates from input actions or mouse edge scrolling, clamped by the placeable system boundary. It swaps the active camera through g_cameraManager and shows the mouse cursor while active. Constants (CAMERA_*, ROTATION_*, MOVE_*, COLLISION_MASK) and the constructor are not in the visible bodies of the dump (UNVERIFIED). Client-side only.

- **GuiTopDownCamera** (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `GuiTopDownCamera:createCameraNodes() → integer, integer` | 114 | ✍ Creates a 60 degree field-of-view camera (near 1, far 10000) as a child of a base transform group placed at height 110 and offset 5 behind it, enables fast shadow updates, and returns the camera node and the base node. |
| `GuiTopDownCamera:delete()` | 130 | ✍ Deactivates the camera if active, removes it from g_cameraManager, deletes the base node (and the camera child) and resets state. |
| `GuiTopDownCamera:reset()` | 143 | ✍ Clears the terrain reference and size, the stored previous camera and the cursor-catching flag. |
| `GuiTopDownCamera:setTerrainRootNode(terrainRootNode: any)` | 152 | ✍ Stores the terrain root node used for height queries and reads the terrain size from the engine. |
| `GuiTopDownCamera:activate()` | 159 | ✍ Shows the mouse cursor, remembers the active camera and switches to this one, centres it on the local player's position, registers input actions and subscribes to INPUT_MODE_CHANGED. |
| `GuiTopDownCamera:deactivate()` | 179 | ✍ Marks the camera inactive, unsubscribes from messages, removes input actions, hides the cursor and restores the previously active camera. |
| `GuiTopDownCamera:getIsActive()` | 198 | ✍ Returns whether the camera is currently active. |
| `GuiTopDownCamera:setCameraPosition(mapX: number, mapZ: number)` | 206 | ✍ Jumps the camera and its target to a map X/Z position without smoothing, then refreshes the camera nodes. |
| `GuiTopDownCamera:determineMapPosition() → number, number, number, number` | 218 | ✍ Returns the camera X, 0, Z, then the Y rotation in radians minus pi, and a final 0. Note: the doc comment lists four values but five are returned. |
| `GuiTopDownCamera:getPickRay()` | 224 | ✍ Returns the picking ray for the current mouse position through this camera, using RaycastUtil.getCameraPickingRay. A disabled early-return for cursor capture is left commented out in the code. |
| `GuiTopDownCamera:updatePosition()` | 235 | ✍ Recomputes camera placement: base height from the highest terrain sample on a 3x3 grid (2 m step) plus an offset, tilt and distance from zoom and tilt factors, then raises the camera if terrain or colliding objects would put it too close to the ground. |
| `GuiTopDownCamera:applyMovement(dt: any)` | 287 | ✍ Eases position, zoom, tilt and rotation toward their targets, using a step proportional to the remaining distance divided by dt and snapping when below 0.0001. Zoom and tilt are clamped to [0, 1]. |
| `GuiTopDownCamera:setMouseEdgeScrollingActive(isActive: any)` | 330 | ✍ Enables or disables camera scrolling when the cursor is near the screen edge. |
| `GuiTopDownCamera:setEdgeScrollingOffset(xMin: number, yMin: number, xMax: number, yMax: number)` | 340 | ✍ Sets the screen rectangle (min/max X and Y, in screen coordinates) inside which edge scrolling is detected, so UI panels are excluded. nil values keep the current one. |
| `GuiTopDownCamera:getMouseEdgeScrollingMovement() → X, Z` | 351 | ✍ Returns X and Z movement values in [-1, 1] that ramp up as the cursor enters a thin margin at the edges of the edge-scrolling rectangle, and 0, 0 elsewhere. |
| `GuiTopDownCamera:update(dt: any)` | 380 | ✍ Per-frame update: while active, and in mouse mode or when gamepad movement is not disabled, runs updateMovement and then clears the accumulated input. |
| `GuiTopDownCamera:updateMovement(dt: dt)` | 393 | ✍ Applies zoom, rotation, tilt and planar movement inputs to the targets (edge scrolling if no movement input), scales speed with zoom, rotates the direction by the camera heading, limits the target to the placeable boundary, then smooths and updates the camera. The doc mentions a movementMultiplier parameter that does not exist. |
| `GuiTopDownCamera:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any)` | 435 | ✍ Tracks the mouse position in mouse mode. After a rotate or tilt drag it restores the cursor and warps it to screen centre; ignored in the same frame as an action or while the cursor is locked. |
| `GuiTopDownCamera:resetInputState()` | 460 | ✍ Sets the zoom, side, forward, tilt and rotate input accumulators back to zero. |
| `GuiTopDownCamera:registerActionEvents()` | 470 | ✍ Registers input events for player move side/forward and the construction camera zoom, rotate and tilt axes, with low text priority; move events are hidden from the help text. |
| `GuiTopDownCamera:removeActionEvents()` | 491 | ✍ Removes every input action event registered by this camera object. |
| `GuiTopDownCamera:onZoom(_: any, inputValue: any, _: any, isAnalog: any, isMouse: any)` | 501 | ✍ Zoom axis callback: stores a zoom input that scales with the current zoom level, halved for analog sticks and adjusted for mouse wheel; ignored for mouse input when mouseDisabled is set. |
| `GuiTopDownCamera:onMoveSide(_: any, inputValue: any)` | 518 | ✍ Move-side axis callback: stores the lateral input scaled by a factor and divided by g_currentDt. |
| `GuiTopDownCamera:onMoveForward(_: any, inputValue: any)` | 524 | ✍ Move-forward axis callback: stores the forward input scaled by a factor and divided by g_currentDt. |
| `GuiTopDownCamera:onRotate(_: any, inputValue: any, _: any, isAnalog: any, isMouse: any)` | 530 | ✍ Rotate axis callback: stores the (inverted, scaled) rotation input; with mouse input it hides the cursor and starts cursor catching. Ignored for the mouse when mouseDisabled is set. |
| `GuiTopDownCamera:onTilt(_: any, inputValue: any, _: any, isAnalog: any, isMouse: any)` | 556 | ✍ Tilt axis callback: stores the scaled tilt input; with mouse input it hides the cursor and starts cursor catching. Ignored for the mouse when mouseDisabled is set. |
| `GuiTopDownCamera:onInputModeChanged(inputMode: any)` | 582 | ✍ Sets mouse mode when the first element of the input mode equals the keyboard help mode; otherwise recentres the stored mouse position. |

## Messages

- subscribes `MessageType.INPUT_MODE_CHANGED` (l.172)
