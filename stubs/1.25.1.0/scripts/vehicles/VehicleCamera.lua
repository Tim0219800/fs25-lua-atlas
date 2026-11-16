---@meta
-- FS25 1.25.1.0 : vehicles/VehicleCamera.lua (generated stub, FS25 Lua Atlas)

--- Third-person or cabin camera of a vehicle (client-side). It wraps a camera node from the vehicle XML and manages rotation, zoom limits, smoothed follow/look-at positions, optional head tracking and seat suspension, collision-avoiding zoom by raycasts, input actions (mouse, gamepad, touch), FOV and savegame persistence of the pose. It registers with `g_cameraManager`, reads `GameSettings`, and sets `g_activeVehicleCamera` while active. Several methods called here (e.g. `updatePrecipitationCollisions`, the console command handlers) are not in the SDK dump.
---@class VehicleCamera
VehicleCamera = {}

--- Creates a camera for a vehicle with zeroed pose and input state, and subscribes to setting changes (active suspension camera, field of view; collision setting only if the FS22 collision mod is loaded or in a development build).
---@param vehicle Vehicle
---@param customMt table?
---@return table
function VehicleCamera.new(vehicle, customMt) end

--- Loads the camera from XML: validates the camera node, optional shadow focus box, inside/outside flags, FOV, rotation and zoom limits, smoothing, head tracking, raycast nodes and object changes. Restores the saved pose from the savegame unless the reset-camera setting applies. Returns false on invalid node or missing limit values. Note: the focus-box check reads `isInside` before it is assigned from XML.
---@param xmlFile XMLFile
---@param key string
---@param savegame any
---@param cameraIndex any
---@return boolean
function VehicleCamera:loadFromXML(xmlFile, key, savegame, cameraIndex) end

--- Resolves the seat suspension node from `suspensionNodeIndex`; if valid, adds its Y offset to the camera origin and creates parent nodes so the camera can follow the suspension. Warns on invalid index or a torso suspension.
---@param savegame table
function VehicleCamera:onPostLoad(savegame) end

--- Writes the camera rotation, translation, zoom and current Y field of view, plus the LOD debug state when that mode is on.
---@param xmlFile any
---@param key any
---@param usedModNames any
function VehicleCamera:saveToXMLFile(xmlFile, key, usedModNames) end

--- Removes the camera from `g_cameraManager`, deactivates it, deletes the camera node (only when position smoothing created a separate parent structure) and the world parent node, and unsubscribes from setting messages.
function VehicleCamera:delete() end

--- Changes the zoom target by `offset`, clamped to `transMin`..`transMax` when set; the actual zoom then eases toward it in `update`. The offset is multiplied by 10 in LOD debug mode.
---@param offset number
function VehicleCamera:zoomSmoothly(offset) end

--- Raycast callback that stores the hit distance, normal and transform id used by `getCollisionDistance`.
---@param transformId integer
---@param x number
---@param y number
---@param z number
---@param distance number
---@param nx number
---@param ny number
---@param nz number
function VehicleCamera:raycastCallback(transformId, x, y, z, distance, nx, ny, nz) end

--- Per-frame update: eases the zoom, applies look input to X/Y rotation (only when active and no GUI is shown), handles head tracking, adjusts rotation to stay above terrain, shortens zoom on collisions, then updates the smoothed camera pose. Resets the camera if rotation becomes NaN. `dt` is in milliseconds.
---@param dt number
function VehicleCamera:update(dt) end

--- Activates the camera: optionally resets it, makes it the active camera in `g_cameraManager`, initializes smoothed positions, registers look up/down and left/right input events (and touch gestures if available), applies object changes, sets `g_activeVehicleCamera`. With cheat commands on, registers three console commands.
function VehicleCamera:onActivate() end

--- Toggles the LOD debug mode: when on, allows zoom up to 350 and forces view, LOD and terrain LOD distance coefficients to 1; when off, restores the default zoom, FOV and the coefficients from the graphics settings.
---@param state any
---@param zoom any
function VehicleCamera:setLODDebugState(state, zoom) end

--- Toggles an orthographic top-down debug view with a given height, locking rotation and hiding the HUD; turning it off restores perspective and HUD. Debug use only.
---@param state any
---@param height any
function VehicleCamera:setCameraYDebugState(state, height) end

--- Deactivates the camera: removes console commands, input events, touch listeners and object changes, clears precipitation collision bits, leaves LOD debug mode and clears `g_activeVehicleCamera` if it was this camera.
function VehicleCamera:onDeactivate() end

--- Input handler for vertical look: scales the value by 16.666 ms for mouse or by the current frame time otherwise, and accumulates it for the next `update`.
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
function VehicleCamera:actionEventLookUpDown(actionName, inputValue, callbackState, isAnalog, isMouse) end

--- Touch gesture handler for vertical look; converts the gesture value with a screen-height factor and forwards it when the camera is active.
---@param value any
function VehicleCamera:touchEventLookUpDown(value) end

--- Touch pinch handler: calls `zoomSmoothly(value * 15)` when the camera is active.
---@param value any
function VehicleCamera:touchEventZoomInOut(value) end

--- Touch gesture handler for horizontal look; converts the value with a screen aspect-ratio factor and forwards it when the camera is active.
---@param value any
function VehicleCamera:touchEventLookLeftRight(value) end

--- Input handler for horizontal look, scaled like the vertical one and accumulated for `update`.
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
function VehicleCamera:actionEventLookLeftRight(actionName, inputValue, callbackState, isAnalog, isMouse) end

--- Restores the original rotation, translation and zoom of the camera, clears the collision-limited zoom and re-aligns smoothed positions.
function VehicleCamera:resetCamera() end

--- Applies rotX/rotY/rotZ to the rotate node. Adds steering-based Y rotation for articulated vehicles; in world-XZ mode it builds a direction aligned to the world up axis and falls back to plain rotation near the poles.
function VehicleCamera:updateRotateNodeRotation() end

--- Writes the smoothed position and look direction to the real camera node (either from position/look-at/up vectors or from the rotate node). In LOD debug mode it also adjusts FOV and draws the distance text.
function VehicleCamera:setSeparateCameraPose() end

--- Returns a horizontal up-vector tilt from device gravity when the outdoor camera has tilting enabled and a touchpad device is present, otherwise 0.
function VehicleCamera:getTiltDirectionOffset() end

--- Casts rays from the raycast nodes toward the target camera position, ignoring the own vehicle chain, mounted objects, split shapes and triggers. Returns hasCollision, distance, hit normal and normal dot direction; returns false if collision is disabled.
---@return boolean
---@return number
---@return number
---@return number
---@return number
---@return number
function VehicleCamera:getCollisionDistance() end

--- Reacts to the active-suspension-camera setting by linking the camera position node under the suspension parent or the original parent. Only acts when a suspension node exists and the state changed.
---@param newState boolean
function VehicleCamera:onActiveCameraSuspensionSettingChanged(newState) end

--- Recalculates the Y field of view from the default value via `calculateFovY` and applies it to the camera node.
function VehicleCamera:onFovySettingChanged() end

--- Stores the new state of the camera collision detection setting.
---@param newState boolean
function VehicleCamera:onCameraCollisionDetectionSettingChanged(newState) end

--- Registers the vehicle camera XML schema: node, rotatable, limits (rotMinX/rotMaxX/transMin/transMax), inside flag, head tracking, shadow focus box, outdoor sounds, rotate node, pose, mirror, world XZ rotation, suspension index, smoothing parameters, raycast nodes and object changes.
---@param schema any
---@param basePath any
function VehicleCamera.registerCameraXMLPaths(schema, basePath) end

--- Registers the savegame XML schema for a camera: rotation, translation, zoom, FOV Y and the debug-mode keys.
---@param schema any
---@param basePath any
function VehicleCamera.registerCameraSavegameXMLPaths(schema, basePath) end

--- Console command that toggles LOD debug mode on the active vehicle camera and returns a status string; asks to enter a vehicle first if none is active.
function VehicleCamera.consoleCommandLODDebug() end

--- Console command that toggles the orthographic Y debug view (optional height) on the active vehicle camera and returns a status string.
---@param height any
function VehicleCamera.consoleCommandCameraYDebug(height) end
