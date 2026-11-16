# vehicles/VehicleCamera.lua

*[Version française](../../fr/scripts/vehicles/VehicleCamera.md)*

Source: `dataS/scripts/vehicles/VehicleCamera.lua` — FS25 1.25.1.0

✍ Third-person or cabin camera of a vehicle (client-side). It wraps a camera node from the vehicle XML and manages rotation, zoom limits, smoothed follow/look-at positions, optional head tracking and seat suspension, collision-avoiding zoom by raycasts, input actions (mouse, gamepad, touch), FOV and savegame persistence of the pose. It registers with `g_cameraManager`, reads `GameSettings`, and sets `g_activeVehicleCamera` while active. Several methods called here (e.g. `updatePrecipitationCollisions`, the console command handlers) are not in the SDK dump.

- **VehicleCamera** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleCamera.new(vehicle: Vehicle, customMt: table?) → table` | 23 | ✍ Creates a camera for a vehicle with zeroed pose and input state, and subscribes to setting changes (active suspension camera, field of view; collision setting only if the FS22 collision mod is loaded or in a development build). |
| `VehicleCamera:loadFromXML(xmlFile: XMLFile, key: string, savegame: any, cameraIndex: any) → boolean` | 69 | ✍ Loads the camera from XML: validates the camera node, optional shadow focus box, inside/outside flags, FOV, rotation and zoom limits, smoothing, head tracking, raycast nodes and object changes. Restores the saved pose from the savegame unless the reset-camera setting applies. Returns false on invalid node or missing limit values. Note: the focus-box check reads `isInside` before it is assigned from XML. |
| `VehicleCamera:onPostLoad(savegame: table)` | 320 | ✍ Resolves the seat suspension node from `suspensionNodeIndex`; if valid, adds its Y offset to the camera origin and creates parent nodes so the camera can follow the suspension. Warns on invalid index or a torso suspension. |
| `VehicleCamera:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 368 | ✍ Writes the camera rotation, translation, zoom and current Y field of view, plus the LOD debug state when that mode is on. |
| `VehicleCamera:delete()` | 386 | ✍ Removes the camera from `g_cameraManager`, deactivates it, deletes the camera node (only when position smoothing created a separate parent structure) and the world parent node, and unsubscribes from setting messages. |
| `VehicleCamera:zoomSmoothly(offset: number)` | 409 | ✍ Changes the zoom target by `offset`, clamped to `transMin`..`transMax` when set; the actual zoom then eases toward it in `update`. The offset is multiplied by 10 in LOD debug mode. |
| `VehicleCamera:raycastCallback(transformId: integer, x: number, y: number, z: number, distance: number, nx: number, ny: number, nz: number)` | 441 | ✍ Raycast callback that stores the hit distance, normal and transform id used by `getCollisionDistance`. |
| `VehicleCamera:update(dt: number)` | 452 | ✍ Per-frame update: eases the zoom, applies look input to X/Y rotation (only when active and no GUI is shown), handles head tracking, adjusts rotation to stay above terrain, shortens zoom on collisions, then updates the smoothed camera pose. Resets the camera if rotation becomes NaN. `dt` is in milliseconds. |
| `VehicleCamera:onActivate()` | 693 | ✍ Activates the camera: optionally resets it, makes it the active camera in `g_cameraManager`, initializes smoothed positions, registers look up/down and left/right input events (and touch gestures if available), applies object changes, sets `g_activeVehicleCamera`. With cheat commands on, registers three console commands. |
| `VehicleCamera:setLODDebugState(state: any, zoom: any)` | 791 | ✍ Toggles the LOD debug mode: when on, allows zoom up to 350 and forces view, LOD and terrain LOD distance coefficients to 1; when off, restores the default zoom, FOV and the coefficients from the graphics settings. |
| `VehicleCamera:setCameraYDebugState(state: any, height: any)` | 817 | ✍ Toggles an orthographic top-down debug view with a given height, locking rotation and hiding the HUD; turning it off restores perspective and HUD. Debug use only. |
| `VehicleCamera:onDeactivate()` | 844 | ✍ Deactivates the camera: removes console commands, input events, touch listeners and object changes, clears precipitation collision bits, leaves LOD debug mode and clears `g_activeVehicleCamera` if it was this camera. |
| `VehicleCamera:actionEventLookUpDown(actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 899 | ✍ Input handler for vertical look: scales the value by 16.666 ms for mouse or by the current frame time otherwise, and accumulates it for the next `update`. |
| `VehicleCamera:touchEventLookUpDown(value: any)` | 918 | ✍ Touch gesture handler for vertical look; converts the gesture value with a screen-height factor and forwards it when the camera is active. |
| `VehicleCamera:touchEventZoomInOut(value: any)` | 927 | ✍ Touch pinch handler: calls `zoomSmoothly(value * 15)` when the camera is active. |
| `VehicleCamera:touchEventLookLeftRight(value: any)` | 935 | ✍ Touch gesture handler for horizontal look; converts the value with a screen aspect-ratio factor and forwards it when the camera is active. |
| `VehicleCamera:actionEventLookLeftRight(actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 944 | ✍ Input handler for horizontal look, scaled like the vertical one and accumulated for `update`. |
| `VehicleCamera:resetCamera()` | 964 | ✍ Restores the original rotation, translation and zoom of the camera, clears the collision-limited zoom and re-aligns smoothed positions. |
| `VehicleCamera:updateRotateNodeRotation()` | 997 | ✍ Applies rotX/rotY/rotZ to the rotate node. Adds steering-based Y rotation for articulated vehicles; in world-XZ mode it builds a direction aligned to the world up axis and falls back to plain rotation near the poles. |
| `VehicleCamera:setSeparateCameraPose()` | 1030 | ✍ Writes the smoothed position and look direction to the real camera node (either from position/look-at/up vectors or from the rotate node). In LOD debug mode it also adjusts FOV and draws the distance text. |
| `VehicleCamera:getTiltDirectionOffset()` | 1076 | ✍ Returns a horizontal up-vector tilt from device gravity when the outdoor camera has tilting enabled and a touchpad device is present, otherwise 0. |
| `VehicleCamera:getCollisionDistance() → boolean, number, number, number, number, number` | 1094 | ✍ Casts rays from the raycast nodes toward the target camera position, ignoring the own vehicle chain, mounted objects, split shapes and triggers. Returns hasCollision, distance, hit normal and normal dot direction; returns false if collision is disabled. |
| `VehicleCamera:onActiveCameraSuspensionSettingChanged(newState: boolean)` | 1212 | ✍ Reacts to the active-suspension-camera setting by linking the camera position node under the suspension parent or the original parent. Only acts when a suspension node exists and the state changed. |
| `VehicleCamera:onFovySettingChanged()` | 1228 | ✍ Recalculates the Y field of view from the default value via `calculateFovY` and applies it to the camera node. |
| `VehicleCamera:onCameraCollisionDetectionSettingChanged(newState: boolean)` | 1238 | ✍ Stores the new state of the camera collision detection setting. |
| `VehicleCamera.registerCameraXMLPaths(schema: any, basePath: any)` | 1285 | ✍ Registers the vehicle camera XML schema: node, rotatable, limits (rotMinX/rotMaxX/transMin/transMax), inside flag, head tracking, shadow focus box, outdoor sounds, rotate node, pose, mirror, world XZ rotation, suspension index, smoothing parameters, raycast nodes and object changes. |
| `VehicleCamera.registerCameraSavegameXMLPaths(schema: any, basePath: any)` | 1321 | ✍ Registers the savegame XML schema for a camera: rotation, translation, zoom, FOV Y and the debug-mode keys. |
| `VehicleCamera.consoleCommandLODDebug()` | 1334 | ✍ Console command that toggles LOD debug mode on the active vehicle camera and returns a status string; asks to enter a vehicle first if none is active. |
| `VehicleCamera.consoleCommandCameraYDebug(height: any)` | 1345 | ✍ Console command that toggles the orthographic Y debug view (optional height) on the active vehicle camera and returns a status string. |

## Messages

- subscribes `MessageType.SETTING_CHANGED` (l.55)
- subscribes `MessageType.SETTING_CHANGED` (l.58)
- subscribes `MessageType.SETTING_CHANGED` (l.59)
