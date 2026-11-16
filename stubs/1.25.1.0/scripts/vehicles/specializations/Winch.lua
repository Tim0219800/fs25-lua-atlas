---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Winch.lua (generated stub, FS25 Lua Atlas)

--- Always returns true: no prerequisites.
---@param specializations table
---@return boolean
function Winch.prerequisitesPresent(specializations) end

--- Adds the `winch` configuration type (not when the icon generator runs), the store spec `winchMaxMass`, and registers the XML paths for the winch and its configurations, plus object-change paths.
function Winch.initSpecialization() end

--- Registers all XML and savegame paths for ropes (limits, speed, acceleration, nodes, main/setup rope, component joints, attach marker, tree hook, sounds, animation nodes, attached trees) and the `winch#ropeIndices` option for cylindered moving tools and parts.
---@param schema any
---@param baseKey any
function Winch.registerXMLPaths(schema, baseKey) end

--- Adds the winch functions (attach/detach tree, control input, attach mode, trigger and raycast callbacks, tree cut/mounted handlers) to the vehicle type.
---@param vehicleType any
function Winch.registerFunctions(vehicleType) end

--- Overrides extra dependent parts loading/updating, PTO consumption and activity, consuming load, and addToPhysics/removeFromPhysics.
---@param vehicleType any
function Winch.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, load finished, delete, the four stream events, onPostUpdate and onRegisterActionEvents.
---@param vehicleType any
function Winch.registerEventListeners(vehicleType) end

--- Applies the configuration object changes, loads ropes from the base and configuration XML, and if any exist sets up texts, the tree raycast state, message center subscriptions (tree cut, tree mounted, player pre-teleport) and two dirty flags; otherwise removes all its listeners. Note: PLAYER_PRE_TELEPORT is subscribed to `onWinchTreeShapeMounted`, not to `onPlayerPreTeleport` (apparent oversight).
---@param savegame any
function Winch:onLoad(savegame) end

--- Restores trees attached in the savegame (unless vehicles are reset): resolves the saved split shape id and calls `attachTreeToWinch` with the saved hook position and rope positions.
---@param savegame any
function Winch:onLoadFinished(savegame) end

--- Detaches all trees, removes triggers, deletes ropes, marker and hook data, client sounds and animations, and removes both activatables of every rope.
function Winch:onDelete() end

--- Client join: for each rope with attached trees, reads the tree count, hook position and split shape id; attaches immediately if the shape is known, otherwise queues it in `splitShapesToAttach` for onPostUpdate.
---@param streamId integer
---@param connection Connection
function Winch:onReadStream(streamId, connection) end

--- Server side on join: writes, per rope, whether trees are attached, their count minus one, the hook position in tree-local space and the split shape id.
---@param streamId integer
---@param connection Connection
function Winch:onWriteStream(streamId, connection) end

--- Server reads the clients' control input (2 bits per rope, minus 1). Clients read the rope control direction (starting pull/release sounds and animations) and the main rope's physics state.
---@param streamId any
---@param timestamp any
---@param connection any
function Winch:onReadUpdateStream(streamId, timestamp, connection) end

--- Clients send their sent control input when the dirty flag is set. The server writes the control direction and, under the rope dirty flag, the main rope state.
---@param streamId any
---@param connection any
---@param dirtyMask any
function Winch:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Saves, for each rope with trees, the rope index and for each tree the hook world translation, the saveable split shape id parts and the physics rope data.
---@param xmlFile any
---@param key any
---@param usedModNames any
function Winch:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client: finishes queued tree attachments once their shape id resolves. Server: detaches all trees if one no longer exists. Locally, in attach mode it casts an async tree raycast from the player's camera, manages the setup rope (length check, color green/red, auto-cancel when too long), the target marker and activity; also counts down the control timer and stops sounds and animations when it ends.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Winch:onPostUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client: when active for input and the cylindered control group matches (if one is configured), registers the powered actions WINCH_CONTROL_VEHICLE (pull/release) and WINCH_DETACH, then refreshes their active state.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Winch:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Input callback: sends the analog control value to every rope via `setWinchControlInput`.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Winch.actionEventControl(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: detaches the trees from all ropes.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Winch.actionEventDetach(self, actionName, inputValue, callbackState, isAnalog) end

--- Client: enables the control and detach actions only while at least one tree is attached.
---@param self any
function Winch.updateActionEvents(self) end

--- Loads one rope from XML (nodes, limits, speed in m/ms, acceleration, main and setup `ForestryPhysicsRope`, component joints, marker, hook, object changes, sounds, animations, activatables). Returns false if node, trigger node or attach node is missing. Note: `maxTreeBits` is computed as ceil(sqrt(maxNumTrees)) (inferred from the code).
---@param xmlFile any
---@param key any
---@param rope any
function Winch:loadWinchRopeFromXML(xmlFile, key, rope) end

--- Turns the attach mode of a rope on, off, or toggles it when state is nil. Enabling swaps in the attach activatable; disabling hides the marker, destroys the setup rope and restores the activatables according to player range and attached trees.
---@param rope any
---@param state any
function Winch:setWinchTreeAttachMode(rope, state) end

--- Returns whether the given rope is in attach mode.
---@param rope any
function Winch:getIsWinchAttachModeActive(rope) end

--- Returns true when the rope is in attach mode and the raycast currently found a valid tree.
---@param rope any
function Winch:getCanAttachWinchTree(rope) end

--- Confirms the attachment of the targeted tree: on a server checks `getIsWinchTreeAttachAllowed` then attaches or shows the failure warning; on a client sends a `TreeAttachRequestEvent`. Then leaves attach mode.
---@param rope any
function Winch:onAttachTreeInputEvent(rope) end

--- Returns the control direction of the rope whose index (as string) matches `param`, or 1 if none matches; used as a parameter by dependent animation code (UNVERIFIED who calls it).
---@param param any
function Winch:getWinchRopeSpeedFactor(param) end

--- Checks a candidate tree: fails with TOO_HEAVY if the total mass including attached trees exceeds `maxTreeMass`, or TOO_MANY if `maxNumTrees` is reached. Returns a boolean and a reason constant from `TreeAttachResponseEvent`.
---@param ropeIndex any
---@param splitShapeId any
function Winch:getIsWinchTreeAttachAllowed(ropeIndex, splitShapeId) end

--- Shows a blinking warning (2.5 s) for the given failure reason: tree too heavy (with the max mass) or too many trees.
---@param ropeIndex any
---@param reason any
function Winch:showWinchTreeMountFailedWarning(ropeIndex, reason) end

--- Attaches a tree (split shape) to a rope: mounts a cloned hook, creates the main rope for the first tree or an additional sub-rope to the first tree, applies active joint limits and object changes, plays the sound, registers the control activatable, publishes TREE_SHAPE_MOUNTED and sends `TreeAttachEvent` unless `noEventSend`. Does nothing if the hook cannot mount.
---@param splitShapeId any
---@param x any
---@param y any
---@param z any
---@param ropeIndex any
---@param setupRopeData any
---@param noEventSend any
function Winch:attachTreeToWinch(splitShapeId, x, y, z, ropeIndex, setupRopeData, noEventSend) end

--- Detaches all trees of one rope (or of every rope when the index is nil): leaves attach mode, destroys sub-ropes and the main rope, deletes hooks, resets joint limits on the server, resets object changes and activatables, then sends `TreeDetachEvent` unless `noEventSend`.
---@param ropeIndex any
---@param noEventSend any
function Winch:detachTreeFromWinch(ropeIndex, noEventSend) end

--- Applies pull/release input for a rope (only if the winch is not an attachable or is attached). Server: accelerates and calls `adjustLength` on the main rope, updates sounds/animations and raises dirty flags. Client: stores the input to send. Uses the global `g_currentDt`.
---@param ropeIndex any
---@param direction any
function Winch:setWinchControlInput(ropeIndex, direction) end

--- Trigger callback: when the local player enters or leaves a rope's trigger node, sets `isPlayerInRange` and adds or removes the attach activatable (kept while in attach mode).
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function Winch:onWinchPlayerTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

--- Async raycast callback: validates the hit split shape as a tree (not already attached, static trees only for the first one), computes the target and marker position with `SplitShapeUtil.getTreeOffsetPosition`, and flags it valid or invalid depending on the distance to the rope start. Returns false for tree hits.
---@param hitObjectId any
---@param x any
---@param y any
---@param z any
---@param distance any
---@param nx any
---@param ny any
---@param nz any
---@param subShapeIndex any
---@param shapeId any
---@param isLast any
function Winch:onWinchTreeRaycastCallback(hitObjectId, x, y, z, distance, nx, ny, nz, subShapeIndex, shapeId, isLast) end

--- Server only: when a tree shape is cut and the old shape was attached, detaches all trees.
---@param oldShape any
---@param shape any
function Winch:onWinchTreeShapeCut(oldShape, shape) end

--- Server only: when an attached tree is mounted on another vehicle, detaches all trees.
---@param shape any
---@param mountVehicle any
function Winch:onWinchTreeShapeMounted(shape, mountVehicle) end

--- Before the local player teleports, destroys all setup ropes to avoid physics trouble caused by an overly long rope. Note: it is not connected in onLoad (see Winch:onLoad).
---@param player Player
function Winch:onPlayerPreTeleport(player) end

--- Override: after the base loading, reads the optional `winch#ropeIndices` list of a moving part or tool.
---@param superFunc any
---@param xmlFile any
---@param baseName any
---@param entry any
function Winch:loadExtraDependentParts(superFunc, xmlFile, baseName, entry) end

--- Override: after the base update, refreshes the anchor nodes of the main ropes listed in the part's rope indices.
---@param superFunc any
---@param part any
---@param dt any
function Winch:updateExtraDependentParts(superFunc, part, dt) end

--- Override: returns true while any rope has a tree attached, otherwise the previous result.
---@param superFunc any
---@return boolean
function Winch:getDoConsumePtoPower(superFunc) end

--- Override: adds a full load (1) to the previous load value while any rope was controlled recently, and increments the count by one.
---@param superFunc any
function Winch:getConsumingLoad(superFunc) end

--- Override: returns true while any rope has a tree attached, otherwise the previous result.
---@param superFunc any
function Winch:getIsPowerTakeOffActive(superFunc) end

--- Override: after the base call succeeds, recreates the main rope for each rope with an attached tree (used when the vehicle re-enters physics).
---@param superFunc any
function Winch:addToPhysics(superFunc) end

--- Override: destroys the main rope of every rope with attached trees, then calls the previous implementation.
---@param superFunc any
function Winch:removeFromPhysics(superFunc) end

--- Store spec loader: reads the highest `maxTreeMass` over the base ropes and, separately, per winch configuration. Returns a table with `maxTreeMass` and `massByConfig`.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Winch.loadSpecValueMaxMass(xmlFile, customEnvironment, baseDir) end

--- Store spec getter: picks the max tree mass for the chosen configuration (or the highest across configurations) and returns it formatted with the tons unit, as value(s) or string depending on `returnValues`/`returnRange`.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function Winch.getSpecValueMaxMass(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end
