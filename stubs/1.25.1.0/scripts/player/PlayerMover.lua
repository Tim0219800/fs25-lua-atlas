---@meta
-- FS25 1.25.1.0 : player/PlayerMover.lua (generated stub, FS25 Lua Atlas)

--- Turns movement requests into actual on-foot player motion: accumulates forces, applies them through the player's capsule controller (CCT), and tracks speed, velocity, grounded/air/fall timers, water submersion (swimming) and a debug flight mode. It exposes an `onPositionTeleport` listener list and marks the player's dirty flag so the changes get synchronized. Helpers such as `getPosition`, `updateDeltas`, `updateRotation`, `updateFlightCollision`, `getIsPhysicsEnabled` and `calculateWadeScalar` are not in this dump (UNVERIFIED).
---@class PlayerMover
PlayerMover = {}

--- Creates the mover for a player with zeroed forces, velocity and timers, reserves a dirty flag from the player, and creates the `onPositionTeleport` listener list. A TODO in the code about the dirty flag is left unresolved.
---@param player Player
---@return PlayerMover
function PlayerMover.new(player) end

--- Called when the player first loads: creates a transform group in the scene root that marks the movement direction.
function PlayerMover:initialise() end

--- Returns a speed interpolated between minimum and maximum by the move scalar. With wading enabled it returns 0 for a zero scalar, uses the swim speed as minimum when deeply submerged, and slows the scalar by the submersion depth.
---@param moveScalar number
---@param doWading boolean
---@param minimumSpeed number
---@param maximumSpeed number
---@return number
function PlayerMover:calculateSmoothSpeed(moveScalar, doWading, minimumSpeed, maximumSpeed) end

--- Inverts the flight mode through `setFlightActive`. Has no effect unless the flight command is turned on.
function PlayerMover:toggleFlightActive() end

--- Turns flight on or off and then refreshes the player's collision. Unless `isForced` is set, it is ignored when the player's flight command is missing or its value is false.
---@param isFlightActive boolean
---@param isForced boolean?
function PlayerMover:setFlightActive(isFlightActive, isForced) end

--- Returns whether player collision is configured to be off while flying.
---@return boolean
function PlayerMover:getIsFlightCollisionDisabled() end

--- Sets whether collision is disabled while flying and immediately refreshes the collision state through `updateFlightCollision`.
---@param isFlightCollisionDisabled boolean
function PlayerMover:setIsFlightCollisionDisabled(isFlightCollisionDisabled) end

--- Returns the yaw of the movement direction in world space; the visual model follows it smoothly.
---@return number
function PlayerMover:getMovementYaw() end

--- Moves the player's capsule controller to the given position (optionally also setting the node translation) and raises the default dirty flag.
---@param x number
---@param y number
---@param z number
---@param setNodeTranslation boolean?
function PlayerMover:setPosition(x, y, z, setNodeTranslation) end

--- Returns the stored horizontal speed of the player (m/s).
---@return number
function PlayerMover:getSpeed() end

--- Publishes `PLAYER_PRE_TELEPORT`, tells the server through a `PlayerTeleportEvent` when called by an owning client (unless `noEventSend`), remembers the old position, sets the new one and invokes `onPositionTeleport`.
---@param x number
---@param y number
---@param z number
---@param setNodeTranslation boolean?
---@param noEventSend boolean?
function PlayerMover:teleportTo(x, y, z, setNodeTranslation, noEventSend) end

--- Adds an x/z movement to this frame's accumulated force and raises the dirty flag. The position itself is not changed until the next update.
---@param currentForceX number
---@param currentForceZ number
function PlayerMover:moveHorizontally(currentForceX, currentForceZ) end

--- Adds a y movement to this frame's accumulated force and raises the dirty flag. The position itself is not changed until the next update.
---@param currentForceY number
function PlayerMover:moveVertically(currentForceY) end

--- Updates grounded state, ground distance, close-to-ground flag and the ground, air and fall timers. When airborne it raycasts down (up to 200 m, from 10 m above the player) against terrain, static objects and roads, and falls back to y = 0 if nothing is hit.
---@param dt number
---@param isGrounded any
---@param currentX any
---@param currentY any
---@param currentZ any
function PlayerMover:updateFloorDistance(dt, isGrounded, currentX, currentY, currentZ) end

--- Raycast callback for the ground check: stores the hit height as ground level when an object was hit.
---@param hitObjectId number
---@param x number
---@param y number
---@param z number
function PlayerMover:onGroundRaycastCallback(hitObjectId, x, y, z) end

--- Starts an asynchronous downward raycast (6 m, from 3 m above the player) against the water collision group; the result is handled in `onWaterRaycastCallback`.
---@param currentX any
---@param currentY any
---@param currentZ any
function PlayerMover:updateWaterSubmergeDistance(currentX, currentY, currentZ) end

--- Computes submersion depth from the water hit height and the player y position stored when the ray was cast, then sets `isInWater`, `needSwimming` and `isSwimming` (the latter with a 0.2 lower threshold than `needSwimming`).
---@param hitObjectId number
---@param x number
---@param y number
---@param z number
function PlayerMover:onWaterRaycastCallback(hitObjectId, x, y, z) end

--- Per-frame update: if physics are enabled, computes the position deltas and moves the capsule controller. It then checks ground contact (server or physics-enabled only), refreshes water and floor data, and updates the movement yaw and rotation velocity.
---@param dt number
function PlayerMover:update(dt) end

--- Draws the movement direction node and debug text lines for position, velocity, yaw, speed, water and ground data. Returns the next y position.
---@param x number
---@param y number
---@param textSize number
---@return number
function PlayerMover:debugDraw(x, y, textSize) end
