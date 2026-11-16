# vehicles/specializations/YarderTower.lua

*[Version française](../../../fr/scripts/vehicles/specializations/YarderTower.md)*

Source: `dataS/scripts/vehicles/specializations/YarderTower.lua` — FS25 1.25.1.0

✍ Specialization for the tower of a forestry yarder (cable crane). The player enters a setup mode, aims at a tree and, if the placement is valid (angle, length, tree diameter, clear path, uphill rule), the main rope is anchored. The server then spawns a separate carriage vehicle (see YarderCarriage) that moves along the rope, while support ropes attach to nearby trees or the ground and the tower becomes kinematic. It has no prerequisites, uses YarderTowerSetupActivatable, YarderTowerControlActivatable and a HUD extension, registers store specs (max length, max mass) and saves its rope state, carriage position and attached trees in the savegame. Network sync goes through YarderTowerSetTargetEvent and YarderTowerFollowModeEvent plus an input update stream from client to server.


## Functions

| Function | Line | Description |
|---|---|---|
| `YarderTower.prerequisitesPresent(specializations: table) → boolean` | 49 | ✍ Always returns true: no prerequisite specialization. |
| `YarderTower.initSpecialization()` | 55 | ✍ Registers the store spec types `yarderMaxLength` and `yarderMaxMass`, the whole `vehicle.yarderTower` XML schema (control trigger, placement, carriage, hooks, setup/main/pull/push/support ropes, sounds, motor effects) and the savegame attributes for rope state, carriage position, target and attached trees. |
| `YarderTower.registerRopeXMLPaths(schema: any, baseKey: any)` | 148 | ✍ Declares the XML keys shared by all rope kinds: sag offset, rope i3d file and node path, diameter, rotation node, nodes driven by the rope length (rotation, translation, scale, shader parameter) and object changes. Note: onLoad uses a default sag of 0.4 whereas the schema documents 0.1. |
| `YarderTower.registerEvents(vehicleType: any)` | 176 | ✍ Registers the vehicle event `onYarderCarriageTreeAttached`, raised by the carriage when a tree is attached. |
| `YarderTower.registerFunctions(vehicleType: any)` | 182 | ✍ Adds the yarder API to the vehicle type: setup mode, target activation, carriage follow/move/lift input, support rope setup, rope updates, placement validation, range queries, status info and the raycast/overlap/trigger callbacks. |
| `YarderTower.registerOverwrittenFunctions(vehicleType: any)` | 218 | ✍ Overrides detach, fold, lowering, PTO power, consuming load, PTO activity, dirt, wear, damage usage and physics add/remove. |
| `YarderTower.registerEventListeners(vehicleType: any)` | 234 | ✍ Subscribes to load, load-end, pre-delete, delete, network streams, update, the carriage's tree-attached event and post-attach. |
| `YarderTower:onLoad(savegame: any)` | 250 | ✍ Reads all yarder settings from XML, validates required parts (control trigger with PLAYER collision flag, carriage store item, hooks, setup and main rope nodes), loads rope i3d files, sounds, motor effects and texts. If anything is invalid it logs an error and removes the runtime listeners; otherwise it creates the setup and control activatables and the HUD extension. Defaults used here (support rope maxAngle 22.5) differ from the schema (15). |
| `YarderTower:onLoadEnd(savegame: table)` | 560 | ✍ From the savegame, restores the active state, carriage position, main rope target and the saved attached-tree data, and re-activates the target without sending an event. |
| `YarderTower:onPreDelete()` | 582 | ✍ Deactivates the yarder target before deletion if the main rope is active, so carriage and registrations are cleaned up. |
| `YarderTower:onDelete()` | 591 | ✍ Removes the HUD extension, the control trigger, shared i3d requests, hooks, sounds, motor effects and both activatables. |
| `YarderTower:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 644 | ✍ Saves whether the main rope is active, the carriage position and the target coordinates, and asks the carriage vehicle to save its attached trees. |
| `YarderTower:onReadStream(streamId: integer, connection: Connection)` | 663 | ✍ Client on join: reads the follow-mode state and, if the rope is active, the target position, then activates the target locally. |
| `YarderTower:onWriteStream(streamId: integer, connection: Connection)` | 681 | ✍ Server on join: writes the follow-mode state, the rope-active flag and, if active, the target position. |
| `YarderTower:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 693 | ✍ Server side: reads the carriage move and lift input directions sent by a client (stored as sign + 1). |
| `YarderTower:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 704 | ✍ Client side: when the dirty flag is set, writes the sign of the last move and lift input for the server. |
| `YarderTower:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 717 | ✍ Large per-frame update. In setup mode: raycasts for a tree, validates the main rope placement, drives sounds and the rope colour. When the main rope is active: server moves the carriage along the rope with acceleration and follow modes, may start the attacher vehicle's motor and feed PTO load, places the carriage vehicle; all sides update ropes, carriage sounds, HUD and motor sound/effects. The condition on `updateRopesDirtyTime` is always true because of an `or true`. |
| `YarderTower:onYarderCarriageTreeAttached(treeId: any)` | 1099 | ✍ Event handler: remembers the carriage's current position as the pickup position for follow mode and refreshes the control action texts. |
| `YarderTower:onPostAttach(attacherVehicle: any, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 1107 | ✍ After the tower is attached to a vehicle, registers a function on the root vehicle that blocks driving while the yarder is set up. |
| `YarderTower:onHookI3DLoaded(i3dNode: any, failedReason: any, hookData: any)` | 1116 | ✍ Callback for the shared i3d load of a hook: links the first child to the root node, hides it and stores it in the hook data, then deletes the loaded i3d. |
| `YarderTower:onRopeI3DLoaded(i3dNode: any, failedReason: any, ropeData: any)` | 1131 | ✍ Callback for a rope i3d load: links the rope shape found by the configured path to the rope's node (or the vehicle root), hides it and stores it, then deletes the loaded i3d. |
| `YarderTower:getIsSetupModeChangeAllowed()` | 1147 | ✍ Returns true if setup mode can be entered or left; when entering it requires the implement lowered and unfolded within limits if configured. Otherwise returns false and a warning text. |
| `YarderTower:setYarderSetupModeState(state: any, canceled: any)` | 1171 | ✍ Toggles (or sets) setup mode: plays start/cancel sounds, deactivates any existing target and shows or hides the setup rope; removes the setup activatable when leaving if the player is outside the trigger. |
| `YarderTower:setYarderTargetActive(state: any, noEventSend: any)` | 1199 | ✍ Activates or removes the main rope anchor. Activating mounts hooks on the target tree, registers with g_splitShapeManager, sets up support ropes, makes the tower components kinematic and (server) loads the carriage vehicle; deactivating reverses this and deletes the carriage. Sends YarderTowerSetTargetEvent unless `noEventSend`. |
| `YarderTower:setYarderCarriageFollowMode(state: any, connection: any, noEventSend: any)` | 1333 | ✍ Sets the carriage follow mode (none, follow player, pickup position or home; constants defined elsewhere, UNVERIFIED here). On the server it tracks the requesting player and listens for that player's deletion; sends YarderTowerFollowModeEvent unless `noEventSend`. |
| `YarderTower:setYarderCarriageMoveInput(direction: any)` | 1375 | ✍ Stores a move direction with its timestamp (cancelling any follow mode) and raises the dirty flag so the input reaches the server. |
| `YarderTower:setYarderCarriageLiftInput(direction: any)` | 1392 | ✍ Stores a lift direction with its timestamp and raises the dirty flag so the input reaches the server. |
| `YarderTower:onYarderCarriageAttach()` | 1405 | ✍ Forwards the attach-tree action to the carriage vehicle. Errors if no carriage exists. |
| `YarderTower:onYarderCarriageDetach()` | 1411 | ✍ Forwards the detach-tree action to the carriage vehicle. Errors if no carriage exists. |
| `YarderTower:setupSupportRopes()` | 1417 | ✍ Finds trees around the center node with a sphere overlap, assigns each support rope the best tree by smallest angle (resolving conflicts), and for ropes without a tree starts an async raycast to anchor a ground hook. |
| `YarderTower:onCreateCarriageFinished(vehicles: any, vehicleLoadState: any, arguments: any)` | 1546 | ✍ Callback after the carriage vehicle is loaded: on success stores it, links it to the tower, listens for its deletion and removes it from physics until positioned; otherwise logs an error. |
| `YarderTower:onCarriageVehicleDeleted(rope: any, state: any)` | 1563 | ✍ Delete listener: clears the stored carriage vehicle reference and the in-range flag. |
| `YarderTower:setYarderRopeState(rope: any, state: any)` | 1571 | ✍ Shows or hides a rope: sets its active flag, rope node visibility and object changes; when hiding, resets its rotation node, deletes its hook and resets length-driven nodes. |
| `YarderTower:updateYarderRope(rope: any, tx: any, ty: any, tz: any, dt: any, isSupportRope: any, emissiveColor: any)` | 1600 | ✍ Aims a rope from its start node to a target point, updates its shader length/bend parameters and bounding sphere and its length-driven nodes, only when the length changed. Returns the sag offset used. |
| `YarderTower:updateYarderRopeLengthNodes(rope: any, length: any)` | 1643 | ✍ Interpolates rotation, translation, scale and shader parameter of the rope's length-driven nodes between their min and max settings according to the rope length. |
| `YarderTower:getTreeAtPosition(x: any, y: any, z: any, maxRadius: any)` | 1676 | ✍ Looks up a split shape (tree) near a world position with the engine `findSplitShape` and returns its id (nil or 0 if none). |
| `YarderTower:getIsPlayerInYarderRange()` | 1686 | ✍ Returns true if the local player's farm owns the tower and the player is in the control trigger or in setup mode. |
| `YarderTower:getIsPlayerInYarderControlRange(x: any, y: any, z: any)` | 1698 | ✍ Returns whether a position (default the local player) lies within the maximum control distance of the main rope line, plus the distance. Returns false while the player is inside the setup trigger or for another farm. |
| `YarderTower:getYarderIsSetUp()` | 1728 | ✍ Returns true when the carriage vehicle exists, i.e. the yarder is set up. |
| `YarderTower:getYarderStatusInfo()` | 1734 | ✍ Returns status for the HUD: player available, carriage loaded with trees, player position along the rope, carriage position, follow mode, whether the local player is followed and the target position (if any). |
| `YarderTower:getYarderMainRopeLength()` | 1762 | ✍ Returns the distance from the main rope start to its target, or 0 if no valid target exists. |
| `YarderTower:getYarderCarriageLastSpeed()` | 1776 | ✍ Returns the carriage's last measured speed as a 0 to 1 fraction of the maximum speed. |
| `YarderTower:getIsTreeShapeUsedForYarderSetup(shape: any)` | 1783 | ✍ Returns true if the given tree shape holds the main rope or one of the support ropes. |
| `YarderTower:onYarderControlTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 1806 | ✍ Trigger callback: when the local player enters or leaves the control trigger, sets the in-range flag and adds or removes the setup activatable. |
| `YarderTower:onYarderTreeRaycastCallback(hitObjectId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 1825 | ✍ Setup raycast callback: keeps the first unsplit tree hit and its height as the aimed tree, otherwise clears it. |
| `YarderTower:doRopePlacementValidation(ropeNode: any, treeId: any, ex: any, ey: any, ez: any, maxAngle: any, maxLength: any, clearance: any, minTreeDiameter: any, callbackData: any)` | 1845 | ✍ Validates a main rope target: height rule (uphill), angle, tree diameter and length limits, then starts an async raycast to check the path is clear. Results go to the callback data's function with a failure reason. |
| `YarderTower.onYarderMainTreeRaycastCallback(callbackData: any, hitObjectId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 1884 | ✍ Raycast callback for the clear-path check: any hit means the way is blocked; reaching the last result with no hit reports success. |
| `YarderTower:onMainRopePlacementValidated(isValid: any, x: any, y: any, z: any, reason: any)` | 1898 | ✍ Receives the validation result: during setup it stores validity and target, and shows a blinking warning for too long, wrong angle, small tree, blocked path or non-uphill placement. |
| `YarderTower.onYarderSupportTerrainRaycastCallback(supportRope: any, hitObjectId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 1928 | ✍ Raycast callback for support ropes: on a terrain hit it creates a ground hook at that point, plays the ground-link sound and activates the rope; with no hit at the last result it deactivates the rope. |
| `YarderTower:onSupportRopeTreeOverlapCallback(objectId: any, ...: any)` | 1957 | ✍ Overlap callback: collects found trees for support ropes, excluding the tree used by the main rope. |
| `YarderTower:onYarderTowerPlayerDeleted()` | 1966 | ✍ Delete listener for the followed player: resets the carriage follow mode to none. |
| `YarderTower:isDetachAllowed(superFunc: any) → boolean` | 1974 | ✍ Forbids detaching the tower from its carrier while the main rope is active if the tower requires an attacher vehicle (returns false and a warning); otherwise defers to the parent. |
| `YarderTower:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 1990 | ✍ Returns false while the main rope is active; otherwise defers to the parent. |
| `YarderTower:getAllowsLowering(superFunc: any)` | 2001 | ✍ Returns false while the main rope is active; otherwise defers to the parent. |
| `YarderTower:getDoConsumePtoPower(superFunc: any) → boolean` | 2013 | ✍ Returns true while the main rope is active, otherwise the parent value. |
| `YarderTower:getConsumingLoad(superFunc: any)` | 2024 | ✍ Adds one load entry to the parent result when active: 5 % base plus up to 95 % scaled by the carriage's last speed. |
| `YarderTower:getIsPowerTakeOffActive(superFunc: any)` | 2038 | ✍ Returns true when the main rope is active and the attacher vehicle's motor is running; otherwise the parent value. |
| `YarderTower:getDirtMultiplier(superFunc: any) → number` | 2056 | ✍ Adds a work dirt contribution proportional to the carriage speed while the main rope is active. |
| `YarderTower:getWearMultiplier(superFunc: any) → number` | 2070 | ✍ Adds a work wear contribution proportional to the carriage speed while the main rope is active. |
| `YarderTower:getUsageCausesDamage(superFunc: any)` | 2083 | ✍ While active, returns true only when the carriage moved recently and the vehicle is not a mission vehicle; otherwise defers to the parent. |
| `YarderTower:addToPhysics(superFunc: any)` | 2094 | ✍ Calls the parent and, if the main rope is active, sets every component to a kinematic rigid body. |
| `YarderTower:removeFromPhysics(superFunc: any)` | 2114 | ✍ If the main rope is active, restores dynamic rigid bodies on all components, then calls the parent. |
| `YarderTower.getIsVehicleControlAllowed(self: any)` | 2135 | ✍ Function registered on the root vehicle: returns false with a warning text while the yarder rope is active, so the carrier cannot be driven. |
| `YarderTower.loadSpecValueMaxLength(xmlFile: any, customEnvironment: any, baseDir: any)` | 2146 | ✍ Store spec loader: reads the main rope's `maxLength` from the vehicle XML. |
| `YarderTower.getSpecValueMaxLength(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 2152 | ✍ Store spec formatter: returns the max rope length in meters as text, or the raw value (and range) depending on the flags; nothing if the value is 0. |
| `YarderTower.loadSpecValueMaxMass(xmlFile: any, customEnvironment: any, baseDir: any)` | 2168 | ✍ Store spec loader: reads the carriage's `maxTreeMass` from the vehicle XML. |
| `YarderTower.getSpecValueMaxMass(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 2174 | ✍ Store spec formatter: returns the max tree mass in tonnes with one decimal as text, or the raw value (and range) depending on the flags; nothing if the value is 0. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onYarderCarriageTreeAttached` | 177 |
| registerFunction | `onHookI3DLoaded` | 183 |
| registerFunction | `onRopeI3DLoaded` | 184 |
| registerFunction | `getIsSetupModeChangeAllowed` | 185 |
| registerFunction | `setYarderSetupModeState` | 186 |
| registerFunction | `setYarderTargetActive` | 187 |
| registerFunction | `setYarderCarriageFollowMode` | 188 |
| registerFunction | `setYarderCarriageMoveInput` | 189 |
| registerFunction | `setYarderCarriageLiftInput` | 190 |
| registerFunction | `onYarderCarriageAttach` | 191 |
| registerFunction | `onYarderCarriageDetach` | 192 |
| registerFunction | `setupSupportRopes` | 193 |
| registerFunction | `onCreateCarriageFinished` | 194 |
| registerFunction | `onCarriageVehicleDeleted` | 195 |
| registerFunction | `setYarderRopeState` | 196 |
| registerFunction | `updateYarderRope` | 197 |
| registerFunction | `updateYarderRopeLengthNodes` | 198 |
| registerFunction | `getTreeAtPosition` | 199 |
| registerFunction | `getIsPlayerInYarderRange` | 200 |
| registerFunction | `getIsPlayerInYarderControlRange` | 201 |
| registerFunction | `getYarderIsSetUp` | 202 |
| registerFunction | `getYarderStatusInfo` | 203 |
| registerFunction | `getYarderMainRopeLength` | 204 |
| registerFunction | `getYarderCarriageLastSpeed` | 205 |
| registerFunction | `getIsTreeShapeUsedForYarderSetup` | 206 |
| registerFunction | `onYarderControlTriggerCallback` | 207 |
| registerFunction | `onYarderTreeRaycastCallback` | 208 |
| registerFunction | `doRopePlacementValidation` | 209 |
| registerFunction | `onMainRopePlacementValidated` | 210 |
| registerFunction | `onYarderSupportTerrainRaycastCallback` | 211 |
| registerFunction | `onSupportRopeTreeOverlapCallback` | 212 |
| registerFunction | `onYarderTowerPlayerDeleted` | 213 |
| registerOverwrittenFunction | `isDetachAllowed` | 219 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 220 |
| registerOverwrittenFunction | `getAllowsLowering` | 221 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 222 |
| registerOverwrittenFunction | `getConsumingLoad` | 223 |
| registerOverwrittenFunction | `getIsPowerTakeOffActive` | 224 |
| registerOverwrittenFunction | `getDirtMultiplier` | 225 |
| registerOverwrittenFunction | `getWearMultiplier` | 226 |
| registerOverwrittenFunction | `getUsageCausesDamage` | 227 |
| registerOverwrittenFunction | `addToPhysics` | 228 |
| registerOverwrittenFunction | `removeFromPhysics` | 229 |
| registerEventListener | `onLoad` | 235 |
| registerEventListener | `onLoadEnd` | 236 |
| registerEventListener | `onPreDelete` | 237 |
| registerEventListener | `onDelete` | 238 |
| registerEventListener | `onReadStream` | 239 |
| registerEventListener | `onWriteStream` | 240 |
| registerEventListener | `onReadUpdateStream` | 241 |
| registerEventListener | `onWriteUpdateStream` | 242 |
| registerEventListener | `onUpdate` | 243 |
| registerEventListener | `onYarderCarriageTreeAttached` | 244 |
| registerEventListener | `onPostAttach` | 245 |
