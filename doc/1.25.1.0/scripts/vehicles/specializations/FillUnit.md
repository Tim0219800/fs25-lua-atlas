# vehicles/specializations/FillUnit.lua

*[Version française](../../../fr/scripts/vehicles/specializations/FillUnit.md)*

Source: `dataS/scripts/vehicles/specializations/FillUnit.lua` — FS25 1.25.1.0

✍ Vehicle specialization that gives a vehicle or tool one or more fill units (tanks, hoppers, pallets, fuel and so on). It owns capacity, current fill level and fill type per unit, validates which fill types and tool types may enter, synchronizes levels to clients, saves and loads them, drives fill planes, effects, animations, alarms and dashboards, and offers the pallet unloading feature. It has no prerequisites, is configured through the fillUnit configuration in the vehicle XML, and also defines the FillActivatable helper used for refilling from triggers. FillVolume and many other specializations build on it. Server holds the authoritative levels; clients receive them via streams.

- **FillUnit** (l.16)
- **FillActivatable** (l.3302)

## Functions

| Function | Line | Description |
|---|---|---|
| `FillUnit.initSpecialization()` | 33 | ✍ Registers the fillUnit vehicle configuration, the shop spec entries "capacity" and "fillTypes", and the whole XML schema for fill units (capacity, fill types, planes, alarms, effects, dashboards, unloading, leveler and attacher joint extras) plus the savegame keys for unit index, type and level. |
| `FillUnit.registerUnitDisplaySchema(schema: any, key: any)` | 181 | ✍ Registers the two XML attributes shopDisplayUnit and unitTextOverride on a given key, used to show a capacity in the shop in a unit other than liters. |
| `FillUnit.prerequisitesPresent(specializations: any)` | 188 | ✍ Always returns true: this specialization has no prerequisite on other specializations. |
| `FillUnit.registerEvents(vehicleType: any)` | 194 | ✍ Declares the events raised by this specialization, such as onFillUnitFillLevelChanged, onChangedFillType, onAlarmTriggerChanged, the fill trigger add/change/remove events and the unloading events. |
| `FillUnit.registerFunctions(vehicleType: any)` | 208 | ✍ Registers all fill unit functions on the vehicle type (getters, setters, trigger handling, loading helpers, unloading and debug helpers) so they can be called on vehicle instances. |
| `FillUnit.registerOverwrittenFunctions(vehicleType: any)` | 281 | ✍ Overrides base vehicle functions to include fill state: component mass, HUD fill info, fold permission, automated train travel, moving tools, PTO power, turn-on permission, info box, leveler nodes and attacher joints. |
| `FillUnit.registerEventListeners(vehicleType: any)` | 300 | ✍ Subscribes the specialization to vehicle events: load, post load, delete, read/write stream and update stream, update tick, post update, draw, deactivate, action event registration and discharge target changes. |
| `FillUnit:onLoad(savegame: any)` | 318 | ✍ Reads the selected fillUnit configuration, builds every fill unit and unloading place from XML, creates the fill trigger state and its FillActivatable, and on clients loads sounds, effects and animations. A failing unit sets the vehicle loading state to ERROR. |
| `FillUnit:onPostLoad(savegame: any)` | 413 | ✍ Server only: restores fill levels from the savegame (respecting vehicle reset rules) or applies start fill levels, then refreshes alarm triggers. If there are no fill units it removes the stream, update and draw listeners to save work. |
| `FillUnit:onDelete()` | 490 | ✍ Cleans up on removal: unregisters the fill activatable, tells triggers the vehicle is gone, deletes alarm sounds, beacon lights, effects, animations and exact fill root node registrations, and frees samples. |
| `FillUnit:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 532 | ✍ Writes one unit entry (index, fill type name, fill level) to the savegame for every fill unit flagged as needing saving. |
| `FillUnit:saveStatsToXMLFile(xmlFile: any, key: any)` | 549 | ✍ Writes space-separated lists of fill type names and fill levels (3 decimals) for all units to the stats XML. |
| `FillUnit:onReadStream(streamId: any, connection: any)` | 571 | ✍ Client side, initial join: reads the filling flag, then each synchronized unit's level, fill type and last valid fill type sent by the server. |
| `FillUnit:onWriteStream(streamId: any, connection: any)` | 593 | ✍ Server side, initial join: writes the filling flag and, for each synchronized unit, the full 32-bit level, fill type and last valid fill type. |
| `FillUnit:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 612 | ✍ Client side, incremental update: reads level (full float or quantized fraction of capacity) and fill type per unit and applies the difference through addFillUnitFillLevel, emptying the unit when the type is unknown. |
| `FillUnit:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 655 | ✍ Server side, incremental update: when the dirty flag is set, writes each synchronized unit's last sent level (full float for huge capacities or quantized with synchronizationNumBits), fill type and last valid type. |
| `FillUnit:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 684 | ✍ Server: while filling from a trigger, transfers liters per second times elapsed time via trigger:fillVehicle and stops filling when nothing is delivered. Client: updates measurement nodes and alarms and stops fill effects and animations after their timeout. |
| `FillUnit:onPostUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 745 | ✍ Runs and then clears the queued exact fill root aim callbacks registered by other vehicles, skipping vehicles that were deleted meanwhile. |
| `FillUnit:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 758 | ✍ Shows the extra HUD text asking to fill the tool first when getDrawFirstFillText returns true (it returns false in this specialization). |
| `FillUnit:onDeactivate()` | 767 | ✍ Stops an ongoing trigger filling without sending an event and resets the measurement nodes' intensity to zero. |
| `FillUnit:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 780 | ✍ Client: registers the UNLOAD input action when the vehicle defines unloading places, and on a console development build on a server also registers three debug fill unit actions. |
| `FillUnit:onDischargeTargetObjectChanged(dischargeObject: any)` | 809 | ✍ Refreshes the unload action's availability because a discharge target may now conflict with unloading pallets. |
| `FillUnit:getDrawFirstFillText()` | 816 | ✍ Hook returning false by default; specializations may override it to request the "fill the tool first" HUD hint. |
| `FillUnit:getFillUnits()` | 822 | ✍ Returns the array of all fill unit tables of the vehicle (live reference, not a copy). |
| `FillUnit:getFillUnitByIndex(fillUnitIndex: any)` | 829 | ✍ Returns the fill unit table for an index, or nil if that index does not exist. |
| `FillUnit:getFillUnitExists(fillUnitIndex: any)` | 839 | ✍ Returns true when the given index is not nil and refers to an existing fill unit. |
| `FillUnit:getFillUnitCapacity(fillUnitIndex: any)` | 846 | ✍ Returns the capacity of a fill unit in liters (math.huge when unlimited), or nil for an unknown index. |
| `FillUnit:getFillUnitFreeCapacity(fillUnitIndex: integer, fillTypeIndex: integer, farmId: integer)` | 859 | ✍ Returns capacity minus current level, or 0 if the trailer fill limit option is on and the maximum component mass is reached (unless the unit ignores the limit). The fill type and farm arguments are unused. Nil for an unknown unit. |
| `FillUnit:getIsFillAllowedFromFarm(farmId: any)` | 878 | ✍ Always returns true here; the farm id is ignored. Other specializations can override it to restrict filling by farm. |
| `FillUnit:getFillUnitFillLevel(fillUnitIndex: any)` | 884 | ✍ Returns the current fill level in liters of a unit, or nil for an unknown index. |
| `FillUnit:getFillUnitFillLevelPercentage(fillUnitIndex: any)` | 894 | ✍ Returns level divided by capacity as a 0 to 1 fraction (0 when capacity is not positive), or nil for an unknown unit. |
| `FillUnit:getFillUnitFillType(fillUnitIndex: any)` | 910 | ✍ Returns the fill type index currently held by a unit (FillType.UNKNOWN when empty), or nil for an unknown unit. |
| `FillUnit:getFillUnitLastValidFillType(fillUnitIndex: any)` | 920 | ✍ Returns the last fill type that actually had a positive level in the unit, which is kept after emptying. Nil for an unknown unit. |
| `FillUnit:getFillUnitFirstSupportedFillType(fillUnitIndex: any)` | 930 | ✍ Returns an arbitrary first key of the unit's supported fill type table (Lua next, so order is not guaranteed), or nil. |
| `FillUnit:getFillUnitExactFillRootNode(fillUnitIndex: any)` | 940 | ✍ Returns the exact fill root node of a unit, used for precise targeting by fill effects, or nil. |
| `FillUnit:getFillUnitRootNode(fillUnitIndex: any)` | 950 | ✍ Returns the fill root node of a unit (defaults to the first component node at load time), or nil for an unknown unit. |
| `FillUnit:getFillUnitAutoAimTargetNode(fillUnitIndex: any)` | 960 | ✍ Returns the auto aim target node of a unit (nil when the XML defines none), or nil for an unknown unit index. |
| `FillUnit:getFillUnitSupportsFillType(fillUnitIndex: any, fillType: any)` | 970 | ✍ Returns whether a fill type index is in the unit's supported set (the stored table value, true or nil), false for an unknown unit. |
| `FillUnit:getFillUnitSupportsToolType(fillUnitIndex: any, toolType: any)` | 980 | ✍ Returns whether a tool type is supported by the unit; all tool types are enabled at load, so this is normally true. False for an unknown unit. |
| `FillUnit:getFillUnitSupportsToolTypeAndFillType(fillUnitIndex: any, toolType: any, fillType: any)` | 990 | ✍ Combines getFillUnitSupportsToolType and getFillUnitSupportsFillType: true only when both are accepted. |
| `FillUnit:getFillUnitSupportedFillTypes(fillUnitIndex: any)` | 997 | ✍ Returns the table of supported fill types (keys are fill type indices) of a unit, or nil. |
| `FillUnit:getFillUnitSupportedToolTypes(fillUnitIndex: any)` | 1007 | ✍ Returns the table of supported tool types of a unit, or nil for an unknown unit. |
| `FillUnit:getFillUnitAllowsFillType(fillUnitIndex: any, fillType: any)` | 1017 | ✍ True if the fill type is supported and is either the current type or the unit is nearly empty (level fraction at or under the change threshold), so the type can be switched. |
| `FillUnit:getFillTypeChangeThreshold(fillUnitIndex: any)` | 1033 | ✍ Returns the fill type change threshold as a fraction, or in liters (capacity times fraction) when a unit index is given. Default fraction is 0.05. |
| `FillUnit:getFirstValidFillUnitToFill(fillType: any, ignoreCapacity: any)` | 1044 | ✍ Returns the index of the first unit that allows the fill type and has free capacity (or any if ignoreCapacity is true), or nil if none. |
| `FillUnit:getFillUnitCanBeFilled(fillUnitIndex: any, fillType: any, ignoreCapacity: any)` | 1059 | ✍ Returns true when the given unit allows the fill type and has free capacity, or ignoreCapacity is true. |
| `FillUnit:setFillUnitFillType(fillUnitIndex: any, fillTypeIndex: any)` | 1071 | ✍ Directly changes the fill type of a unit and raises onChangedFillType with old and new index if it differs. Does not touch the fill level. |
| `FillUnit:setFillUnitFillTypeToDisplay(fillUnitIndex: any, fillTypeIndex: any, isPersistent: any)` | 1082 | ✍ Overrides the fill type shown on the HUD for a unit; the override is cleared on emptying unless persistent is true. |
| `FillUnit:setFillUnitFillLevelToDisplay(fillUnitIndex: any, fillLevel: any, isPersistent: any)` | 1092 | ✍ Overrides the fill level shown on the HUD for a unit; cleared on emptying unless persistent is true. |
| `FillUnit:setFillUnitCapacityToDisplay(fillUnitIndex: any, capacity: any)` | 1102 | ✍ Overrides the capacity shown on the HUD for a unit without changing the real capacity. |
| `FillUnit:setFillUnitCapacity(fillUnitIndex: any, capacity: any, noEventSend: any)` | 1111 | ✍ Changes a unit's real capacity and, if it changed, sends SetFillUnitCapacityEvent (unless noEventSend) so the change is synchronized. |
| `FillUnit:setFillUnitForcedMaterialFillType(fillUnitIndex: any, forcedMaterialFillType: any)` | 1124 | ✍ Forces the material shown for the unit's fill plane and, if FillVolume is present, its fill volumes, independent of the real fill type. Visual only. |
| `FillUnit:getFillUnitForcedMaterialFillType(fillUnitIndex: any)` | 1139 | ✍ Returns the forced display material fill type of a unit, or FillType.UNKNOWN when none is set. |
| `FillUnit:setFillUnitInTriggerRange(fillUnitIndex: any, isInRange: any)` | 1150 | ✍ Empty hook in this specialization; subclasses or other specializations may override it to react to a unit entering or leaving a trigger range. |
| `FillUnit:updateAlarmTriggers(alarmTriggers: any, fillLevelDelta: any)` | 1155 | ✍ Re-evaluates each given alarm trigger from level and, for directional triggers, from the sign of the last fill level change, then applies the resulting state. |
| `FillUnit:getAlarmTriggerIsActive(alarmTrigger: any)` | 1178 | ✍ Returns true when the unit's level fraction lies between the alarm's minFillLevel and maxFillLevel (inclusive). Divides by capacity, so unlimited units give 0. |
| `FillUnit:setAlarmTriggerState(alarmTrigger: any, state: any)` | 1191 | ✍ On a state change, plays or stops the alarm sound, switches beacon lights (optionally auto-off after activeDuration), tracks the active alarm and raises onAlarmTriggerChanged. |
| `FillUnit:getFillUnitIndexFromNode(node: any)` | 1230 | ✍ Returns the fill unit index owning the given exact fill root node, or nil. |
| `FillUnit:getFillUnitExtraDistanceFromNode(node: any)` | 1242 | ✍ Returns the extra effect distance configured for an exact fill root node, 0 by default. |
| `FillUnit:getFillUnitFromNode(node: any)` | 1249 | ✍ Returns the fill unit table that owns the given exact fill root node, or nil. |
| `FillUnit:emptyAllFillUnits(ignoreDeleteOnEmptyFlag: any)` | 1256 | ✍ Empties every unit by adding minus infinity to its level; with ignoreDeleteOnEmptyFlag the vehicle is not removed even if configured to delete when empty. |
| `FillUnit:loadFillUnitUnloadingFromXML(xmlFile: any, key: any, entry: any, index: any)` | 1273 | ✍ Reads one unloading place from XML: node (defaults to the root node), width (default 15) and offset. Always returns true. Note: the iteration index passed by onLoad is unused. |
| `FillUnit:getFillUnitUnloadPalletFilename(fillUnitIndex: any)` | 1283 | ✍ Returns the pallet XML filename of the unit's current fill type, or nil if the unit is empty. |
| `FillUnit:getFillUnitHasMountedPalletsToUnload()` | 1295 | ✍ Hook returning false by default; overridden by vehicles that carry mounted pallets which can be unloaded. |
| `FillUnit:getFillUnitMountedPalletsToUnload()` | 1301 | ✍ Hook returning nil by default; overridden to return the list of mounted pallets to unload. |
| `FillUnit:getFillUnitUnloadingTasks()` | 1307 | ✍ Builds a list of unloading tasks, one per unloadable non-empty unit with a pallet file, each with unit index, fill type, level and pallet filename. |
| `FillUnit:getFillUnitEmptyOnReset()` | 1325 | ✍ Returns true by default: units without start fill level are emptied when vehicles are reset instead of loaded from the savegame. |
| `FillUnit:getAllowLoadTriggerActivation(rootVehicle: any)` | 1331 | ✍ Returns true only when this vehicle's root vehicle is the one the local player is currently in, so only the player's own vehicle can be refilled from a trigger. |
| `FillUnit:addExactFillRootAimToUpdate(vehicle: any, func: any)` | 1345 | ✍ Queues a callback for another vehicle to be run (once) in this vehicle's next post update, for exact fill root aiming. |
| `FillUnit:unloadFillUnits(ignoreWarning: any)` | 1352 | ✍ Client: asks the server via FillUnitUnloadEvent. Server: places mounted pallets and spawns new pallet vehicles on the unloading places, filling them with the unit contents, then raises onFillUnitUnloaded and broadcasts FillUnitUnloadedEvent. Shows a notification when there is no space. |
| `FillUnit:addFillUnitFillLevel(farmId: any, fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any)` | 1485 | ✍ Central function to add or remove liters in a unit and returns the applied delta. Checks farm access, mass limit and tool and fill type support, may switch the fill type, updates sync flags, mass, planes, alarms, effects, animations and dashboards, raises onFillUnitFillLevelChanged and may delete the vehicle when empty. |
| `FillUnit:setFillUnitLastValidFillType(fillUnitIndex: any, fillType: any, force: any)` | 1760 | ✍ Sets the last valid fill type of a unit and its sent copy, and raises the dirty flag so the change is synchronized, if the value differs. |
| `FillUnit:loadFillUnitFromXML(xmlFile: any, key: any, entry: any, index: any)` | 1772 | ✍ Loads one fill unit from XML: capacity, supported fill types or categories (one of the two is required, else it fails), start fill, nodes, network bits, HUD options, animations, and on clients alarms, measurement nodes, fill plane, materials, effects and dashboard values. Note: useMaxStateIfEmpty defaults to false here but the schema documents true. |
| `FillUnit:loadAlarmTrigger(xmlFile: any, key: any, alarmTrigger: any, fillUnit: any)` | 2061 | ✍ Loads an alarm trigger from XML: required min and max fill level fractions, alarm sound, beacon lights and direction. Returns false when a required level is missing. Note: needsTurnOn and turnOffInTrigger are registered in the schema but not read here. |
| `FillUnit:loadMeasurementNode(xmlFile: any, key: any, entry: any)` | 2095 | ✍ Loads a measurement node (shader-driven fill gauge) from XML; returns false and warns if the node is missing. |
| `FillUnit:updateMeasurementNodes(fillUnit: any, dt: any, setActive: any, forcedIntensity: any)` | 2112 | ✍ Drives the measurement nodes' shader parameters fillLevel and prevFillLevel with a 5 second visibility timer and intensity boosted by vehicle speed above about 10 km/h. Client only in practice. |
| `FillUnit:loadFillPlane(xmlFile: any, key: any, fillPlane: any, fillUnit: any)` | 2137 | ✍ Loads the fill plane of a unit: moving nodes with keyframed or min/max Y animation curves, assigns the base material "fillPlane" and terrain texture arrays, and resolves the default fill type. Returns false when absent or invalid default type. |
| `FillUnit:setFillPlaneForcedFillType(fillUnitIndex: any, forcedFillType: any)` | 2241 | ✍ Stores a forced fill type on the unit's fill plane, if the unit has one. Visual use. Note: updateFillUnitFillPlane does not read this value in this file. |
| `FillUnit:updateFillUnitFillPlane(fillUnit: any)` | 2252 | ✍ Positions, rotates, scales and shows the fill plane nodes from the unit's level fraction through the animation curves, and sets the shader fillTypeId texture index when the fill type changes. Note: lastFillPlaneType is never updated, so the shader parameter is rewritten each call. |
| `FillUnit:loadFillTypeMaterials(xmlFile: any, key: any)` | 2279 | ✍ Reads the fillTypeMaterials list: either a target node plus reference node whose material is copied, or a material slot name plus custom diffuse texture. Invalid entries are skipped with warnings. Returns the list. |
| `FillUnit:updateFillTypeMaterials(fillTypeMaterials: any, fillTypeIndex: any)` | 2332 | ✍ For each entry matching the new fill type, either copies the reference node material onto the target node or replaces the slot's diffuse map from file across the vehicle's nodes. |
| `FillUnit:updateFillUnitAutoAimTarget(fillUnit: any)` | 2352 | ✍ Moves the unit's auto aim target node along Z between startZ and endZ according to the fill level above the start percentage (optionally inverted). |
| `FillUnit:addFillUnitTrigger(trigger: table, fillTypeIndex: integer, fillUnitIndex: any)` | 2371 | ✍ Registers a fill trigger that currently reaches the vehicle. The first one registers the fill activatable and, on platforms with automatic filling, starts filling. Raises onAddedFillUnitTrigger and re-sorts triggers. |
| `FillUnit:removeFillUnitTrigger(trigger: table)` | 2391 | ✍ Unregisters a fill trigger, stops filling on the server if it was the active one, removes the activatable when none remain, raises onRemovedFillUnitTrigger and re-sorts. |
| `FillUnit:updateFillUnitTriggers()` | 2415 | ✍ Sorts the triggers (fillable ones first, fuller units first), updates the activatable's fill type from the first trigger and raises onFillUnitTriggerChanged when the selected trigger changes. |
| `FillUnit:setFillUnitIsFilling(isFilling: any, noEventSend: any)` | 2450 | ✍ Starts or stops refilling from a trigger. Unless noEventSend, sends SetFillUnitIsFillingEvent. Picks the first activatable trigger, toggles fill sounds, raises onFillUnitIsFillingStateChanged and re-sorts triggers when stopping. |
| `FillUnit:setFillSoundIsPlaying(isPlaying: any)` | 2495 | ✍ Starts or stops the looping fill sound sample depending on the argument, only acting when the playing state differs. |
| `FillUnit:getIsFillUnitActive(fillUnitIndex: any)` | 2510 | ✍ Returns true by default; hook that other specializations can override to deactivate a unit. |
| `FillUnit:getAdditionalComponentMass(superFunc: any, component: any)` | 2518 | ✍ Overrides the vehicle function: adds the mass of each unit's content (level times the fill type's mass per liter) to the component that is the unit's fill mass node. |
| `FillUnit:getFillLevelInformation(superFunc: function, display: table)` | 2537 | ✍ Overrides the vehicle function: adds one HUD entry per visible unit (type, level, capacity, precision, max reached flag, display style), merging parent and child units and showing the sole supported type when empty. |
| `FillUnit:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 2588 | ✍ Overrides fold permission: when folding while filled is forbidden, returns false and a warning text if any unit exceeds its folding threshold (for the configured fill type if given); otherwise defers to the parent. |
| `FillUnit:getIsReadyForAutomatedTrainTravel(superFunc: any)` | 2603 | ✍ Overrides the train readiness check: returns false if any unit flagged blocksAutomatedTrainTravel is not empty, otherwise defers to the parent. |
| `FillUnit:loadMovingToolFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 2616 | ✍ Extends moving tool loading with fillUnitIndex, minFillLevel and maxFillLevel attributes after the parent loader succeeds. |
| `FillUnit:getIsMovingToolActive(superFunc: any, movingTool: any)` | 2630 | ✍ Overrides moving tool activity: when linked to a fill unit, returns false if the fill fraction is above minFillLevel or below maxFillLevel. Note: this looks inverted compared with the leveler and attacher joint checks, and the min and max defaults are nil, which would error if only the index is set. |
| `FillUnit:getDoConsumePtoPower(superFunc: any)` | 2643 | ✍ Overrides PTO power consumption: also true while the vehicle is filling from a trigger and consumePtoPower is configured. |
| `FillUnit:getIsPowerTakeOffActive(superFunc: any)` | 2650 | ✍ Overrides PTO activity: also true while filling from a trigger when consumePtoPower is configured. |
| `FillUnit:getCanBeTurnedOn(superFunc: any)` | 2657 | ✍ Overrides turn-on permission: returns false while an active alarm trigger has turnOffInTrigger set, else defers to the parent. Note: loadAlarmTrigger never reads that flag from XML. |
| `FillUnit:showInfo(superFunc: any, box: any)` | 2671 | ✍ Overrides the info box: lists the total level per fill type (with the unit text and precision) for units visible in the info HUD, rebuilt only when the cached info is dirty, then calls the parent. |
| `FillUnit:loadLevelerNodeFromXML(superFunc: any, levelerNode: any, xmlFile: any, key: any)` | 2717 | ✍ Extends leveler node loading with fillUnitIndex (default 1) and min and max fill fraction limits. |
| `FillUnit:getIsLevelerPickupNodeActive(superFunc: any, levelerNode: any)` | 2727 | ✍ Overrides leveler pickup activity: returns false when the linked unit's fill fraction is outside the node's min and max range, else defers to the parent. |
| `FillUnit:loadAttacherJointFromXML(superFunc: table, attacherJoint: table, xmlFile: string, baseName: string, index: integer)` | 2742 | ✍ Extends attacher joint loading with fillUnitIndex, fillUnitTopArmOnly, minFillLevel and maxFillLevel when a fill unit index is configured. |
| `FillUnit:getIsAttacherJointCompatible(superFunc: any, vehicle: any, attacherJoint: any, inputAttacherVehicle: any, inputAttacherJoint: any)` | 2755 | ✍ Overrides joint compatibility: returns false with a warning text when the linked unit's fill fraction is outside the joint's allowed range (for top-arm-only joints only if the implement has a top reference node). |
| `FillUnit:debugGetSupportedFillTypesPerFillUnit()` | 2770 | ✍ Debug helper returning a table mapping each fill unit index to its supported fill type set. |
| `FillUnit.addFillTypeSources(sources: any, currentVehicle: any, excludeVehicle: any, fillTypes: any)` | 2780 | ✍ Recursively walks a vehicle and its attached implements (skipping the excluded vehicle) and fills sources[fillType] with entries holding vehicle and fill unit index for units supporting the wanted fill types. |
| `FillUnit.loadSpecValueCapacity(xmlFile: any, customEnvironment: any, baseDir: any)` | 2809 | ✍ Shop spec loader: reads capacities per fill unit configuration (or the storeData capacity override), converting them with the display unit when set. Returns a list of configurations or nil. |
| `FillUnit.getSpecValueCapacity(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 2874 | ✍ Shop spec getter: computes the capacity text for the selected configuration or a min to max range across selectable configurations, using the real item's current capacity when available. Can return values instead of text when returnValues is set. |
| `FillUnit.getCapacityFromXml(xmlFile: any)` | 2965 | ✍ Returns the largest unit capacity found in any fill unit configuration of a vehicle XML file, 0 if none. |
| `FillUnit.loadSpecValueFillTypes(xmlFile: any, customEnvironment: any, baseDir: any)` | 2980 | ✍ Shop spec loader: collects fill type and category names of all configurations (skipping hidden or zero-capacity units), plus storeData overrides, fruit types and windrow conversion types, into one descriptor table. |
| `FillUnit.getFillTypeNamesFromXML(xmlFile: any)` | 3078 | ✍ Reads all fill type names and fill type category names of units with positive or unspecified capacity from a vehicle XML and returns them as two space-joined strings. |
| `FillUnit.getSpecValueFillTypes(storeItem: any, realItem: any, configurations: any)` | 3113 | ✍ Shop spec getter: resolves the loaded descriptor (for the chosen configuration if given) to a list of fill type indices via categories, names, fruit types, fruit categories or windrow types. Returns nil when none. |
| `FillUnit.loadSpecValueFillUnitMassData(xmlFile: any, customEnvironment: any, baseDir: any)` | 3155 | ✍ Collects data used to estimate a vehicle's start mass: consumer tanks of the first consumer configuration and fill units with a start fill level and type from the first fill unit configuration. |
| `FillUnit.getSpecValueStartFillUnitMassByMassData(fillUnitMassData: any)` | 3189 | ✍ Sums capacity times mass per liter over the collected mass data, using the first fill type of each category or name list. Returns the mass total (game mass units). |
| `FillUnit.actionEventConsoleFillUnitNext(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3214 | ✍ Debug action: for the selected vehicle, empties unit 1 and fills it with 100 liters of the next supported fill type. Only registered on console development builds. |
| `FillUnit.actionEventConsoleFillUnitInc(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3242 | ✍ Debug action: adds 1000 liters to unit 1 of the selected vehicle, choosing a supported type if it is empty. |
| `FillUnit.actionEventConsoleFillUnitDec(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3255 | ✍ Debug action: removes 1000 liters from unit 1 of the selected vehicle. |
| `FillUnit.actionEventUnload(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3264 | ✍ Input callback for the UNLOAD action: calls unloadFillUnits on the vehicle. |
| `FillUnit.updateUnloadActionDisplay(self: any)` | 3270 | ✍ Activates the unload action only when some unloadable unit holds something with a pallet, or mounted pallets exist, and no discharge target is currently set. |
| `FillActivatable.new(vehicle: any)` | 3306 | ✍ Creates the helper object used by the activatable system to start and stop refilling from a trigger for a given vehicle; starts with an unknown fill type. |
| `FillActivatable:getIsActivatable()` | 3318 | ✍ True when the vehicle is active for input, has a unit that can take the current fill type with more than 1 liter free, supports trigger tool type, and some trigger is activatable; also refreshes the prompt text. |
| `FillActivatable:run()` | 3344 | ✍ Toggles the vehicle's trigger filling state and refreshes the prompt text. |
| `FillActivatable:activate()` | 3352 | ✍ Called when the player enters range: registers this object as drawable so draw is called each frame. |
| `FillActivatable:deactivate()` | 3358 | ✍ Called when leaving range: removes the object from the mission's drawables. |
| `FillActivatable:draw()` | 3364 | ✍ Shows the fuel context HUD for the vehicle when the activatable's fill type is diesel fuel. |
| `FillActivatable:updateActivateText(isFilling: any)` | 3372 | ✍ Sets the prompt text to either the stop or start refilling string with the vehicle's type description. |
| `FillActivatable:setFillType(fillTypeIndex: any)` | 3383 | ✍ Sets the fill type index this activatable is about, used when checking whether a unit can take it. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onFillUnitFillLevelChanged` | 195 |
| registerEvent | `onChangedFillType` | 196 |
| registerEvent | `onAlarmTriggerChanged` | 197 |
| registerEvent | `onAddedFillUnitTrigger` | 198 |
| registerEvent | `onFillUnitTriggerChanged` | 199 |
| registerEvent | `onRemovedFillUnitTrigger` | 200 |
| registerEvent | `onFillUnitIsFillingStateChanged` | 201 |
| registerEvent | `onFillUnitUnloadPallet` | 202 |
| registerEvent | `onFillUnitUnloaded` | 203 |
| registerFunction | `getDrawFirstFillText` | 209 |
| registerFunction | `getFillUnits` | 210 |
| registerFunction | `getFillUnitByIndex` | 211 |
| registerFunction | `getFillUnitExists` | 212 |
| registerFunction | `getFillUnitCapacity` | 213 |
| registerFunction | `getFillUnitFreeCapacity` | 214 |
| registerFunction | `getIsFillAllowedFromFarm` | 215 |
| registerFunction | `getFillUnitFillLevel` | 216 |
| registerFunction | `getFillUnitFillLevelPercentage` | 217 |
| registerFunction | `getFillUnitFillType` | 218 |
| registerFunction | `getFillUnitLastValidFillType` | 219 |
| registerFunction | `getFillUnitFirstSupportedFillType` | 220 |
| registerFunction | `getFillUnitExactFillRootNode` | 221 |
| registerFunction | `getFillUnitRootNode` | 222 |
| registerFunction | `getFillUnitAutoAimTargetNode` | 223 |
| registerFunction | `getFillUnitSupportsFillType` | 224 |
| registerFunction | `getFillUnitSupportsToolType` | 225 |
| registerFunction | `getFillUnitSupportsToolTypeAndFillType` | 226 |
| registerFunction | `getFillUnitSupportedFillTypes` | 227 |
| registerFunction | `getFillUnitSupportedToolTypes` | 228 |
| registerFunction | `getFillUnitAllowsFillType` | 229 |
| registerFunction | `getFillTypeChangeThreshold` | 230 |
| registerFunction | `getFirstValidFillUnitToFill` | 231 |
| registerFunction | `getFillUnitCanBeFilled` | 232 |
| registerFunction | `setFillUnitFillType` | 233 |
| registerFunction | `setFillUnitFillTypeToDisplay` | 234 |
| registerFunction | `setFillUnitFillLevelToDisplay` | 235 |
| registerFunction | `setFillUnitCapacityToDisplay` | 236 |
| registerFunction | `setFillUnitCapacity` | 237 |
| registerFunction | `setFillUnitForcedMaterialFillType` | 238 |
| registerFunction | `getFillUnitForcedMaterialFillType` | 239 |
| registerFunction | `setFillUnitInTriggerRange` | 240 |
| registerFunction | `updateAlarmTriggers` | 241 |
| registerFunction | `getAlarmTriggerIsActive` | 242 |
| registerFunction | `setAlarmTriggerState` | 243 |
| registerFunction | `getFillUnitIndexFromNode` | 244 |
| registerFunction | `getFillUnitExtraDistanceFromNode` | 245 |
| registerFunction | `getFillUnitFromNode` | 246 |
| registerFunction | `addFillUnitFillLevel` | 247 |
| registerFunction | `setFillUnitLastValidFillType` | 248 |
| registerFunction | `loadFillUnitFromXML` | 249 |
| registerFunction | `loadAlarmTrigger` | 250 |
| registerFunction | `loadMeasurementNode` | 251 |
| registerFunction | `updateMeasurementNodes` | 252 |
| registerFunction | `loadFillPlane` | 253 |
| registerFunction | `setFillPlaneForcedFillType` | 254 |
| registerFunction | `updateFillUnitFillPlane` | 255 |
| registerFunction | `loadFillTypeMaterials` | 256 |
| registerFunction | `updateFillTypeMaterials` | 257 |
| registerFunction | `updateFillUnitAutoAimTarget` | 258 |
| registerFunction | `addFillUnitTrigger` | 259 |
| registerFunction | `removeFillUnitTrigger` | 260 |
| registerFunction | `setFillUnitIsFilling` | 261 |
| registerFunction | `setFillSoundIsPlaying` | 262 |
| registerFunction | `getIsFillUnitActive` | 263 |
| registerFunction | `updateFillUnitTriggers` | 264 |
| registerFunction | `emptyAllFillUnits` | 265 |
| registerFunction | `unloadFillUnits` | 266 |
| registerFunction | `loadFillUnitUnloadingFromXML` | 267 |
| registerFunction | `getFillUnitUnloadPalletFilename` | 268 |
| registerFunction | `getFillUnitHasMountedPalletsToUnload` | 269 |
| registerFunction | `getFillUnitMountedPalletsToUnload` | 270 |
| registerFunction | `getFillUnitUnloadingTasks` | 271 |
| registerFunction | `getFillUnitEmptyOnReset` | 272 |
| registerFunction | `getAllowLoadTriggerActivation` | 273 |
| registerFunction | `addExactFillRootAimToUpdate` | 274 |
| registerFunction | `debugGetSupportedFillTypesPerFillUnit` | 275 |
| registerOverwrittenFunction | `getAdditionalComponentMass` | 282 |
| registerOverwrittenFunction | `getFillLevelInformation` | 283 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 284 |
| registerOverwrittenFunction | `getIsReadyForAutomatedTrainTravel` | 285 |
| registerOverwrittenFunction | `loadMovingToolFromXML` | 286 |
| registerOverwrittenFunction | `getIsMovingToolActive` | 287 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 288 |
| registerOverwrittenFunction | `getIsPowerTakeOffActive` | 289 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 290 |
| registerOverwrittenFunction | `showInfo` | 291 |
| registerOverwrittenFunction | `loadLevelerNodeFromXML` | 292 |
| registerOverwrittenFunction | `getIsLevelerPickupNodeActive` | 293 |
| registerOverwrittenFunction | `loadAttacherJointFromXML` | 294 |
| registerOverwrittenFunction | `getIsAttacherJointCompatible` | 295 |
| registerEventListener | `onLoad` | 301 |
| registerEventListener | `onPostLoad` | 302 |
| registerEventListener | `onDelete` | 303 |
| registerEventListener | `onReadStream` | 304 |
| registerEventListener | `onWriteStream` | 305 |
| registerEventListener | `onReadUpdateStream` | 306 |
| registerEventListener | `onWriteUpdateStream` | 307 |
| registerEventListener | `onUpdateTick` | 308 |
| registerEventListener | `onPostUpdate` | 309 |
| registerEventListener | `onDraw` | 310 |
| registerEventListener | `onDeactivate` | 311 |
| registerEventListener | `onRegisterActionEvents` | 312 |
| registerEventListener | `onDischargeTargetObjectChanged` | 313 |
