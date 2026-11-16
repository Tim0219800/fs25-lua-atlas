# player/Player.lua

*[Version française](../../fr/scripts/player/Player.md)*

Source: `dataS/scripts/player/Player.lua` — FS25 1.25.1.0

✍ Networked `Object` representing one player character, local or replicated, composed of a capsule controller, mover, graphics component, state machine, input component, camera, targeter, HUD updater and a network component chosen by role (server, local owner, remote). It handles creation, synchronization, hand tool carrying, spawn positions, show/hide (controlled state) and debug display. Many methods used here (e.g. `setStyleAsync`, `teleportTo`, `getPosition`, `hide`, `getCurrentVehicle`) are defined elsewhere in the file or in mixed-in code (UNVERIFIED).

- **Player** inherits from `Object` (l.23)

## Functions

| Function | Line | Description |
|---|---|---|
| `Player.createServerInstance(isClient: boolean, isOwner: boolean, connection: Connection, userId: integer, farmId: integer, userManager: UserManager) → Player` | 209 | ✍ Server-side factory: creates a player for a user and farm, sets its unique id, calls `initialise` and `load` with saved player data, applies the saved or last-used style (default style as fallback), and registers the object on the network. |
| `Player.new(isServer: boolean, isClient: boolean) → Player` | 271 | ✍ Constructor, normally reached through `Object.new`: initializes fields and creates the components (CCT, mover, state machine, graphics, HUD updater, hotspot) without building any scene node yet. |
| `Player:initialise(connection: Connection, isOwner: boolean)` | 392 | ✍ Creates the root transform node, builds the capsule, registers the player as node object, and sets up role-specific parts: input, camera and targeter for the owner, a positional interpolator for others, and the matching network component (server, local or remote). Also subscribes to mission and farm messages. |
| `Player:load(playerData: table?)` | 504 | ✍ Registers console commands and, on the server, restores spawn data and hand tool ids from the player data, then loads the hands, flashlight and starting hand tools asynchronously and teleports to the spawn point. Rebuilds the capsule, finishes owner or remote setup and adds the player to `playerSystem`. |
| `Player:delete()` | 586 | ✍ Cleans up the player: leaves any vehicle or passenger seat, removes it from the player system, cancels pending tool loads, removes obstacles, subscriptions, console commands and hotspot, deletes components, hands the carried tools back and deletes the root node before calling the parent delete. |
| `Player:writeStream(streamId: integer, connection: Connection)` | 700 | ✍ Initial synchronization from server to a joining client: owner flag, foot position, controlled state, farm id, user id, the style if it is not the default, and the hands object if present. |
| `Player:readStream(streamId: integer, connection: Connection, objectId: integer)` | 731 | ✍ Client counterpart of `writeStream`: reads these values, calls `initialise` and `load`, applies the style, teleports the player to the received position and shows or hides it depending on the controlled flag. |
| `Player:writeUpdateStream(streamId: integer, connection: Connection, dirtyMask: integer)` | 776 | ✍ Delegates the dirty-mask update stream writing to the network component, if one exists. |
| `Player:readUpdateStream(streamId: integer, timestamp: integer, connection: Connection)` | 789 | ✍ Delegates the incoming update stream reading to the network component, if one exists. |
| `Player:update(dt: number)` | 818 | ✍ Per-frame update: resolves pending hands and saved hand tools by id, keeps the player active while controlled, updates the HUD updater for the owner with position and yaw, then updates the state machine. |
| `Player:updateTick(dt: number)` | 860 | ✍ Network tick update: forwards to the current state's `updateTick` if that state defines one. |
| `Player:getUniqueUserId() → string?` | 1015 | ✍ Returns the persistent unique user id of this player. |
| `Player:setUniqueUserId(uniqueUserId: string)` | 1026 | ✍ Sets the unique user id once; trying to change an existing different id logs an error and is ignored. |
| `Player:onPickupHandTool(handTool: any)` | 1098 | ✍ Adds the hand tool to the carried list and tells it which player carries it. Returns false for a nil tool, true otherwise. |
| `Player:onDropHandTool(handTool: any)` | 1111 | ✍ Removes the tool from the carried list, unequipping it first if held, refreshes the flashlight state and clears its carrying player; logs an error and a call stack if it was not carried. Note: the log line reads the tool before the nil check. |
| `Player:getCanPickupHandTool(handTool: any)` | 1136 | ✍ Returns true if the tool is not nil, the player has access to it through the mission access handler, and the carry limit (`getReachedHandToolLimit`) is not reached. |
| `Player:getIsHoldingHandTool() → boolean` | 1311 | ✍ Returns whether a hand tool is currently held, based on `getHeldHandTool`. |
| `Player:getIsCarryingHandTool(handTool: HandTool) → boolean` | 1335 | ✍ Returns whether the given tool is in the carried list (held or in the backpack). |
| `Player:getCarriedHandToolMass() → number` | 1342 | ✍ Returns the summed `mass` of every carried hand tool. |
| `Player:getMapPositionAndLookYaw() → number, number, number` | 1357 | ✍ Returns the player's x and z position plus the yaw of the current camera view direction, for map display. |
| `Player:updateControlledState(isControlled: boolean, skipModel: any, skipMover: any)` | 1857 | ✍ Calls `show` or `hide` according to the requested state; does nothing if the state is unchanged. |
| `Player:findSpawnPositionAndYaw() → number, number, number, number` | 1889 | ✍ Picks the spawn position and yaw in order: saved player spawn, auto-load parameters (terrain height plus 0.2), the farm spawn point (or the mission start point on an invalid new save), else 0,0,0 with an error log. |
| `Player:findEmptyAreaAroundPosition(x: number, y: number, z: number) → number, number, number` | 1933 | ✍ Placeholder: returns the given position unchanged; the search for a free area is marked as not yet implemented. |
| `Player:getHasSpawnPosition() → boolean` | 1970 | ✍ Returns true if all three spawn position components are set. |
| `Player:getSpawnPosition() → number?, number?, number?` | 1979 | ✍ Returns the stored spawn x, y and z, which are nil if unset. |
| `Player:getHasSpawnYaw() → boolean` | 1998 | ✍ Returns true if a spawn yaw is stored. |
| `Player:getSpawnYaw() → number?` | 2005 | ✍ Returns the stored spawn yaw, or nil. |
| `Player:setSpawnYaw(spawnYaw: number?)` | 2012 | ✍ Stores the spawn yaw (number or nil). |
| `Player:getMovementYaw() → number` | 2047 | ✍ Returns the movement yaw of the player as given by its mover. |
| `Player:show(skipShowingModel: any, skipEnablingMover: any, ignoreLocalCheck: any)` | 2154 | ✍ Makes the player controlled and visible: raises it active, sets the owner connection and dirty flag on the server, publishes `OWN_PLAYER_ENTERED`, for the owner makes the camera current and registers input, and sets model visibility. Also adds the shallow-water and AI obstacles, the map hotspot, the traffic-system entry, and resets the current hand tool. Skipped if deleted or if a local control flag is set (unless overridden). |
| `Player:debugDraw(x: number, y: number, textSize: number) → number` | 2665 | ✍ Draws debug overlays: the enabled flag list for the owner, the root node, then text sections for state, movement, input, graphics, hand tools and network depending on `Player.currentDebugFlag`; returns the next y position. |

## Messages

- subscribes `MessageType.PLAYER_FARM_CHANGED` (l.407)
- publishes `MessageType.OWN_PLAYER_ENTERED` (l.2189)
