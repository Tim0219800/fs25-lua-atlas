---@meta
-- FS25 1.25.1.0 : vehicles/specializations/YarderTower.lua (generated stub, FS25 Lua Atlas)

--- Always returns true: no prerequisite specialization.
---@param specializations table
---@return boolean
function YarderTower.prerequisitesPresent(specializations) end

--- Registers the store spec types `yarderMaxLength` and `yarderMaxMass`, the whole `vehicle.yarderTower` XML schema (control trigger, placement, carriage, hooks, setup/main/pull/push/support ropes, sounds, motor effects) and the savegame attributes for rope state, carriage position, target and attached trees.
function YarderTower.initSpecialization() end

--- Declares the XML keys shared by all rope kinds: sag offset, rope i3d file and node path, diameter, rotation node, nodes driven by the rope length (rotation, translation, scale, shader parameter) and object changes. Note: onLoad uses a default sag of 0.4 whereas the schema documents 0.1.
---@param schema any
---@param baseKey any
function YarderTower.registerRopeXMLPaths(schema, baseKey) end

--- Registers the vehicle event `onYarderCarriageTreeAttached`, raised by the carriage when a tree is attached.
---@param vehicleType any
function YarderTower.registerEvents(vehicleType) end

--- Adds the yarder API to the vehicle type: setup mode, target activation, carriage follow/move/lift input, support rope setup, rope updates, placement validation, range queries, status info and the raycast/overlap/trigger callbacks.
---@param vehicleType any
function YarderTower.registerFunctions(vehicleType) end

--- Overrides detach, fold, lowering, PTO power, consuming load, PTO activity, dirt, wear, damage usage and physics add/remove.
---@param vehicleType any
function YarderTower.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, load-end, pre-delete, delete, network streams, update, the carriage's tree-attached event and post-attach.
---@param vehicleType any
function YarderTower.registerEventListeners(vehicleType) end

--- Reads all yarder settings from XML, validates required parts (control trigger with PLAYER collision flag, carriage store item, hooks, setup and main rope nodes), loads rope i3d files, sounds, motor effects and texts. If anything is invalid it logs an error and removes the runtime listeners; otherwise it creates the setup and control activatables and the HUD extension. Defaults used here (support rope maxAngle 22.5) differ from the schema (15).
---@param savegame any
function YarderTower:onLoad(savegame) end

--- From the savegame, restores the active state, carriage position, main rope target and the saved attached-tree data, and re-activates the target without sending an event.
---@param savegame table
function YarderTower:onLoadEnd(savegame) end

--- Deactivates the yarder target before deletion if the main rope is active, so carriage and registrations are cleaned up.
function YarderTower:onPreDelete() end

--- Removes the HUD extension, the control trigger, shared i3d requests, hooks, sounds, motor effects and both activatables.
function YarderTower:onDelete() end

--- Saves whether the main rope is active, the carriage position and the target coordinates, and asks the carriage vehicle to save its attached trees.
---@param xmlFile any
---@param key any
---@param usedModNames any
function YarderTower:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client on join: reads the follow-mode state and, if the rope is active, the target position, then activates the target locally.
---@param streamId integer
---@param connection Connection
function YarderTower:onReadStream(streamId, connection) end

--- Server on join: writes the follow-mode state, the rope-active flag and, if active, the target position.
---@param streamId integer
---@param connection Connection
function YarderTower:onWriteStream(streamId, connection) end

--- Server side: reads the carriage move and lift input directions sent by a client (stored as sign + 1).
---@param streamId any
---@param timestamp any
---@param connection any
function YarderTower:onReadUpdateStream(streamId, timestamp, connection) end

--- Client side: when the dirty flag is set, writes the sign of the last move and lift input for the server.
---@param streamId any
---@param connection any
---@param dirtyMask any
function YarderTower:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Large per-frame update. In setup mode: raycasts for a tree, validates the main rope placement, drives sounds and the rope colour. When the main rope is active: server moves the carriage along the rope with acceleration and follow modes, may start the attacher vehicle's motor and feed PTO load, places the carriage vehicle; all sides update ropes, carriage sounds, HUD and motor sound/effects. The condition on `updateRopesDirtyTime` is always true because of an `or true`.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function YarderTower:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Event handler: remembers the carriage's current position as the pickup position for follow mode and refreshes the control action texts.
---@param treeId any
function YarderTower:onYarderCarriageTreeAttached(treeId) end

--- After the tower is attached to a vehicle, registers a function on the root vehicle that blocks driving while the yarder is set up.
---@param attacherVehicle any
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param loadFromSavegame any
function YarderTower:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

--- Callback for the shared i3d load of a hook: links the first child to the root node, hides it and stores it in the hook data, then deletes the loaded i3d.
---@param i3dNode any
---@param failedReason any
---@param hookData any
function YarderTower:onHookI3DLoaded(i3dNode, failedReason, hookData) end

--- Callback for a rope i3d load: links the rope shape found by the configured path to the rope's node (or the vehicle root), hides it and stores it, then deletes the loaded i3d.
---@param i3dNode any
---@param failedReason any
---@param ropeData any
function YarderTower:onRopeI3DLoaded(i3dNode, failedReason, ropeData) end

--- Returns true if setup mode can be entered or left; when entering it requires the implement lowered and unfolded within limits if configured. Otherwise returns false and a warning text.
function YarderTower:getIsSetupModeChangeAllowed() end

--- Toggles (or sets) setup mode: plays start/cancel sounds, deactivates any existing target and shows or hides the setup rope; removes the setup activatable when leaving if the player is outside the trigger.
---@param state any
---@param canceled any
function YarderTower:setYarderSetupModeState(state, canceled) end

--- Activates or removes the main rope anchor. Activating mounts hooks on the target tree, registers with g_splitShapeManager, sets up support ropes, makes the tower components kinematic and (server) loads the carriage vehicle; deactivating reverses this and deletes the carriage. Sends YarderTowerSetTargetEvent unless `noEventSend`.
---@param state any
---@param noEventSend any
function YarderTower:setYarderTargetActive(state, noEventSend) end

--- Sets the carriage follow mode (none, follow player, pickup position or home; constants defined elsewhere, UNVERIFIED here). On the server it tracks the requesting player and listens for that player's deletion; sends YarderTowerFollowModeEvent unless `noEventSend`.
---@param state any
---@param connection any
---@param noEventSend any
function YarderTower:setYarderCarriageFollowMode(state, connection, noEventSend) end

--- Stores a move direction with its timestamp (cancelling any follow mode) and raises the dirty flag so the input reaches the server.
---@param direction any
function YarderTower:setYarderCarriageMoveInput(direction) end

--- Stores a lift direction with its timestamp and raises the dirty flag so the input reaches the server.
---@param direction any
function YarderTower:setYarderCarriageLiftInput(direction) end

--- Forwards the attach-tree action to the carriage vehicle. Errors if no carriage exists.
function YarderTower:onYarderCarriageAttach() end

--- Forwards the detach-tree action to the carriage vehicle. Errors if no carriage exists.
function YarderTower:onYarderCarriageDetach() end

--- Finds trees around the center node with a sphere overlap, assigns each support rope the best tree by smallest angle (resolving conflicts), and for ropes without a tree starts an async raycast to anchor a ground hook.
function YarderTower:setupSupportRopes() end

--- Callback after the carriage vehicle is loaded: on success stores it, links it to the tower, listens for its deletion and removes it from physics until positioned; otherwise logs an error.
---@param vehicles any
---@param vehicleLoadState any
---@param arguments any
function YarderTower:onCreateCarriageFinished(vehicles, vehicleLoadState, arguments) end

--- Delete listener: clears the stored carriage vehicle reference and the in-range flag.
---@param rope any
---@param state any
function YarderTower:onCarriageVehicleDeleted(rope, state) end

--- Shows or hides a rope: sets its active flag, rope node visibility and object changes; when hiding, resets its rotation node, deletes its hook and resets length-driven nodes.
---@param rope any
---@param state any
function YarderTower:setYarderRopeState(rope, state) end

--- Aims a rope from its start node to a target point, updates its shader length/bend parameters and bounding sphere and its length-driven nodes, only when the length changed. Returns the sag offset used.
---@param rope any
---@param tx any
---@param ty any
---@param tz any
---@param dt any
---@param isSupportRope any
---@param emissiveColor any
function YarderTower:updateYarderRope(rope, tx, ty, tz, dt, isSupportRope, emissiveColor) end

--- Interpolates rotation, translation, scale and shader parameter of the rope's length-driven nodes between their min and max settings according to the rope length.
---@param rope any
---@param length any
function YarderTower:updateYarderRopeLengthNodes(rope, length) end

--- Looks up a split shape (tree) near a world position with the engine `findSplitShape` and returns its id (nil or 0 if none).
---@param x any
---@param y any
---@param z any
---@param maxRadius any
function YarderTower:getTreeAtPosition(x, y, z, maxRadius) end

--- Returns true if the local player's farm owns the tower and the player is in the control trigger or in setup mode.
function YarderTower:getIsPlayerInYarderRange() end

--- Returns whether a position (default the local player) lies within the maximum control distance of the main rope line, plus the distance. Returns false while the player is inside the setup trigger or for another farm.
---@param x any
---@param y any
---@param z any
function YarderTower:getIsPlayerInYarderControlRange(x, y, z) end

--- Returns true when the carriage vehicle exists, i.e. the yarder is set up.
function YarderTower:getYarderIsSetUp() end

--- Returns status for the HUD: player available, carriage loaded with trees, player position along the rope, carriage position, follow mode, whether the local player is followed and the target position (if any).
function YarderTower:getYarderStatusInfo() end

--- Returns the distance from the main rope start to its target, or 0 if no valid target exists.
function YarderTower:getYarderMainRopeLength() end

--- Returns the carriage's last measured speed as a 0 to 1 fraction of the maximum speed.
function YarderTower:getYarderCarriageLastSpeed() end

--- Returns true if the given tree shape holds the main rope or one of the support ropes.
---@param shape any
function YarderTower:getIsTreeShapeUsedForYarderSetup(shape) end

--- Trigger callback: when the local player enters or leaves the control trigger, sets the in-range flag and adds or removes the setup activatable.
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function YarderTower:onYarderControlTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

--- Setup raycast callback: keeps the first unsplit tree hit and its height as the aimed tree, otherwise clears it.
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
function YarderTower:onYarderTreeRaycastCallback(hitObjectId, x, y, z, distance, nx, ny, nz, subShapeIndex, shapeId, isLast) end

--- Validates a main rope target: height rule (uphill), angle, tree diameter and length limits, then starts an async raycast to check the path is clear. Results go to the callback data's function with a failure reason.
---@param ropeNode any
---@param treeId any
---@param ex any
---@param ey any
---@param ez any
---@param maxAngle any
---@param maxLength any
---@param clearance any
---@param minTreeDiameter any
---@param callbackData any
function YarderTower:doRopePlacementValidation(ropeNode, treeId, ex, ey, ez, maxAngle, maxLength, clearance, minTreeDiameter, callbackData) end

--- Raycast callback for the clear-path check: any hit means the way is blocked; reaching the last result with no hit reports success.
---@param callbackData any
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
function YarderTower.onYarderMainTreeRaycastCallback(callbackData, hitObjectId, x, y, z, distance, nx, ny, nz, subShapeIndex, shapeId, isLast) end

--- Receives the validation result: during setup it stores validity and target, and shows a blinking warning for too long, wrong angle, small tree, blocked path or non-uphill placement.
---@param isValid any
---@param x any
---@param y any
---@param z any
---@param reason any
function YarderTower:onMainRopePlacementValidated(isValid, x, y, z, reason) end

--- Raycast callback for support ropes: on a terrain hit it creates a ground hook at that point, plays the ground-link sound and activates the rope; with no hit at the last result it deactivates the rope.
---@param supportRope any
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
function YarderTower.onYarderSupportTerrainRaycastCallback(supportRope, hitObjectId, x, y, z, distance, nx, ny, nz, subShapeIndex, shapeId, isLast) end

--- Overlap callback: collects found trees for support ropes, excluding the tree used by the main rope.
---@param objectId any
function YarderTower:onSupportRopeTreeOverlapCallback(objectId, ...) end

--- Delete listener for the followed player: resets the carriage follow mode to none.
function YarderTower:onYarderTowerPlayerDeleted() end

--- Forbids detaching the tower from its carrier while the main rope is active if the tower requires an attacher vehicle (returns false and a warning); otherwise defers to the parent.
---@param superFunc any
---@return boolean
function YarderTower:isDetachAllowed(superFunc) end

--- Returns false while the main rope is active; otherwise defers to the parent.
---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function YarderTower:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

--- Returns false while the main rope is active; otherwise defers to the parent.
---@param superFunc any
function YarderTower:getAllowsLowering(superFunc) end

--- Returns true while the main rope is active, otherwise the parent value.
---@param superFunc any
---@return boolean
function YarderTower:getDoConsumePtoPower(superFunc) end

--- Adds one load entry to the parent result when active: 5 % base plus up to 95 % scaled by the carriage's last speed.
---@param superFunc any
function YarderTower:getConsumingLoad(superFunc) end

--- Returns true when the main rope is active and the attacher vehicle's motor is running; otherwise the parent value.
---@param superFunc any
function YarderTower:getIsPowerTakeOffActive(superFunc) end

--- Adds a work dirt contribution proportional to the carriage speed while the main rope is active.
---@param superFunc any
---@return number
function YarderTower:getDirtMultiplier(superFunc) end

--- Adds a work wear contribution proportional to the carriage speed while the main rope is active.
---@param superFunc any
---@return number
function YarderTower:getWearMultiplier(superFunc) end

--- While active, returns true only when the carriage moved recently and the vehicle is not a mission vehicle; otherwise defers to the parent.
---@param superFunc any
function YarderTower:getUsageCausesDamage(superFunc) end

--- Calls the parent and, if the main rope is active, sets every component to a kinematic rigid body.
---@param superFunc any
function YarderTower:addToPhysics(superFunc) end

--- If the main rope is active, restores dynamic rigid bodies on all components, then calls the parent.
---@param superFunc any
function YarderTower:removeFromPhysics(superFunc) end

--- Function registered on the root vehicle: returns false with a warning text while the yarder rope is active, so the carrier cannot be driven.
---@param self any
function YarderTower.getIsVehicleControlAllowed(self) end

--- Store spec loader: reads the main rope's `maxLength` from the vehicle XML.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function YarderTower.loadSpecValueMaxLength(xmlFile, customEnvironment, baseDir) end

--- Store spec formatter: returns the max rope length in meters as text, or the raw value (and range) depending on the flags; nothing if the value is 0.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function YarderTower.getSpecValueMaxLength(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

--- Store spec loader: reads the carriage's `maxTreeMass` from the vehicle XML.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function YarderTower.loadSpecValueMaxMass(xmlFile, customEnvironment, baseDir) end

--- Store spec formatter: returns the max tree mass in tonnes with one decimal as text, or the raw value (and range) depending on the flags; nothing if the value is 0.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function YarderTower.getSpecValueMaxMass(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end
