---@meta
-- FS25 1.25.1.0 : player/Player.lua (generated stub, FS25 Lua Atlas)

--- Networked `Object` representing one player character, local or replicated, composed of a capsule controller, mover, graphics component, state machine, input component, camera, targeter, HUD updater and a network component chosen by role (server, local owner, remote). It handles creation, synchronization, hand tool carrying, spawn positions, show/hide (controlled state) and debug display. Many methods used here (e.g. `setStyleAsync`, `teleportTo`, `getPosition`, `hide`, `getCurrentVehicle`) are defined elsewhere in the file or in mixed-in code (UNVERIFIED).
---@class Player : Object
Player = {}

--- Server-side factory: creates a player for a user and farm, sets its unique id, calls `initialise` and `load` with saved player data, applies the saved or last-used style (default style as fallback), and registers the object on the network.
---@param isClient boolean
---@param isOwner boolean
---@param connection Connection
---@param userId integer
---@param farmId integer
---@param userManager UserManager
---@return Player
function Player.createServerInstance(isClient, isOwner, connection, userId, farmId, userManager) end

--- Constructor, normally reached through `Object.new`: initializes fields and creates the components (CCT, mover, state machine, graphics, HUD updater, hotspot) without building any scene node yet.
---@param isServer boolean
---@param isClient boolean
---@return Player
function Player.new(isServer, isClient) end

--- Creates the root transform node, builds the capsule, registers the player as node object, and sets up role-specific parts: input, camera and targeter for the owner, a positional interpolator for others, and the matching network component (server, local or remote). Also subscribes to mission and farm messages.
---@param connection Connection
---@param isOwner boolean
function Player:initialise(connection, isOwner) end

--- Registers console commands and, on the server, restores spawn data and hand tool ids from the player data, then loads the hands, flashlight and starting hand tools asynchronously and teleports to the spawn point. Rebuilds the capsule, finishes owner or remote setup and adds the player to `playerSystem`.
---@param playerData table?
function Player:load(playerData) end

--- Cleans up the player: leaves any vehicle or passenger seat, removes it from the player system, cancels pending tool loads, removes obstacles, subscriptions, console commands and hotspot, deletes components, hands the carried tools back and deletes the root node before calling the parent delete.
function Player:delete() end

--- Initial synchronization from server to a joining client: owner flag, foot position, controlled state, farm id, user id, the style if it is not the default, and the hands object if present.
---@param streamId integer
---@param connection Connection
function Player:writeStream(streamId, connection) end

--- Client counterpart of `writeStream`: reads these values, calls `initialise` and `load`, applies the style, teleports the player to the received position and shows or hides it depending on the controlled flag.
---@param streamId integer
---@param connection Connection
---@param objectId integer
function Player:readStream(streamId, connection, objectId) end

--- Delegates the dirty-mask update stream writing to the network component, if one exists.
---@param streamId integer
---@param connection Connection
---@param dirtyMask integer
function Player:writeUpdateStream(streamId, connection, dirtyMask) end

--- Delegates the incoming update stream reading to the network component, if one exists.
---@param streamId integer
---@param timestamp integer
---@param connection Connection
function Player:readUpdateStream(streamId, timestamp, connection) end

--- Per-frame update: resolves pending hands and saved hand tools by id, keeps the player active while controlled, updates the HUD updater for the owner with position and yaw, then updates the state machine.
---@param dt number
function Player:update(dt) end

--- Network tick update: forwards to the current state's `updateTick` if that state defines one.
---@param dt number
function Player:updateTick(dt) end

--- Returns the persistent unique user id of this player.
---@return string?
function Player:getUniqueUserId() end

--- Sets the unique user id once; trying to change an existing different id logs an error and is ignored.
---@param uniqueUserId string
function Player:setUniqueUserId(uniqueUserId) end

--- Adds the hand tool to the carried list and tells it which player carries it. Returns false for a nil tool, true otherwise.
---@param handTool any
function Player:onPickupHandTool(handTool) end

--- Removes the tool from the carried list, unequipping it first if held, refreshes the flashlight state and clears its carrying player; logs an error and a call stack if it was not carried. Note: the log line reads the tool before the nil check.
---@param handTool any
function Player:onDropHandTool(handTool) end

--- Returns true if the tool is not nil, the player has access to it through the mission access handler, and the carry limit (`getReachedHandToolLimit`) is not reached.
---@param handTool any
function Player:getCanPickupHandTool(handTool) end

--- Returns whether a hand tool is currently held, based on `getHeldHandTool`.
---@return boolean
function Player:getIsHoldingHandTool() end

--- Returns whether the given tool is in the carried list (held or in the backpack).
---@param handTool HandTool
---@return boolean
function Player:getIsCarryingHandTool(handTool) end

--- Returns the summed `mass` of every carried hand tool.
---@return number
function Player:getCarriedHandToolMass() end

--- Returns the player's x and z position plus the yaw of the current camera view direction, for map display.
---@return number
---@return number
---@return number
function Player:getMapPositionAndLookYaw() end

--- Calls `show` or `hide` according to the requested state; does nothing if the state is unchanged.
---@param isControlled boolean
---@param skipModel any
---@param skipMover any
function Player:updateControlledState(isControlled, skipModel, skipMover) end

--- Picks the spawn position and yaw in order: saved player spawn, auto-load parameters (terrain height plus 0.2), the farm spawn point (or the mission start point on an invalid new save), else 0,0,0 with an error log.
---@return number
---@return number
---@return number
---@return number
function Player:findSpawnPositionAndYaw() end

--- Placeholder: returns the given position unchanged; the search for a free area is marked as not yet implemented.
---@param x number
---@param y number
---@param z number
---@return number
---@return number
---@return number
function Player:findEmptyAreaAroundPosition(x, y, z) end

--- Returns true if all three spawn position components are set.
---@return boolean
function Player:getHasSpawnPosition() end

--- Returns the stored spawn x, y and z, which are nil if unset.
---@return number?
---@return number?
---@return number?
function Player:getSpawnPosition() end

--- Returns true if a spawn yaw is stored.
---@return boolean
function Player:getHasSpawnYaw() end

--- Returns the stored spawn yaw, or nil.
---@return number?
function Player:getSpawnYaw() end

--- Stores the spawn yaw (number or nil).
---@param spawnYaw number?
function Player:setSpawnYaw(spawnYaw) end

--- Returns the movement yaw of the player as given by its mover.
---@return number
function Player:getMovementYaw() end

--- Makes the player controlled and visible: raises it active, sets the owner connection and dirty flag on the server, publishes `OWN_PLAYER_ENTERED`, for the owner makes the camera current and registers input, and sets model visibility. Also adds the shallow-water and AI obstacles, the map hotspot, the traffic-system entry, and resets the current hand tool. Skipped if deleted or if a local control flag is set (unless overridden).
---@param skipShowingModel any
---@param skipEnablingMover any
---@param ignoreLocalCheck any
function Player:show(skipShowingModel, skipEnablingMover, ignoreLocalCheck) end

--- Draws debug overlays: the enabled flag list for the owner, the root node, then text sections for state, movement, input, graphics, hand tools and network depending on `Player.currentDebugFlag`; returns the next y position.
---@param x number
---@param y number
---@param textSize number
---@return number
function Player:debugDraw(x, y, textSize) end
