# vehicles/specializations/TensionBelts.lua

*[Version française](../../../fr/scripts/vehicles/specializations/TensionBelts.md)*

Source: `dataS/scripts/vehicles/specializations/TensionBelts.lua` — FS25 1.25.1.0

✍ Specialization (no prerequisites) for vehicles that strap loads (bales, pallets, vehicles, tree trunks) with tension belts. Belts are described per configuration under vehicle.tensionBelts and are built as geometry with TensionBeltGeometryConstructor, using belt data from g_tensionBeltManager. The server mounts found objects with physics joints (or kinematic links for trees on trains) and syncs the state through TensionBeltsEvent and a stream bool per belt. A TensionBeltsActivatable offers the per-belt interaction, and the file also holds the toggle action and a debug console command.

- **TensionBelts** (l.14)
- **TensionBeltsActivatable** (l.1585)

## Functions

| Function | Line | Description |
|---|---|---|
| `TensionBelts.prerequisitesPresent(specializations: any)` | 21 | ✍ Always returns true: no prerequisite specialization. |
| `TensionBelts.initSpecialization()` | 27 | ✍ Registers the 'tensionBelts' configuration type and the XML schema (interaction radii, trigger, belt type, width, hooks, offsets, per-belt nodes, object changes, sounds, moving-tool flag) plus the savegame key for belt active state. |
| `TensionBelts.registerFunctions(vehicleType: any)` | 85 | ✍ Registers the belt functions: create/remove, set active, mount/unmount queries, refresh, free/lock object, player range, dynamic mount check, trigger callback and tree-cut handler. |
| `TensionBelts.registerOverwrittenFunctions(vehicleType: any)` | 106 | ✍ Overrides automated train travel readiness, selectability, fold permission, moving tool loading/activity, discharge checks, fill level info, mounted-object check and additional component mass. |
| `TensionBelts.registerEventListeners(vehicleType: any)` | 121 | ✍ Subscribes to onLoad, onPostLoad, onDelete, onPreDelete, onReadStream, onWriteStream, onUpdate, onUpdateTick, onDraw and onRegisterActionEvents. |
| `TensionBelts:onLoad(savegame: table)` | 137 | ✍ Reads the selected tension belt configuration: radii, optional player trigger (checks collision filters), belt type data, nodes and each tensionBelt entry (end node x/y must be 0). Computes the interaction centre, subscribes to tree cut messages, and removes listeners when no belts exist. Sets a loading error if linkNode is missing. |
| `TensionBelts:onPostLoad(savegame: table)` | 363 | ✍ When loading a savegame, collects the indices of belts stored as active so onUpdate can refasten them one per frame. |
| `TensionBelts:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 384 | ✍ Writes the isActive flag of every belt to the savegame (true if the belt has a mesh). |
| `TensionBelts:onPreDelete()` | 397 | ✍ Before deletion, wakes the physics of every object currently under a belt's mount area so they do not stay asleep. |
| `TensionBelts:onDelete()` | 410 | ✍ Removes the activatable, unfastens all belts silently, removes the activation trigger and deletes the sounds. |
| `TensionBelts:onReadStream(streamId: integer, connection: Connection)` | 429 | ✍ Client join: reads one bool per belt and queues the active ones for refastening. |
| `TensionBelts:onWriteStream(streamId: integer, connection: Connection)` | 447 | ✍ Server join sync: writes one bool per belt telling whether it has a mesh. |
| `TensionBelts:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 462 | ✍ Refastens queued belts, on the server updates dynamic joint frames if the link node moved, on clients steps a fasten/unfasten-all sequence, manages the nearest belt preview (dummy belt) and the activatable when the local player is in range, and draws debug shapes if enabled. |
| `TensionBelts:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 602 | ✍ Server only, every 500 ms: checks whether a mounted physics object no longer exists and, if so, drops it and refreshes the belts. |
| `TensionBelts:onDraw(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 634 | ✍ For the selected, input-active vehicle, sets the toggle action text to fasten or unfasten depending on whether all belts are fastened. |
| `TensionBelts:refreshTensionBelts()` | 657 | ✍ Server broadcasts TensionBeltsRefreshEvent, then rebuilds every fastened belt geometry around the objects currently in range. |
| `TensionBelts:freeTensionBeltObject(objectId: any, objectsToJointTable: any, isDynamic: any, object: any)` | 674 | ✍ Releases an object from its mount: server removes the joint, restores mass, inertia and flags (can be sold, mount type) or relinks/unmounts kinematic objects; clears the tree mounted attribute and forgets the object. |
| `TensionBelts:lockTensionBeltObject(objectId: any, objectsToJointTable: any, isDynamic: any, jointNode: any, object: any)` | 746 | ✍ Mounts an object: server creates a joint at its centre of mass (with spring limits, reduced mass, mount type set), or kinematically links trees on non-dynamic joint nodes. Clients just record it. Publishes TREE_SHAPE_MOUNTED for trees. Note: the kinematic mount branch is never selected in this code. |
| `TensionBelts:setTensionBeltsActive(isActive: boolean, beltId: integer, noEventSend: boolean, playSound: boolean)` | 850 | ✍ Fastens or unfastens one belt (by id) or all belts when id is nil: builds or deletes belt meshes, mounts or frees objects in range, applies object changes, sends TensionBeltsEvent unless noEventSend, and updates the all-fastened state. |
| `TensionBelts:setAllTensionBeltsActive(isActive: any, noEventSend: any)` | 911 | ✍ Sets every belt to the given state, or toggles based on whether all are currently fastened when isActive is nil. |
| `TensionBelts:updateFastenState()` | 924 | ✍ Recomputes areAllBeltsFastened: true only when no single belt is without a mesh. |
| `TensionBelts:createTensionBelt(belt: table, isDummy: boolean, objects: table, playSound: boolean)` | 944 | ✍ Builds the belt geometry between its start and end nodes around the given objects' meshes (material, width, hooks, ratchet, intersection points) and returns the shape, or nil. Dummy belts are previews; real ones are stored, ratchet and hooks are cloned, and the add sound plays. |
| `TensionBelts:removeTensionBelt(belt: table, playSound: boolean)` | 1074 | ✍ Deletes a belt's mesh and clears its reference; plays the remove sound on clients unless disabled or the belt was only a preview. |
| `TensionBelts:getObjectToMount(belt: table) → table, integer` | 1099 | ✍ Runs a synchronous overlap box over the belt's zone (sides, height, offset from neighbours or defaults) against dynamic objects, vehicles and trees, and returns the table of found objects and their count. The returned table is reused between calls. |
| `TensionBelts:getObjectsToUnmount(belt: table) → table, integer` | 1200 | ✍ Returns the mounted objects that would be freed if the given belt is removed, excluding those still held by another fastened belt, and their count. |
| `TensionBelts:objectOverlapCallback(transformId: integer)` | 1231 | ✍ Overlap callback: records mountable game objects (via getTensionBeltNodeId/getMeshNodes) or dynamic/kinematic tree split shapes found in the belt zone. Always returns true to continue. |
| `TensionBelts:getTensionBeltObjectCanBeMounted(object: any)` | 1262 | ✍ Returns whether an object may be strapped: not this vehicle or its own hierarchy, supports tension belts with mesh nodes, not dynamically mounted elsewhere, and no circular mounting with this vehicle. |
| `TensionBelts:getIsPlayerInTensionBeltsRange() → boolean, table` | 1315 | ✍ Returns true plus the nearest belt when the local player can access the vehicle and stands within the interaction radius of a belt end node; otherwise false, nil. |
| `TensionBelts:getIsDynamicallyMountedNode(node: any)` | 1358 | ✍ Returns true if the given node is currently mounted by one of this vehicle's belts. |
| `TensionBelts:getIsReadyForAutomatedTrainTravel(superFunc: any)` | 1374 | ✍ Override: returns false while objects are in belt range (not yet strapped); otherwise defers to the parent. |
| `TensionBelts:getCanBeSelected(superFunc: any)` | 1385 | ✍ Override that always returns true. |
| `TensionBelts:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 1391 | ✍ Override: forbids folding with a warning text while all belts are fastened when allowFoldingWhileFasten is false (unfolding direction excepted). |
| `TensionBelts:loadMovingToolFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 1404 | ✍ Override: after the parent loads a moving tool, reads its tensionBelts#allowedMounted flag (default true). |
| `TensionBelts:getIsMovingToolActive(superFunc: any, movingTool: any)` | 1416 | ✍ Override: disables a moving tool that does not allow movement while mounted when all belts are fastened. |
| `TensionBelts:getCanDischargeToGround(superFunc: any, dischargeNode: any)` | 1429 | ✍ Override: returns false while all belts are fastened if allowDischargeWhileFasten is false. |
| `TensionBelts:getCanDischargeToObject(superFunc: any, dischargeNode: any)` | 1442 | ✍ Override: returns false while all belts are fastened if allowDischargeWhileFasten is false. |
| `TensionBelts:getFillLevelInformation(superFunc: any, display: any)` | 1455 | ✍ Override that also adds the fill levels of strapped objects to the display, using their own getFillLevelInformation or fill type, level and capacity. |
| `TensionBelts:getHasObjectMounted(superFunc: table, object: table) → boolean` | 1486 | ✍ Override: true if the parent says so, or if the object is strapped here or mounted on a strapped object (recursive). |
| `TensionBelts:getAdditionalComponentMass(superFunc: any, component: any)` | 1513 | ✍ Override adding to the joint component the default mass of strapped objects whose mass can be reduced, plus the stored original mass of strapped split shapes. |
| `TensionBelts:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1540 | ✍ Client only: registers the TOGGLE_TENSION_BELTS action event for the vehicle when input is active. |
| `TensionBelts:tensionBeltActivationTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 1555 | ✍ Client trigger callback: sets isPlayerInTrigger when the local player enters or leaves the activation trigger and keeps the vehicle active on entering. |
| `TensionBelts:onTensionBeltTreeShapeCut(oldShape: any, shape: any)` | 1573 | ✍ Server handler for tree cut messages: if the cut shape was strapped, unfastens all belts. |
| `TensionBeltsActivatable.new(object: any)` | 1589 | ✍ Creates the activatable for a vehicle, keeping its spec and the default 'fasten belt' text. |
| `TensionBeltsActivatable:getIsActivatable()` | 1602 | ✍ Returns true while the local player is in range of the belts. |
| `TensionBeltsActivatable:getDistance(posX: any, posY: any, posZ: any)` | 1608 | ✍ Returns 0 (highest priority) when a current belt is selected, otherwise math.huge. |
| `TensionBeltsActivatable:run()` | 1619 | ✍ Toggles the current belt: unfastens it if it has a mesh, otherwise fastens it, then refreshes the text. |
| `TensionBeltsActivatable:updateActivateText()` | 1633 | ✍ Sets the prompt to 'unfasten' or 'fasten' depending on whether the current belt is fastened. |
| `TensionBelts.actionEventToggleTensionBelts(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1643 | ✍ Input callback: starts the sequential fasten-all or unfasten-all (opposite of the current state), carried out one belt per update. |
| `TensionBelts.consoleCommandToggleTensionBeltDebugRendering(unusedSelf: any)` | 1652 | ✍ Console command that toggles TensionBelts.debugRendering and returns a status string. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `createTensionBelt` | 86 |
| registerFunction | `removeTensionBelt` | 87 |
| registerFunction | `setTensionBeltsActive` | 88 |
| registerFunction | `setAllTensionBeltsActive` | 89 |
| registerFunction | `objectOverlapCallback` | 90 |
| registerFunction | `getTensionBeltObjectCanBeMounted` | 91 |
| registerFunction | `getObjectToMount` | 92 |
| registerFunction | `getObjectsToUnmount` | 93 |
| registerFunction | `updateFastenState` | 94 |
| registerFunction | `refreshTensionBelts` | 95 |
| registerFunction | `freeTensionBeltObject` | 96 |
| registerFunction | `lockTensionBeltObject` | 97 |
| registerFunction | `getIsPlayerInTensionBeltsRange` | 98 |
| registerFunction | `getIsDynamicallyMountedNode` | 99 |
| registerFunction | `tensionBeltActivationTriggerCallback` | 100 |
| registerFunction | `onTensionBeltTreeShapeCut` | 101 |
| registerOverwrittenFunction | `getIsReadyForAutomatedTrainTravel` | 107 |
| registerOverwrittenFunction | `getCanBeSelected` | 108 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 109 |
| registerOverwrittenFunction | `loadMovingToolFromXML` | 110 |
| registerOverwrittenFunction | `getIsMovingToolActive` | 111 |
| registerOverwrittenFunction | `getCanDischargeToGround` | 112 |
| registerOverwrittenFunction | `getCanDischargeToObject` | 113 |
| registerOverwrittenFunction | `getFillLevelInformation` | 114 |
| registerOverwrittenFunction | `getHasObjectMounted` | 115 |
| registerOverwrittenFunction | `getAdditionalComponentMass` | 116 |
| registerEventListener | `onLoad` | 122 |
| registerEventListener | `onPostLoad` | 123 |
| registerEventListener | `onDelete` | 124 |
| registerEventListener | `onPreDelete` | 125 |
| registerEventListener | `onReadStream` | 126 |
| registerEventListener | `onWriteStream` | 127 |
| registerEventListener | `onUpdate` | 128 |
| registerEventListener | `onUpdateTick` | 129 |
| registerEventListener | `onDraw` | 130 |
| registerEventListener | `onRegisterActionEvents` | 131 |

## Messages

- subscribes `MessageType.TREE_SHAPE_CUT` (l.356)
- publishes `MessageType.TREE_SHAPE_MOUNTED` (l.840)
