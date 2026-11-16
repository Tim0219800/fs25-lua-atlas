---@meta
-- FS25 1.25.1.0 : player/PlayerCamera.lua (generated stub, FS25 Lua Atlas)

--- Camera of a player, usable in first or third person. It owns the yaw node, the pitch node and the camera root node, handles rotation from input, following the player, zoom and collision distance, first-person view bobbing, and temporary target overrides. It subscribes to the player field-of-view settings. Several helpers it calls (`initialiseCameraNodes`, `switchToPerspective`, `applyZoom`, `getHasOverriddenTarget`, `getBaseOffsetY`) are not in this dump (UNVERIFIED).
---@class PlayerCamera
PlayerCamera = {}

--- Creates the camera for a player, starting in first person with collision on and default zoom, and subscribes to the first- and third-person FOV setting changes. No scene nodes exist yet.
---@param player Player
---@return PlayerCamera
function PlayerCamera.new(player) end

--- Called when the player first loads; delegates to `initialiseCameraNodes` (not in this dump) to build the camera nodes in the scene.
function PlayerCamera:initialise() end

--- Makes this camera the active one in `g_cameraManager`: the first-person camera, the third-person conversation camera while in a conversation, or the normal third-person camera.
function PlayerCamera:makeCurrent() end

--- Switches between first and third person by calling `switchToPerspective` with the opposite of the current mode.
function PlayerCamera:toggleThirdPersonMode() end

--- Returns the stored collision flag. Note: the code simply returns the variable, so it is not forced to false in first person despite what the name might suggest elsewhere.
---@return boolean
function PlayerCamera:getIsCollisionEnabled() end

--- Sets whether the camera collides with objects behind it.
---@param isCollisionEnabled boolean
function PlayerCamera:setIsCollisionEnabled(isCollisionEnabled) end

--- Returns the extra vertical camera offset, used for fine adjustments such as swimming.
---@return number
function PlayerCamera:getOffsetY() end

--- Sets the extra vertical offset, 0 when nil is given.
---@param offsetY number
function PlayerCamera:setOffsetY(offsetY) end

--- Returns the current distance between the camera root and the focus point.
---@return number
function PlayerCamera:getCurrentZoomDistance() end

--- Stores the zoom distance and moves the camera root node back by that amount on its local z axis. The `isForced` parameter is unused.
---@param zoomDistance number
---@param isForced boolean?
function PlayerCamera:setCurrentZoomDistance(zoomDistance, isForced) end

--- Returns the zoom distance the player wants, or 0 in first person.
---@return number
function PlayerCamera:getDesiredZoomDistance() end

--- Returns the world position of the yaw node, which is the point the camera orbits and looks at.
---@return number
---@return number
---@return number
function PlayerCamera:getFocusPosition() end

--- Moves the yaw node to the given world position.
---@param x number
---@param y number
---@param z number
function PlayerCamera:setFocusPosition(x, y, z) end

--- Returns the world position of the camera root node itself.
---@return number
---@return number
---@return number
function PlayerCamera:getCameraPosition() end

--- Returns pitch, yaw and roll computed from the camera's forward direction, which avoids the engine's Euler flipping; roll is read directly from the node.
---@return number
---@return number
---@return number
function PlayerCamera:getRotation() end

--- Applies pitch to the pitch node, yaw to the yaw node and roll to the camera root node (which is also turned by pi). Nil values count as 0.
---@param pitch number
---@param yaw number
---@param roll number
function PlayerCamera:setRotation(pitch, yaw, roll) end

--- Converts a local x/z direction relative to the yaw node into a world x/z direction (the y component is dropped).
---@param directionX number
---@param directionZ number
---@return number
---@return number
function PlayerCamera:calculateWorldDirection(directionX, directionZ) end

--- Converts a world x/z direction into a direction local to the yaw node (the y component is dropped).
---@param directionX number
---@param directionZ number
---@return number
---@return number
function PlayerCamera:calculateLocalDirection(directionX, directionZ) end

--- Rotates the camera from the player's input deltas scaled by the camera sensitivity setting, clamping pitch between `LOWEST_PITCH` and `HIGHEST_PITCH`. While a target override is active it follows the target instead.
---@param dt number
function PlayerCamera:updateRotation(dt) end

--- Per-frame position update: follows the player, applies first-person bobbing and the zoom logic (`applyZoom`, not in this dump). With a target override it only updates from the target.
---@param dt number
function PlayerCamera:updatePosition(dt) end

--- Focuses the camera on the player's graphical (interpolated) position.
function PlayerCamera:focusOnPlayer() end

--- Moves the focus point to the given position plus the current y offset and the base y offset (`getBaseOffsetY`, not in this dump).
---@param x number
---@param y number
---@param z number
function PlayerCamera:focusOnPosition(x, y, z) end

--- Applies camera bobbing (x/y offset and roll, smoothed per frame) in first person while walking on the ground, if the CAMERA_BOBBING setting is on. In third person or with the setting off, it just resets the camera offset; it does nothing when the player speed exceeds 10.
---@param dt number
function PlayerCamera:tryApplyViewBobbing(dt) end
