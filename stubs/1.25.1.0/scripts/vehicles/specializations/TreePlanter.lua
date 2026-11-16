---@meta
-- FS25 1.25.1.0 : vehicles/specializations/TreePlanter.lua (generated stub, FS25 Lua Atlas)

--- Specialization for tree planting machines. It mounts a sapling pallet (found through a pallet trigger) and uses it as the fill unit content, then plants trees from the chosen tree type either automatically when driving (spacing from `minDistance`) or on a manual input action. Non-tree fill types fall back to a sowing/cultivating routine on the density maps. It requires TurnOnVehicle, FillUnit and GroundReference; the server does the planting while clients get sound, animations and warnings. The file also defines the helper class TreePlanterActivatable.
---@class TreePlanter
TreePlanter = {}

--- Specialization for tree planting machines. It mounts a sapling pallet (found through a pallet trigger) and uses it as the fill unit content, then plants trees from the chosen tree type either automatically when driving (spacing from `minDistance`) or on a manual input action. Non-tree fill types fall back to a sowing/cultivating routine on the density maps. It requires TurnOnVehicle, FillUnit and GroundReference; the server does the planting while clients get sound, animations and warnings. The file also defines the helper class TreePlanterActivatable.
---@class TreePlanterActivatable
TreePlanterActivatable = {}

--- Returns true only if the vehicle type has the TurnOnVehicle, FillUnit and GroundReference specializations.
---@param specializations table
---@return boolean
function TreePlanter.prerequisitesPresent(specializations) end

--- Registers the `vehicle.treePlanter` XML schema (input action, node, min distance, pallet trigger, ground reference, grab/mount nodes, fill unit, sapling nodes, plant and magazine animations, sounds, animation nodes) and the savegame keys for last tree position, mounted pallet and tree type.
function TreePlanter.initSpecialization() end

--- Registers the specialization's vehicle functions (mounted object removal, field limit, tree creation, pallet loading and trigger callback, tree type selection, sapling visuals, fill level update).
---@param vehicleType any
function TreePlanter.registerFunctions(vehicleType) end

--- Registers overrides of dirt/wear multipliers, rotating parts, work area, speed limit, selection, field check, the fill unit getters (redirected to the mounted pallet), mounted-object and unload-pallet queries, and automatic steering.
---@param vehicleType any
function TreePlanter.registerOverwrittenFunctions(vehicleType) end

--- Subscribes the specialization to load/delete, stream and update-stream, update, update tick, draw, action events, turn on/off, and the fill unit filling, fill level and unload pallet events.
---@param vehicleType any
function TreePlanter.registerEventListeners(vehicleType) end

--- Loads the `treePlanter` XML (nodes, pallet trigger, ground reference, sapling nodes, animations, mount range, fill unit), creates the activatable, registers AI ground requirements and restores last tree position, mounted-pallet flag and tree type from the savegame.
---@param savegame table
function TreePlanter:onLoad(savegame) end

--- Releases sounds and animation nodes, removes the activatable and pallet trigger, unmounts the pallet and frees the shared sapling I3D file.
function TreePlanter:onDelete() end

--- Saves the last tree position, whether a pallet is mounted, and the current tree type and variation names.
---@param xmlFile any
---@param key any
---@param usedModNames any
function TreePlanter:saveToXMLFile(xmlFile, key, usedModNames) end

--- Unmounts and forgets the sapling pallet if it is the given object.
---@param object integer
---@param isDeleting boolean
function TreePlanter:removeMountedObject(object, isDeleting) end

--- Client side on join: reads the mounted pallet object id, the current tree type and variation, and the last tree position.
---@param streamId integer
---@param connection Connection
function TreePlanter:onReadStream(streamId, connection) end

--- Server side on join: writes the mounted pallet id, tree type and variation, and the compressed last tree position.
---@param streamId integer
---@param connection Connection
function TreePlanter:onWriteStream(streamId, connection) end

--- Client only: reads ground contact and the field-not-owned and restricted-zone warning flags when the dirty bit is set.
---@param streamId integer
---@param timestamp integer
---@param connection table
function TreePlanter:onReadUpdateStream(streamId, timestamp, connection) end

--- Server only: writes ground contact and the two warning flags when the specialization dirty flag is set.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function TreePlanter:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Mounts a pallet once synchronised (from a received id or a saved flag), adopts its tree type on the server, manages the refill activatable on the client according to the nearest valid pallet, and keeps the mounted pallet active or forgets it if deleted.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TreePlanter:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Core work loop. Server: updates ground contact, stops AI without a pallet, plants trees by distance when sapling fill type, otherwise cultivates and sows the area with seed usage, stats and cost. Checks farm access, restricted zones and planting period. Client: work sound, field-limit and manual plant action state.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TreePlanter:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Shows extra print texts (fill the tool first, tree type) and blinking warnings for no access to the land, restricted zone, too many trees, or a fruit type that cannot be planted in the current period.
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TreePlanter:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client only: starts the animation nodes.
function TreePlanter:onTurnedOn() end

--- Client only: stops the animation nodes and work sounds.
function TreePlanter:onTurnedOff() end

--- Server only: when filling starts from a source object that exposes a sapling pallet type, adopts that tree type and variation.
---@param isFilling any
function TreePlanter:onFillUnitIsFillingStateChanged(isFilling) end

--- Refreshes sapling visuals and the magazine animation when the planter's own fill unit changes.
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function TreePlanter:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData, appliedDelta) end

--- Copies the current tree type onto the unloaded pallet if it supports it, and forgets the mounted pallet if it is that pallet.
---@param pallet any
function TreePlanter:onFillUnitUnloadPallet(pallet) end

--- Override: with a pallet mounted, the change is applied to the pallet's fill unit instead. Note: the type test calls the pallet with the planter's `fillUnitIndex` instead of the pallet's own index, which looks like a bug.
---@param superFunc any
---@param farmId any
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
function TreePlanter:addFillUnitFillLevel(superFunc, farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData) end

--- Override: with a pallet mounted, returns the sum of its fill unit levels instead of the planter's own level.
---@param superFunc any
---@param fillUnitIndex any
function TreePlanter:getFillUnitFillLevel(superFunc, fillUnitIndex) end

--- Override: with a pallet mounted, returns mounted fill level divided by combined capacity.
---@param superFunc any
---@param fillUnitIndex any
function TreePlanter:getFillUnitFillLevelPercentage(superFunc, fillUnitIndex) end

--- Override: with a pallet mounted, returns the fill type of its first non-empty fill unit.
---@param superFunc any
---@param fillUnitIndex any
function TreePlanter:getFillUnitFillType(superFunc, fillUnitIndex) end

--- Override: with a pallet mounted, returns the summed capacity of the pallet's fill units.
---@param superFunc any
---@param fillUnitIndex any
function TreePlanter:getFillUnitCapacity(superFunc, fillUnitIndex) end

--- Override: refuses any fill type for the planter's fill unit while a pallet is mounted.
---@param superFunc any
---@param fillUnitIndex any
---@param fillType any
function TreePlanter:getFillUnitAllowsFillType(superFunc, fillUnitIndex, fillType) end

--- Override: returns 0 free capacity while a pallet is mounted.
---@param superFunc any
---@param fillUnitIndex any
---@param fillTypeIndex any
---@param farmId any
function TreePlanter:getFillUnitFreeCapacity(superFunc, fillUnitIndex, fillTypeIndex, farmId) end

--- Override: when a pallet is mounted, adds its fill type, level and capacity to the HUD display before calling the parent.
---@param superFunc any
---@param display any
function TreePlanter:getFillLevelInformation(superFunc, display) end

--- Override: also returns true if the object is the mounted pallet or is mounted on it.
---@param superFunc table
---@param object table
---@return boolean
function TreePlanter:getHasObjectMounted(superFunc, object) end

--- Override: with no pallet mounted and a known tree type, returns the store item file of the matching sapling pallet; otherwise returns nothing.
---@param superFunc any
---@param fillUnitIndex any
function TreePlanter:getFillUnitUnloadPalletFilename(superFunc, fillUnitIndex) end

--- Override: returns true when a sapling pallet is mounted.
---@param superFunc any
function TreePlanter:getFillUnitHasMountedPalletsToUnload(superFunc) end

--- Override: returns a table containing the mounted pallet (nil entry if none).
---@param superFunc any
function TreePlanter:getFillUnitMountedPalletsToUnload(superFunc) end

--- Override that always returns true, so automatic steering is allowed.
---@param superFunc any
function TreePlanter:getImplementAllowAutomaticSteering(superFunc) end

--- Returns false by default: planting outside the planting period is not allowed (a hook other code may override).
function TreePlanter:getCanPlantOutsideSeason() end

--- Sets the current tree type and variation, updates the info text, reloads the sapling I3D shown on the sapling nodes and sends TreePlanterTreeTypeEvent unless `noEventSend`.
---@param treeTypeIndex any
---@param treeVariationIndex any
---@param noEventSend any
function TreePlanter:setTreePlanterTreeTypeIndex(treeTypeIndex, treeVariationIndex, noEventSend) end

--- Async callback: clones the loaded sapling onto each sapling node, refreshes the fill level visuals and deletes the loaded I3D root.
---@param i3dNode any
---@param failedReason any
---@param args any
---@return integer
---@return table
function TreePlanter:onTreePlanterSaplingLoaded(i3dNode, failedReason, args) end

--- Shows as many sapling nodes as the rounded fill level, sets the `hideByIndex` shader parameter, moves the magazine animation to the matching row and toggles the unload action. `onLoad` jumps the animation instantly.
---@param onLoad any
function TreePlanter:updateTreePlanterFillLevel(onLoad) end

--- Sets whether sowing is limited to fields and sends PlantLimitToFieldEvent when the value changes.
---@param plantLimitToField boolean
---@param noEventSend boolean
function TreePlanter:setPlantLimitToField(plantLimitToField, noEventSend) end

--- Plants one tree at the node position. Aborts with a warning when the tree limit is reached. Server: plants with random rotation via the tree plant manager, consumes one sapling (or charges money for helpers), updates stats. Client: plays the plant animation. Sends TreePlanterCreateTreeEvent.
---@param noEventSend any
function TreePlanter:createTree(noEventSend) end

--- Sends TreePlanterLoadPalletEvent and stores the pallet object id so that `onUpdate` mounts it.
---@param palletObjectId table
---@param noEventSend any
function TreePlanter:loadPallet(palletObjectId, noEventSend) end

--- Override: adds a work dirt term scaled by speed over speed limit while the planter has ground contact.
---@param superFunc any
---@return number
function TreePlanter:getDirtMultiplier(superFunc) end

--- Override: adds a work wear term scaled by speed over speed limit while the planter has ground contact.
---@param superFunc any
---@return number
function TreePlanter:getWearMultiplier(superFunc) end

--- Override: rotating parts are inactive without ground contact, otherwise the parent decides.
---@param superFunc table
---@param speedRotatingPart table
---@return boolean
function TreePlanter:getIsSpeedRotatingPartActive(superFunc, speedRotatingPart) end

--- Override: the work area tied to the planter's ground reference node is inactive while the machine is not turned on.
---@param superFunc any
---@param workArea any
function TreePlanter:getIsWorkAreaActive(superFunc, workArea) end

--- Override: also checks the speed limit when turned on and the implement chain is lowered.
---@param superFunc any
---@return boolean
function TreePlanter:doCheckSpeedLimit(superFunc) end

--- Override that always returns true, so the planter can be selected.
---@param superFunc any
function TreePlanter:getCanBeSelected(superFunc) end

--- Delete listener: forgets a pallet that was mounted or in the trigger when it is deleted.
---@param object any
function TreePlanter:onDeleteTreePlanterObject(object) end

--- Override: also counts as on field when the planter has ground contact, since it needs no field to work.
---@param superFunc any
function TreePlanter:getIsOnField(superFunc) end

--- Trigger callback keeping a counted list of accessible pallet vehicles inside the trigger; registers a delete listener on first entry.
---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function TreePlanter:palletTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

--- Client only: registers the field-limit toggle (IMPLEMENT_EXTRA3, unless forced) and, if configured, the manual plant action.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function TreePlanter:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Input callback: toggles the limit-to-field setting.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function TreePlanter.actionEventToggleTreePlanterFieldLimitation(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback for manual planting: checks ground contact, tree limit, land access and restricted zones, shows a blinking warning on failure, otherwise calls `createTree`.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function TreePlanter.actionEventPlant(self, actionName, inputValue, callbackState, isAnalog) end

--- Returns the default speed limit for this specialization, 5 (km/h presumed, UNVERIFIED).
---@return number
function TreePlanter.getDefaultSpeedLimit() end

--- Returns the nearest pallet from the trigger list, within the mounting range of a reference node, that holds a non-empty fill unit whose fill type the planter supports; nil if none.
---@param self integer
---@param refNode integer
---@param palletsInTrigger any
---@return table
function TreePlanter.getSaplingPalletInRange(self, refNode, palletsInTrigger) end

--- Creates the activatable for a planter and builds its 'refill' prompt text from the vehicle's type description.
---@param treePlanterVehicle table
---@return table
function TreePlanterActivatable.new(treePlanterVehicle) end

--- True when the local player's current vehicle is this planter's root vehicle, no pallet is mounted yet and a pallet is nearby.
---@return boolean
function TreePlanterActivatable:getIsActivatable() end

--- Activation callback: asks the planter to load the nearest sapling pallet via `loadPallet`.
function TreePlanterActivatable:run() end
