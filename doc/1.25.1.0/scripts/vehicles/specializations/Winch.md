# vehicles/specializations/Winch.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Winch.md)*

Source: `dataS/scripts/vehicles/specializations/Winch.lua` — FS25 1.25.1.0

✍ Forestry winch specialization: one or more ropes (XML `vehicle.winch.rope`, also per `winchConfiguration`) can be attached by the player to felled trees, then pulled or released. It uses `ForestryPhysicsRope` (main rope and a temporary setup rope), `ForestryHook`, `TargetTreeMarker`, activatables, and syncs attach/detach through `TreeAttachEvent`, `TreeDetachEvent` and `TreeAttachRequestEvent`. Attached trees are saved via saveable split shape ids; all trees detach when one is cut or mounted elsewhere. The activatable classes `WinchAttachTreeActivatable` and `WinchControlRopeActivatable` are used but not defined in this file (UNVERIFIED).


## Functions

| Function | Line | Description |
|---|---|---|
| `Winch.prerequisitesPresent(specializations: table) → boolean` | 30 | ✍ Always returns true: no prerequisites. |
| `Winch.initSpecialization()` | 36 | ✍ Adds the `winch` configuration type (not when the icon generator runs), the store spec `winchMaxMass`, and registers the XML paths for the winch and its configurations, plus object-change paths. |
| `Winch.registerXMLPaths(schema: any, baseKey: any)` | 56 | ✍ Registers all XML and savegame paths for ropes (limits, speed, acceleration, nodes, main/setup rope, component joints, attach marker, tree hook, sounds, animation nodes, attached trees) and the `winch#ropeIndices` option for cylindered moving tools and parts. |
| `Winch.registerFunctions(vehicleType: any)` | 114 | ✍ Adds the winch functions (attach/detach tree, control input, attach mode, trigger and raycast callbacks, tree cut/mounted handlers) to the vehicle type. |
| `Winch.registerOverwrittenFunctions(vehicleType: any)` | 135 | ✍ Overrides extra dependent parts loading/updating, PTO consumption and activity, consuming load, and addToPhysics/removeFromPhysics. |
| `Winch.registerEventListeners(vehicleType: any)` | 147 | ✍ Subscribes to load, load finished, delete, the four stream events, onPostUpdate and onRegisterActionEvents. |
| `Winch:onLoad(savegame: any)` | 161 | ✍ Applies the configuration object changes, loads ropes from the base and configuration XML, and if any exist sets up texts, the tree raycast state, message center subscriptions (tree cut, tree mounted, player pre-teleport) and two dirty flags; otherwise removes all its listeners. Note: PLAYER_PRE_TELEPORT is subscribed to `onWinchTreeShapeMounted`, not to `onPlayerPreTeleport` (apparent oversight). |
| `Winch:onLoadFinished(savegame: any)` | 235 | ✍ Restores trees attached in the savegame (unless vehicles are reset): resolves the saved split shape id and calls `attachTreeToWinch` with the saved hook position and rope positions. |
| `Winch:onDelete()` | 264 | ✍ Detaches all trees, removes triggers, deletes ropes, marker and hook data, client sounds and animations, and removes both activatables of every rope. |
| `Winch:onReadStream(streamId: integer, connection: Connection)` | 295 | ✍ Client join: for each rope with attached trees, reads the tree count, hook position and split shape id; attaches immediately if the shape is known, otherwise queues it in `splitShapesToAttach` for onPostUpdate. |
| `Winch:onWriteStream(streamId: integer, connection: Connection)` | 320 | ✍ Server side on join: writes, per rope, whether trees are attached, their count minus one, the hook position in tree-local space and the split shape id. |
| `Winch:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 344 | ✍ Server reads the clients' control input (2 bits per rope, minus 1). Clients read the rope control direction (starting pull/release sounds and animations) and the main rope's physics state. |
| `Winch:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 387 | ✍ Clients send their sent control input when the dirty flag is set. The server writes the control direction and, under the rope dirty flag, the main rope state. |
| `Winch:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 414 | ✍ Saves, for each rope with trees, the rope index and for each tree the hook world translation, the saveable split shape id parts and the physics rope data. |
| `Winch:onPostUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 446 | ✍ Client: finishes queued tree attachments once their shape id resolves. Server: detaches all trees if one no longer exists. Locally, in attach mode it casts an async tree raycast from the player's camera, manages the setup rope (length check, color green/red, auto-cancel when too long), the target marker and activity; also counts down the control timer and stops sounds and animations when it ends. |
| `Winch:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 574 | ✍ Client: when active for input and the cylindered control group matches (if one is configured), registers the powered actions WINCH_CONTROL_VEHICLE (pull/release) and WINCH_DETACH, then refreshes their active state. |
| `Winch.actionEventControl(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 604 | ✍ Input callback: sends the analog control value to every rope via `setWinchControlInput`. |
| `Winch.actionEventDetach(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 613 | ✍ Input callback: detaches the trees from all ropes. |
| `Winch.updateActionEvents(self: any)` | 619 | ✍ Client: enables the control and detach actions only while at least one tree is attached. |
| `Winch:loadWinchRopeFromXML(xmlFile: any, key: any, rope: any)` | 645 | ✍ Loads one rope from XML (nodes, limits, speed in m/ms, acceleration, main and setup `ForestryPhysicsRope`, component joints, marker, hook, object changes, sounds, animations, activatables). Returns false if node, trigger node or attach node is missing. Note: `maxTreeBits` is computed as ceil(sqrt(maxNumTrees)) (inferred from the code). |
| `Winch:setWinchTreeAttachMode(rope: any, state: any)` | 729 | ✍ Turns the attach mode of a rope on, off, or toggles it when state is nil. Enabling swaps in the attach activatable; disabling hides the marker, destroys the setup rope and restores the activatables according to player range and attached trees. |
| `Winch:getIsWinchAttachModeActive(rope: any)` | 760 | ✍ Returns whether the given rope is in attach mode. |
| `Winch:getCanAttachWinchTree(rope: any)` | 766 | ✍ Returns true when the rope is in attach mode and the raycast currently found a valid tree. |
| `Winch:onAttachTreeInputEvent(rope: any)` | 777 | ✍ Confirms the attachment of the targeted tree: on a server checks `getIsWinchTreeAttachAllowed` then attaches or shows the failure warning; on a client sends a `TreeAttachRequestEvent`. Then leaves attach mode. |
| `Winch:getWinchRopeSpeedFactor(param: any)` | 800 | ✍ Returns the control direction of the rope whose index (as string) matches `param`, or 1 if none matches; used as a parameter by dependent animation code (UNVERIFIED who calls it). |
| `Winch:getIsWinchTreeAttachAllowed(ropeIndex: any, splitShapeId: any)` | 813 | ✍ Checks a candidate tree: fails with TOO_HEAVY if the total mass including attached trees exceeds `maxTreeMass`, or TOO_MANY if `maxNumTrees` is reached. Returns a boolean and a reason constant from `TreeAttachResponseEvent`. |
| `Winch:showWinchTreeMountFailedWarning(ropeIndex: any, reason: any)` | 836 | ✍ Shows a blinking warning (2.5 s) for the given failure reason: tree too heavy (with the max mass) or too many trees. |
| `Winch:attachTreeToWinch(splitShapeId: any, x: any, y: any, z: any, ropeIndex: any, setupRopeData: any, noEventSend: any)` | 850 | ✍ Attaches a tree (split shape) to a rope: mounts a cloned hook, creates the main rope for the first tree or an additional sub-rope to the first tree, applies active joint limits and object changes, plays the sound, registers the control activatable, publishes TREE_SHAPE_MOUNTED and sends `TreeAttachEvent` unless `noEventSend`. Does nothing if the hook cannot mount. |
| `Winch:detachTreeFromWinch(ropeIndex: any, noEventSend: any)` | 919 | ✍ Detaches all trees of one rope (or of every rope when the index is nil): leaves attach mode, destroys sub-ropes and the main rope, deletes hooks, resets joint limits on the server, resets object changes and activatables, then sends `TreeDetachEvent` unless `noEventSend`. |
| `Winch:setWinchControlInput(ropeIndex: any, direction: any)` | 981 | ✍ Applies pull/release input for a rope (only if the winch is not an attachable or is attached). Server: accelerates and calls `adjustLength` on the main rope, updates sounds/animations and raises dirty flags. Client: stores the input to send. Uses the global `g_currentDt`. |
| `Winch:onWinchPlayerTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 1034 | ✍ Trigger callback: when the local player enters or leaves a rope's trigger node, sets `isPlayerInRange` and adds or removes the attach activatable (kept while in attach mode). |
| `Winch:onWinchTreeRaycastCallback(hitObjectId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 1063 | ✍ Async raycast callback: validates the hit split shape as a tree (not already attached, static trees only for the first one), computes the target and marker position with `SplitShapeUtil.getTreeOffsetPosition`, and flags it valid or invalid depending on the distance to the rope start. Returns false for tree hits. |
| `Winch:onWinchTreeShapeCut(oldShape: any, shape: any)` | 1127 | ✍ Server only: when a tree shape is cut and the old shape was attached, detaches all trees. |
| `Winch:onWinchTreeShapeMounted(shape: any, mountVehicle: any)` | 1145 | ✍ Server only: when an attached tree is mounted on another vehicle, detaches all trees. |
| `Winch:onPlayerPreTeleport(player: Player)` | 1164 | ✍ Before the local player teleports, destroys all setup ropes to avoid physics trouble caused by an overly long rope. Note: it is not connected in onLoad (see Winch:onLoad). |
| `Winch:loadExtraDependentParts(superFunc: any, xmlFile: any, baseName: any, entry: any)` | 1176 | ✍ Override: after the base loading, reads the optional `winch#ropeIndices` list of a moving part or tool. |
| `Winch:updateExtraDependentParts(superFunc: any, part: any, dt: any)` | 1188 | ✍ Override: after the base update, refreshes the anchor nodes of the main ropes listed in the part's rope indices. |
| `Winch:getDoConsumePtoPower(superFunc: any) → boolean` | 1205 | ✍ Override: returns true while any rope has a tree attached, otherwise the previous result. |
| `Winch:getConsumingLoad(superFunc: any)` | 1220 | ✍ Override: adds a full load (1) to the previous load value while any rope was controlled recently, and increments the count by one. |
| `Winch:getIsPowerTakeOffActive(superFunc: any)` | 1238 | ✍ Override: returns true while any rope has a tree attached, otherwise the previous result. |
| `Winch:addToPhysics(superFunc: any)` | 1253 | ✍ Override: after the base call succeeds, recreates the main rope for each rope with an attached tree (used when the vehicle re-enters physics). |
| `Winch:removeFromPhysics(superFunc: any)` | 1270 | ✍ Override: destroys the main rope of every rope with attached trees, then calls the previous implementation. |
| `Winch.loadSpecValueMaxMass(xmlFile: any, customEnvironment: any, baseDir: any)` | 1282 | ✍ Store spec loader: reads the highest `maxTreeMass` over the base ropes and, separately, per winch configuration. Returns a table with `maxTreeMass` and `massByConfig`. |
| `Winch.getSpecValueMaxMass(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 1302 | ✍ Store spec getter: picks the max tree mass for the chosen configuration (or the highest across configurations) and returns it formatted with the tons unit, as value(s) or string depending on `returnValues`/`returnRange`. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadWinchRopeFromXML` | 115 |
| registerFunction | `setWinchTreeAttachMode` | 116 |
| registerFunction | `getIsWinchAttachModeActive` | 117 |
| registerFunction | `getCanAttachWinchTree` | 118 |
| registerFunction | `onAttachTreeInputEvent` | 119 |
| registerFunction | `getWinchRopeSpeedFactor` | 120 |
| registerFunction | `getIsWinchTreeAttachAllowed` | 121 |
| registerFunction | `showWinchTreeMountFailedWarning` | 122 |
| registerFunction | `attachTreeToWinch` | 123 |
| registerFunction | `detachTreeFromWinch` | 124 |
| registerFunction | `setWinchControlInput` | 125 |
| registerFunction | `onWinchPlayerTriggerCallback` | 126 |
| registerFunction | `onWinchTreeRaycastCallback` | 127 |
| registerFunction | `onWinchTreeShapeCut` | 128 |
| registerFunction | `onWinchTreeShapeMounted` | 129 |
| registerFunction | `onPlayerPreTeleport` | 130 |
| registerOverwrittenFunction | `loadExtraDependentParts` | 136 |
| registerOverwrittenFunction | `updateExtraDependentParts` | 137 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 138 |
| registerOverwrittenFunction | `getConsumingLoad` | 139 |
| registerOverwrittenFunction | `getIsPowerTakeOffActive` | 140 |
| registerOverwrittenFunction | `addToPhysics` | 141 |
| registerOverwrittenFunction | `removeFromPhysics` | 142 |
| registerEventListener | `onLoad` | 148 |
| registerEventListener | `onLoadFinished` | 149 |
| registerEventListener | `onDelete` | 150 |
| registerEventListener | `onReadStream` | 151 |
| registerEventListener | `onWriteStream` | 152 |
| registerEventListener | `onReadUpdateStream` | 153 |
| registerEventListener | `onWriteUpdateStream` | 154 |
| registerEventListener | `onPostUpdate` | 155 |
| registerEventListener | `onRegisterActionEvents` | 156 |

## Messages

- subscribes `MessageType.TREE_SHAPE_CUT` (l.215)
- subscribes `MessageType.TREE_SHAPE_MOUNTED` (l.216)
- subscribes `MessageType.PLAYER_PRE_TELEPORT` (l.217)
- publishes `MessageType.TREE_SHAPE_MOUNTED` (l.910)
