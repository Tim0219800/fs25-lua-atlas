# vehicles/specializations/TreePlanter.lua

*[Version française](../../../fr/scripts/vehicles/specializations/TreePlanter.md)*

Source: `dataS/scripts/vehicles/specializations/TreePlanter.lua` — FS25 1.25.1.0

✍ Specialization for tree planting machines. It mounts a sapling pallet (found through a pallet trigger) and uses it as the fill unit content, then plants trees from the chosen tree type either automatically when driving (spacing from `minDistance`) or on a manual input action. Non-tree fill types fall back to a sowing/cultivating routine on the density maps. It requires TurnOnVehicle, FillUnit and GroundReference; the server does the planting while clients get sound, animations and warnings. The file also defines the helper class TreePlanterActivatable.

- **TreePlanter** (l.16)
- **TreePlanterActivatable** (l.1396)

## Functions

| Function | Line | Description |
|---|---|---|
| `TreePlanter.prerequisitesPresent(specializations: table) → boolean` | 38 | ✍ Returns true only if the vehicle type has the TurnOnVehicle, FillUnit and GroundReference specializations. |
| `TreePlanter.initSpecialization()` | 46 | ✍ Registers the `vehicle.treePlanter` XML schema (input action, node, min distance, pallet trigger, ground reference, grab/mount nodes, fill unit, sapling nodes, plant and magazine animations, sounds, animation nodes) and the savegame keys for last tree position, mounted pallet and tree type. |
| `TreePlanter.registerFunctions(vehicleType: any)` | 84 | ✍ Registers the specialization's vehicle functions (mounted object removal, field limit, tree creation, pallet loading and trigger callback, tree type selection, sapling visuals, fill level update). |
| `TreePlanter.registerOverwrittenFunctions(vehicleType: any)` | 99 | ✍ Registers overrides of dirt/wear multipliers, rotating parts, work area, speed limit, selection, field check, the fill unit getters (redirected to the mounted pallet), mounted-object and unload-pallet queries, and automatic steering. |
| `TreePlanter.registerEventListeners(vehicleType: any)` | 125 | ✍ Subscribes the specialization to load/delete, stream and update-stream, update, update tick, draw, action events, turn on/off, and the fill unit filling, fill level and unload pallet events. |
| `TreePlanter:onLoad(savegame: table)` | 146 | ✍ Loads the `treePlanter` XML (nodes, pallet trigger, ground reference, sapling nodes, animations, mount range, fill unit), creates the activatable, registers AI ground requirements and restores last tree position, mounted-pallet flag and tree type from the savegame. |
| `TreePlanter:onDelete()` | 252 | ✍ Releases sounds and animation nodes, removes the activatable and pallet trigger, unmounts the pallet and frees the shared sapling I3D file. |
| `TreePlanter:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 281 | ✍ Saves the last tree position, whether a pallet is mounted, and the current tree type and variation names. |
| `TreePlanter:removeMountedObject(object: integer, isDeleting: boolean)` | 307 | ✍ Unmounts and forgets the sapling pallet if it is the given object. |
| `TreePlanter:onReadStream(streamId: integer, connection: Connection)` | 320 | ✍ Client side on join: reads the mounted pallet object id, the current tree type and variation, and the last tree position. |
| `TreePlanter:onWriteStream(streamId: integer, connection: Connection)` | 347 | ✍ Server side on join: writes the mounted pallet id, tree type and variation, and the compressed last tree position. |
| `TreePlanter:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 374 | ✍ Client only: reads ground contact and the field-not-owned and restricted-zone warning flags when the dirty bit is set. |
| `TreePlanter:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 390 | ✍ Server only: writes ground contact and the two warning flags when the specialization dirty flag is set. |
| `TreePlanter:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 406 | ✍ Mounts a pallet once synchronised (from a received id or a saved flag), adopts its tree type on the server, manages the refill activatable on the client according to the nearest valid pallet, and keeps the mounted pallet active or forgets it if deleted. |
| `TreePlanter:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 469 | ✍ Core work loop. Server: updates ground contact, stops AI without a pallet, plants trees by distance when sapling fill type, otherwise cultivates and sows the area with seed usage, stats and cost. Checks farm access, restricted zones and planting period. Client: work sound, field-limit and manual plant action state. |
| `TreePlanter:onDraw(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 673 | ✍ Shows extra print texts (fill the tool first, tree type) and blinking warnings for no access to the land, restricted zone, too many trees, or a fruit type that cannot be planted in the current period. |
| `TreePlanter:onTurnedOn()` | 708 | ✍ Client only: starts the animation nodes. |
| `TreePlanter:onTurnedOff()` | 718 | ✍ Client only: stops the animation nodes and work sounds. |
| `TreePlanter:onFillUnitIsFillingStateChanged(isFilling: any)` | 729 | ✍ Server only: when filling starts from a source object that exposes a sapling pallet type, adopts that tree type and variation. |
| `TreePlanter:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 747 | ✍ Refreshes sapling visuals and the magazine animation when the planter's own fill unit changes. |
| `TreePlanter:onFillUnitUnloadPallet(pallet: any)` | 755 | ✍ Copies the current tree type onto the unloaded pallet if it supports it, and forgets the mounted pallet if it is that pallet. |
| `TreePlanter:addFillUnitFillLevel(superFunc: any, farmId: any, fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any)` | 769 | ✍ Override: with a pallet mounted, the change is applied to the pallet's fill unit instead. Note: the type test calls the pallet with the planter's `fillUnitIndex` instead of the pallet's own index, which looks like a bug. |
| `TreePlanter:getFillUnitFillLevel(superFunc: any, fillUnitIndex: any)` | 788 | ✍ Override: with a pallet mounted, returns the sum of its fill unit levels instead of the planter's own level. |
| `TreePlanter:getFillUnitFillLevelPercentage(superFunc: any, fillUnitIndex: any)` | 808 | ✍ Override: with a pallet mounted, returns mounted fill level divided by combined capacity. |
| `TreePlanter:getFillUnitFillType(superFunc: any, fillUnitIndex: any)` | 826 | ✍ Override: with a pallet mounted, returns the fill type of its first non-empty fill unit. |
| `TreePlanter:getFillUnitCapacity(superFunc: any, fillUnitIndex: any)` | 845 | ✍ Override: with a pallet mounted, returns the summed capacity of the pallet's fill units. |
| `TreePlanter:getFillUnitAllowsFillType(superFunc: any, fillUnitIndex: any, fillType: any)` | 865 | ✍ Override: refuses any fill type for the planter's fill unit while a pallet is mounted. |
| `TreePlanter:getFillUnitFreeCapacity(superFunc: any, fillUnitIndex: any, fillTypeIndex: any, farmId: any)` | 879 | ✍ Override: returns 0 free capacity while a pallet is mounted. |
| `TreePlanter:getFillLevelInformation(superFunc: any, display: any)` | 893 | ✍ Override: when a pallet is mounted, adds its fill type, level and capacity to the HUD display before calling the parent. |
| `TreePlanter:getHasObjectMounted(superFunc: table, object: table) → boolean` | 912 | ✍ Override: also returns true if the object is the mounted pallet or is mounted on it. |
| `TreePlanter:getFillUnitUnloadPalletFilename(superFunc: any, fillUnitIndex: any)` | 935 | ✍ Override: with no pallet mounted and a known tree type, returns the store item file of the matching sapling pallet; otherwise returns nothing. |
| `TreePlanter:getFillUnitHasMountedPalletsToUnload(superFunc: any)` | 946 | ✍ Override: returns true when a sapling pallet is mounted. |
| `TreePlanter:getFillUnitMountedPalletsToUnload(superFunc: any)` | 952 | ✍ Override: returns a table containing the mounted pallet (nil entry if none). |
| `TreePlanter:getImplementAllowAutomaticSteering(superFunc: any)` | 958 | ✍ Override that always returns true, so automatic steering is allowed. |
| `TreePlanter:getCanPlantOutsideSeason()` | 964 | ✍ Returns false by default: planting outside the planting period is not allowed (a hook other code may override). |
| `TreePlanter:setTreePlanterTreeTypeIndex(treeTypeIndex: any, treeVariationIndex: any, noEventSend: any)` | 970 | ✍ Sets the current tree type and variation, updates the info text, reloads the sapling I3D shown on the sapling nodes and sends TreePlanterTreeTypeEvent unless `noEventSend`. |
| `TreePlanter:onTreePlanterSaplingLoaded(i3dNode: any, failedReason: any, args: any) → integer, table` | 1011 | ✍ Async callback: clones the loaded sapling onto each sapling node, refreshes the fill level visuals and deletes the loaded I3D root. |
| `TreePlanter:updateTreePlanterFillLevel(onLoad: any)` | 1029 | ✍ Shows as many sapling nodes as the rounded fill level, sets the `hideByIndex` shader parameter, moves the magazine animation to the matching row and toggles the unload action. `onLoad` jumps the animation instantly. |
| `TreePlanter:setPlantLimitToField(plantLimitToField: boolean, noEventSend: boolean)` | 1064 | ✍ Sets whether sowing is limited to fields and sends PlantLimitToFieldEvent when the value changes. |
| `TreePlanter:createTree(noEventSend: any)` | 1076 | ✍ Plants one tree at the node position. Aborts with a warning when the tree limit is reached. Server: plants with random rotation via the tree plant manager, consumes one sapling (or charges money for helpers), updates stats. Client: plays the plant animation. Sends TreePlanterCreateTreeEvent. |
| `TreePlanter:loadPallet(palletObjectId: table, noEventSend: any)` | 1147 | ✍ Sends TreePlanterLoadPalletEvent and stores the pallet object id so that `onUpdate` mounts it. |
| `TreePlanter:getDirtMultiplier(superFunc: any) → number` | 1158 | ✍ Override: adds a work dirt term scaled by speed over speed limit while the planter has ground contact. |
| `TreePlanter:getWearMultiplier(superFunc: any) → number` | 1172 | ✍ Override: adds a work wear term scaled by speed over speed limit while the planter has ground contact. |
| `TreePlanter:getIsSpeedRotatingPartActive(superFunc: table, speedRotatingPart: table) → boolean` | 1187 | ✍ Override: rotating parts are inactive without ground contact, otherwise the parent decides. |
| `TreePlanter:getIsWorkAreaActive(superFunc: any, workArea: any)` | 1199 | ✍ Override: the work area tied to the planter's ground reference node is inactive while the machine is not turned on. |
| `TreePlanter:doCheckSpeedLimit(superFunc: any) → boolean` | 1215 | ✍ Override: also checks the speed limit when turned on and the implement chain is lowered. |
| `TreePlanter:getCanBeSelected(superFunc: any)` | 1221 | ✍ Override that always returns true, so the planter can be selected. |
| `TreePlanter:onDeleteTreePlanterObject(object: any)` | 1227 | ✍ Delete listener: forgets a pallet that was mounted or in the trigger when it is deleted. |
| `TreePlanter:getIsOnField(superFunc: any)` | 1238 | ✍ Override: also counts as on field when the planter has ground contact, since it needs no field to work. |
| `TreePlanter:palletTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 1253 | ✍ Trigger callback keeping a counted list of accessible pallet vehicles inside the trigger; registers a delete listener on first entry. |
| `TreePlanter:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1284 | ✍ Client only: registers the field-limit toggle (IMPLEMENT_EXTRA3, unless forced) and, if configured, the manual plant action. |
| `TreePlanter.actionEventToggleTreePlanterFieldLimitation(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1306 | ✍ Input callback: toggles the limit-to-field setting. |
| `TreePlanter.actionEventPlant(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1312 | ✍ Input callback for manual planting: checks ground contact, tree limit, land access and restricted zones, shows a blinking warning on failure, otherwise calls `createTree`. |
| `TreePlanter.getDefaultSpeedLimit() → number` | 1337 | ✍ Returns the default speed limit for this specialization, 5 (km/h presumed, UNVERIFIED). |
| `TreePlanter.getSaplingPalletInRange(self: integer, refNode: integer, palletsInTrigger: any) → table` | 1345 | ✍ Returns the nearest pallet from the trigger list, within the mounting range of a reference node, that holds a non-empty fill unit whose fill type the planter supports; nil if none. |
| `TreePlanterActivatable.new(treePlanterVehicle: table) → table` | 1402 | ✍ Creates the activatable for a planter and builds its 'refill' prompt text from the vehicle's type description. |
| `TreePlanterActivatable:getIsActivatable() → boolean` | 1414 | ✍ True when the local player's current vehicle is this planter's root vehicle, no pallet is mounted yet and a pallet is nearby. |
| `TreePlanterActivatable:run()` | 1428 | ✍ Activation callback: asks the planter to load the nearest sapling pallet via `loadPallet`. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `removeMountedObject` | 85 |
| registerFunction | `setPlantLimitToField` | 86 |
| registerFunction | `createTree` | 87 |
| registerFunction | `loadPallet` | 88 |
| registerFunction | `palletTriggerCallback` | 89 |
| registerFunction | `onDeleteTreePlanterObject` | 90 |
| registerFunction | `getCanPlantOutsideSeason` | 91 |
| registerFunction | `setTreePlanterTreeTypeIndex` | 92 |
| registerFunction | `onTreePlanterSaplingLoaded` | 93 |
| registerFunction | `updateTreePlanterFillLevel` | 94 |
| registerOverwrittenFunction | `getDirtMultiplier` | 100 |
| registerOverwrittenFunction | `getWearMultiplier` | 101 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 102 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 103 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 104 |
| registerOverwrittenFunction | `getCanBeSelected` | 105 |
| registerOverwrittenFunction | `getIsOnField` | 106 |
| registerOverwrittenFunction | `addFillUnitFillLevel` | 108 |
| registerOverwrittenFunction | `getFillUnitFillLevel` | 109 |
| registerOverwrittenFunction | `getFillUnitFillLevelPercentage` | 110 |
| registerOverwrittenFunction | `getFillUnitFillType` | 111 |
| registerOverwrittenFunction | `getFillUnitCapacity` | 112 |
| registerOverwrittenFunction | `getFillUnitAllowsFillType` | 113 |
| registerOverwrittenFunction | `getFillUnitFreeCapacity` | 114 |
| registerOverwrittenFunction | `getFillLevelInformation` | 115 |
| registerOverwrittenFunction | `getHasObjectMounted` | 116 |
| registerOverwrittenFunction | `getFillUnitHasMountedPalletsToUnload` | 117 |
| registerOverwrittenFunction | `getFillUnitUnloadPalletFilename` | 118 |
| registerOverwrittenFunction | `getFillUnitMountedPalletsToUnload` | 119 |
| registerOverwrittenFunction | `getImplementAllowAutomaticSteering` | 120 |
| registerEventListener | `onLoad` | 126 |
| registerEventListener | `onDelete` | 127 |
| registerEventListener | `onReadStream` | 128 |
| registerEventListener | `onWriteStream` | 129 |
| registerEventListener | `onReadUpdateStream` | 130 |
| registerEventListener | `onWriteUpdateStream` | 131 |
| registerEventListener | `onUpdate` | 132 |
| registerEventListener | `onUpdateTick` | 133 |
| registerEventListener | `onDraw` | 134 |
| registerEventListener | `onRegisterActionEvents` | 135 |
| registerEventListener | `onTurnedOn` | 136 |
| registerEventListener | `onTurnedOff` | 137 |
| registerEventListener | `onFillUnitIsFillingStateChanged` | 138 |
| registerEventListener | `onFillUnitFillLevelChanged` | 139 |
| registerEventListener | `onFillUnitUnloadPallet` | 140 |
