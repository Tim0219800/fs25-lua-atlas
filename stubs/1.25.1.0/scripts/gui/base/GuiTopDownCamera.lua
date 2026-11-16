---@meta
-- FS25 1.25.1.0 : gui/base/GuiTopDownCamera.lua (generated stub, FS25 Lua Atlas)

--- Bird's-eye camera controller used by UI modes that act on the world, such as placing objects or editing terrain. It owns a scene camera on a base node, follows the terrain height, and smoothly moves, zooms, tilts and rotates from input actions or mouse edge scrolling, clamped by the placeable system boundary. It swaps the active camera through g_cameraManager and shows the mouse cursor while active. Constants (CAMERA_*, ROTATION_*, MOVE_*, COLLISION_MASK) and the constructor are not in the visible bodies of the dump (UNVERIFIED). Client-side only.
---@class GuiTopDownCamera
GuiTopDownCamera = {}

--- Creates a 60 degree field-of-view camera (near 1, far 10000) as a child of a base transform group placed at height 110 and offset 5 behind it, enables fast shadow updates, and returns the camera node and the base node.
---@return integer
---@return integer
function GuiTopDownCamera:createCameraNodes() end

--- Deactivates the camera if active, removes it from g_cameraManager, deletes the base node (and the camera child) and resets state.
function GuiTopDownCamera:delete() end

--- Clears the terrain reference and size, the stored previous camera and the cursor-catching flag.
function GuiTopDownCamera:reset() end

--- Stores the terrain root node used for height queries and reads the terrain size from the engine.
---@param terrainRootNode any
function GuiTopDownCamera:setTerrainRootNode(terrainRootNode) end

--- Shows the mouse cursor, remembers the active camera and switches to this one, centres it on the local player's position, registers input actions and subscribes to INPUT_MODE_CHANGED.
function GuiTopDownCamera:activate() end

--- Marks the camera inactive, unsubscribes from messages, removes input actions, hides the cursor and restores the previously active camera.
function GuiTopDownCamera:deactivate() end

--- Returns whether the camera is currently active.
function GuiTopDownCamera:getIsActive() end

--- Jumps the camera and its target to a map X/Z position without smoothing, then refreshes the camera nodes.
---@param mapX number
---@param mapZ number
function GuiTopDownCamera:setCameraPosition(mapX, mapZ) end

--- Returns the camera X, 0, Z, then the Y rotation in radians minus pi, and a final 0. Note: the doc comment lists four values but five are returned.
---@return number
---@return number
---@return number
---@return number
function GuiTopDownCamera:determineMapPosition() end

--- Returns the picking ray for the current mouse position through this camera, using RaycastUtil.getCameraPickingRay. A disabled early-return for cursor capture is left commented out in the code.
function GuiTopDownCamera:getPickRay() end

--- Recomputes camera placement: base height from the highest terrain sample on a 3x3 grid (2 m step) plus an offset, tilt and distance from zoom and tilt factors, then raises the camera if terrain or colliding objects would put it too close to the ground.
function GuiTopDownCamera:updatePosition() end

--- Eases position, zoom, tilt and rotation toward their targets, using a step proportional to the remaining distance divided by dt and snapping when below 0.0001. Zoom and tilt are clamped to [0, 1].
---@param dt any
function GuiTopDownCamera:applyMovement(dt) end

--- Enables or disables camera scrolling when the cursor is near the screen edge.
---@param isActive any
function GuiTopDownCamera:setMouseEdgeScrollingActive(isActive) end

--- Sets the screen rectangle (min/max X and Y, in screen coordinates) inside which edge scrolling is detected, so UI panels are excluded. nil values keep the current one.
---@param xMin number
---@param yMin number
---@param xMax number
---@param yMax number
function GuiTopDownCamera:setEdgeScrollingOffset(xMin, yMin, xMax, yMax) end

--- Returns X and Z movement values in [-1, 1] that ramp up as the cursor enters a thin margin at the edges of the edge-scrolling rectangle, and 0, 0 elsewhere.
---@return X
---@return Z
function GuiTopDownCamera:getMouseEdgeScrollingMovement() end

--- Per-frame update: while active, and in mouse mode or when gamepad movement is not disabled, runs updateMovement and then clears the accumulated input.
---@param dt any
function GuiTopDownCamera:update(dt) end

--- Applies zoom, rotation, tilt and planar movement inputs to the targets (edge scrolling if no movement input), scales speed with zoom, rotates the direction by the camera heading, limits the target to the placeable boundary, then smooths and updates the camera. The doc mentions a movementMultiplier parameter that does not exist.
---@param dt dt
function GuiTopDownCamera:updateMovement(dt) end

--- Tracks the mouse position in mouse mode. After a rotate or tilt drag it restores the cursor and warps it to screen centre; ignored in the same frame as an action or while the cursor is locked.
---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
function GuiTopDownCamera:mouseEvent(posX, posY, isDown, isUp, button) end

--- Sets the zoom, side, forward, tilt and rotate input accumulators back to zero.
function GuiTopDownCamera:resetInputState() end

--- Registers input events for player move side/forward and the construction camera zoom, rotate and tilt axes, with low text priority; move events are hidden from the help text.
function GuiTopDownCamera:registerActionEvents() end

--- Removes every input action event registered by this camera object.
function GuiTopDownCamera:removeActionEvents() end

--- Zoom axis callback: stores a zoom input that scales with the current zoom level, halved for analog sticks and adjusted for mouse wheel; ignored for mouse input when mouseDisabled is set.
---@param _ any
---@param inputValue any
---@param _ any
---@param isAnalog any
---@param isMouse any
function GuiTopDownCamera:onZoom(_, inputValue, _, isAnalog, isMouse) end

--- Move-side axis callback: stores the lateral input scaled by a factor and divided by g_currentDt.
---@param _ any
---@param inputValue any
function GuiTopDownCamera:onMoveSide(_, inputValue) end

--- Move-forward axis callback: stores the forward input scaled by a factor and divided by g_currentDt.
---@param _ any
---@param inputValue any
function GuiTopDownCamera:onMoveForward(_, inputValue) end

--- Rotate axis callback: stores the (inverted, scaled) rotation input; with mouse input it hides the cursor and starts cursor catching. Ignored for the mouse when mouseDisabled is set.
---@param _ any
---@param inputValue any
---@param _ any
---@param isAnalog any
---@param isMouse any
function GuiTopDownCamera:onRotate(_, inputValue, _, isAnalog, isMouse) end

--- Tilt axis callback: stores the scaled tilt input; with mouse input it hides the cursor and starts cursor catching. Ignored for the mouse when mouseDisabled is set.
---@param _ any
---@param inputValue any
---@param _ any
---@param isAnalog any
---@param isMouse any
function GuiTopDownCamera:onTilt(_, inputValue, _, isAnalog, isMouse) end

--- Sets mouse mode when the first element of the input mode equals the keyboard help mode; otherwise recentres the stored mouse position.
---@param inputMode any
function GuiTopDownCamera:onInputModeChanged(inputMode) end
