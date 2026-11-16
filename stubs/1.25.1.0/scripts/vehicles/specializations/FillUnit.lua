---@meta
-- FS25 1.25.1.0 : vehicles/specializations/FillUnit.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization that gives a vehicle or tool one or more fill units (tanks, hoppers, pallets, fuel and so on). It owns capacity, current fill level and fill type per unit, validates which fill types and tool types may enter, synchronizes levels to clients, saves and loads them, drives fill planes, effects, animations, alarms and dashboards, and offers the pallet unloading feature. It has no prerequisites, is configured through the fillUnit configuration in the vehicle XML, and also defines the FillActivatable helper used for refilling from triggers. FillVolume and many other specializations build on it. Server holds the authoritative levels; clients receive them via streams.
---@class FillUnit
FillUnit = {}

--- Vehicle specialization that gives a vehicle or tool one or more fill units (tanks, hoppers, pallets, fuel and so on). It owns capacity, current fill level and fill type per unit, validates which fill types and tool types may enter, synchronizes levels to clients, saves and loads them, drives fill planes, effects, animations, alarms and dashboards, and offers the pallet unloading feature. It has no prerequisites, is configured through the fillUnit configuration in the vehicle XML, and also defines the FillActivatable helper used for refilling from triggers. FillVolume and many other specializations build on it. Server holds the authoritative levels; clients receive them via streams.
---@class FillActivatable
FillActivatable = {}

--- Registers the fillUnit vehicle configuration, the shop spec entries "capacity" and "fillTypes", and the whole XML schema for fill units (capacity, fill types, planes, alarms, effects, dashboards, unloading, leveler and attacher joint extras) plus the savegame keys for unit index, type and level.
function FillUnit.initSpecialization() end

--- Registers the two XML attributes shopDisplayUnit and unitTextOverride on a given key, used to show a capacity in the shop in a unit other than liters.
---@param schema any
---@param key any
function FillUnit.registerUnitDisplaySchema(schema, key) end

--- Always returns true: this specialization has no prerequisite on other specializations.
---@param specializations any
function FillUnit.prerequisitesPresent(specializations) end

--- Declares the events raised by this specialization, such as onFillUnitFillLevelChanged, onChangedFillType, onAlarmTriggerChanged, the fill trigger add/change/remove events and the unloading events.
---@param vehicleType any
function FillUnit.registerEvents(vehicleType) end

--- Registers all fill unit functions on the vehicle type (getters, setters, trigger handling, loading helpers, unloading and debug helpers) so they can be called on vehicle instances.
---@param vehicleType any
function FillUnit.registerFunctions(vehicleType) end

--- Overrides base vehicle functions to include fill state: component mass, HUD fill info, fold permission, automated train travel, moving tools, PTO power, turn-on permission, info box, leveler nodes and attacher joints.
---@param vehicleType any
function FillUnit.registerOverwrittenFunctions(vehicleType) end

--- Subscribes the specialization to vehicle events: load, post load, delete, read/write stream and update stream, update tick, post update, draw, deactivate, action event registration and discharge target changes.
---@param vehicleType any
function FillUnit.registerEventListeners(vehicleType) end

--- Reads the selected fillUnit configuration, builds every fill unit and unloading place from XML, creates the fill trigger state and its FillActivatable, and on clients loads sounds, effects and animations. A failing unit sets the vehicle loading state to ERROR.
---@param savegame any
function FillUnit:onLoad(savegame) end

--- Server only: restores fill levels from the savegame (respecting vehicle reset rules) or applies start fill levels, then refreshes alarm triggers. If there are no fill units it removes the stream, update and draw listeners to save work.
---@param savegame any
function FillUnit:onPostLoad(savegame) end

--- Cleans up on removal: unregisters the fill activatable, tells triggers the vehicle is gone, deletes alarm sounds, beacon lights, effects, animations and exact fill root node registrations, and frees samples.
function FillUnit:onDelete() end

--- Writes one unit entry (index, fill type name, fill level) to the savegame for every fill unit flagged as needing saving.
---@param xmlFile any
---@param key any
---@param usedModNames any
function FillUnit:saveToXMLFile(xmlFile, key, usedModNames) end

--- Writes space-separated lists of fill type names and fill levels (3 decimals) for all units to the stats XML.
---@param xmlFile any
---@param key any
function FillUnit:saveStatsToXMLFile(xmlFile, key) end

--- Client side, initial join: reads the filling flag, then each synchronized unit's level, fill type and last valid fill type sent by the server.
---@param streamId any
---@param connection any
function FillUnit:onReadStream(streamId, connection) end

--- Server side, initial join: writes the filling flag and, for each synchronized unit, the full 32-bit level, fill type and last valid fill type.
---@param streamId any
---@param connection any
function FillUnit:onWriteStream(streamId, connection) end

--- Client side, incremental update: reads level (full float or quantized fraction of capacity) and fill type per unit and applies the difference through addFillUnitFillLevel, emptying the unit when the type is unknown.
---@param streamId any
---@param timestamp any
---@param connection any
function FillUnit:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side, incremental update: when the dirty flag is set, writes each synchronized unit's last sent level (full float for huge capacities or quantized with synchronizationNumBits), fill type and last valid type.
---@param streamId any
---@param connection any
---@param dirtyMask any
function FillUnit:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Server: while filling from a trigger, transfers liters per second times elapsed time via trigger:fillVehicle and stops filling when nothing is delivered. Client: updates measurement nodes and alarms and stops fill effects and animations after their timeout.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function FillUnit:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Runs and then clears the queued exact fill root aim callbacks registered by other vehicles, skipping vehicles that were deleted meanwhile.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function FillUnit:onPostUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Shows the extra HUD text asking to fill the tool first when getDrawFirstFillText returns true (it returns false in this specialization).
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function FillUnit:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Stops an ongoing trigger filling without sending an event and resets the measurement nodes' intensity to zero.
function FillUnit:onDeactivate() end

--- Client: registers the UNLOAD input action when the vehicle defines unloading places, and on a console development build on a server also registers three debug fill unit actions.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function FillUnit:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Refreshes the unload action's availability because a discharge target may now conflict with unloading pallets.
---@param dischargeObject any
function FillUnit:onDischargeTargetObjectChanged(dischargeObject) end

--- Hook returning false by default; specializations may override it to request the "fill the tool first" HUD hint.
function FillUnit:getDrawFirstFillText() end

--- Returns the array of all fill unit tables of the vehicle (live reference, not a copy).
function FillUnit:getFillUnits() end

--- Returns the fill unit table for an index, or nil if that index does not exist.
---@param fillUnitIndex any
function FillUnit:getFillUnitByIndex(fillUnitIndex) end

--- Returns true when the given index is not nil and refers to an existing fill unit.
---@param fillUnitIndex any
function FillUnit:getFillUnitExists(fillUnitIndex) end

--- Returns the capacity of a fill unit in liters (math.huge when unlimited), or nil for an unknown index.
---@param fillUnitIndex any
function FillUnit:getFillUnitCapacity(fillUnitIndex) end

--- Returns capacity minus current level, or 0 if the trailer fill limit option is on and the maximum component mass is reached (unless the unit ignores the limit). The fill type and farm arguments are unused. Nil for an unknown unit.
---@param fillUnitIndex integer
---@param fillTypeIndex integer
---@param farmId integer
function FillUnit:getFillUnitFreeCapacity(fillUnitIndex, fillTypeIndex, farmId) end

--- Always returns true here; the farm id is ignored. Other specializations can override it to restrict filling by farm.
---@param farmId any
function FillUnit:getIsFillAllowedFromFarm(farmId) end

--- Returns the current fill level in liters of a unit, or nil for an unknown index.
---@param fillUnitIndex any
function FillUnit:getFillUnitFillLevel(fillUnitIndex) end

--- Returns level divided by capacity as a 0 to 1 fraction (0 when capacity is not positive), or nil for an unknown unit.
---@param fillUnitIndex any
function FillUnit:getFillUnitFillLevelPercentage(fillUnitIndex) end

--- Returns the fill type index currently held by a unit (FillType.UNKNOWN when empty), or nil for an unknown unit.
---@param fillUnitIndex any
function FillUnit:getFillUnitFillType(fillUnitIndex) end

--- Returns the last fill type that actually had a positive level in the unit, which is kept after emptying. Nil for an unknown unit.
---@param fillUnitIndex any
function FillUnit:getFillUnitLastValidFillType(fillUnitIndex) end

--- Returns an arbitrary first key of the unit's supported fill type table (Lua next, so order is not guaranteed), or nil.
---@param fillUnitIndex any
function FillUnit:getFillUnitFirstSupportedFillType(fillUnitIndex) end

--- Returns the exact fill root node of a unit, used for precise targeting by fill effects, or nil.
---@param fillUnitIndex any
function FillUnit:getFillUnitExactFillRootNode(fillUnitIndex) end

--- Returns the fill root node of a unit (defaults to the first component node at load time), or nil for an unknown unit.
---@param fillUnitIndex any
function FillUnit:getFillUnitRootNode(fillUnitIndex) end

--- Returns the auto aim target node of a unit (nil when the XML defines none), or nil for an unknown unit index.
---@param fillUnitIndex any
function FillUnit:getFillUnitAutoAimTargetNode(fillUnitIndex) end

--- Returns whether a fill type index is in the unit's supported set (the stored table value, true or nil), false for an unknown unit.
---@param fillUnitIndex any
---@param fillType any
function FillUnit:getFillUnitSupportsFillType(fillUnitIndex, fillType) end

--- Returns whether a tool type is supported by the unit; all tool types are enabled at load, so this is normally true. False for an unknown unit.
---@param fillUnitIndex any
---@param toolType any
function FillUnit:getFillUnitSupportsToolType(fillUnitIndex, toolType) end

--- Combines getFillUnitSupportsToolType and getFillUnitSupportsFillType: true only when both are accepted.
---@param fillUnitIndex any
---@param toolType any
---@param fillType any
function FillUnit:getFillUnitSupportsToolTypeAndFillType(fillUnitIndex, toolType, fillType) end

--- Returns the table of supported fill types (keys are fill type indices) of a unit, or nil.
---@param fillUnitIndex any
function FillUnit:getFillUnitSupportedFillTypes(fillUnitIndex) end

--- Returns the table of supported tool types of a unit, or nil for an unknown unit.
---@param fillUnitIndex any
function FillUnit:getFillUnitSupportedToolTypes(fillUnitIndex) end

--- True if the fill type is supported and is either the current type or the unit is nearly empty (level fraction at or under the change threshold), so the type can be switched.
---@param fillUnitIndex any
---@param fillType any
function FillUnit:getFillUnitAllowsFillType(fillUnitIndex, fillType) end

--- Returns the fill type change threshold as a fraction, or in liters (capacity times fraction) when a unit index is given. Default fraction is 0.05.
---@param fillUnitIndex any
function FillUnit:getFillTypeChangeThreshold(fillUnitIndex) end

--- Returns the index of the first unit that allows the fill type and has free capacity (or any if ignoreCapacity is true), or nil if none.
---@param fillType any
---@param ignoreCapacity any
function FillUnit:getFirstValidFillUnitToFill(fillType, ignoreCapacity) end

--- Returns true when the given unit allows the fill type and has free capacity, or ignoreCapacity is true.
---@param fillUnitIndex any
---@param fillType any
---@param ignoreCapacity any
function FillUnit:getFillUnitCanBeFilled(fillUnitIndex, fillType, ignoreCapacity) end

--- Directly changes the fill type of a unit and raises onChangedFillType with old and new index if it differs. Does not touch the fill level.
---@param fillUnitIndex any
---@param fillTypeIndex any
function FillUnit:setFillUnitFillType(fillUnitIndex, fillTypeIndex) end

--- Overrides the fill type shown on the HUD for a unit; the override is cleared on emptying unless persistent is true.
---@param fillUnitIndex any
---@param fillTypeIndex any
---@param isPersistent any
function FillUnit:setFillUnitFillTypeToDisplay(fillUnitIndex, fillTypeIndex, isPersistent) end

--- Overrides the fill level shown on the HUD for a unit; cleared on emptying unless persistent is true.
---@param fillUnitIndex any
---@param fillLevel any
---@param isPersistent any
function FillUnit:setFillUnitFillLevelToDisplay(fillUnitIndex, fillLevel, isPersistent) end

--- Overrides the capacity shown on the HUD for a unit without changing the real capacity.
---@param fillUnitIndex any
---@param capacity any
function FillUnit:setFillUnitCapacityToDisplay(fillUnitIndex, capacity) end

--- Changes a unit's real capacity and, if it changed, sends SetFillUnitCapacityEvent (unless noEventSend) so the change is synchronized.
---@param fillUnitIndex any
---@param capacity any
---@param noEventSend any
function FillUnit:setFillUnitCapacity(fillUnitIndex, capacity, noEventSend) end

--- Forces the material shown for the unit's fill plane and, if FillVolume is present, its fill volumes, independent of the real fill type. Visual only.
---@param fillUnitIndex any
---@param forcedMaterialFillType any
function FillUnit:setFillUnitForcedMaterialFillType(fillUnitIndex, forcedMaterialFillType) end

--- Returns the forced display material fill type of a unit, or FillType.UNKNOWN when none is set.
---@param fillUnitIndex any
function FillUnit:getFillUnitForcedMaterialFillType(fillUnitIndex) end

--- Empty hook in this specialization; subclasses or other specializations may override it to react to a unit entering or leaving a trigger range.
---@param fillUnitIndex any
---@param isInRange any
function FillUnit:setFillUnitInTriggerRange(fillUnitIndex, isInRange) end

--- Re-evaluates each given alarm trigger from level and, for directional triggers, from the sign of the last fill level change, then applies the resulting state.
---@param alarmTriggers any
---@param fillLevelDelta any
function FillUnit:updateAlarmTriggers(alarmTriggers, fillLevelDelta) end

--- Returns true when the unit's level fraction lies between the alarm's minFillLevel and maxFillLevel (inclusive). Divides by capacity, so unlimited units give 0.
---@param alarmTrigger any
function FillUnit:getAlarmTriggerIsActive(alarmTrigger) end

--- On a state change, plays or stops the alarm sound, switches beacon lights (optionally auto-off after activeDuration), tracks the active alarm and raises onAlarmTriggerChanged.
---@param alarmTrigger any
---@param state any
function FillUnit:setAlarmTriggerState(alarmTrigger, state) end

--- Returns the fill unit index owning the given exact fill root node, or nil.
---@param node any
function FillUnit:getFillUnitIndexFromNode(node) end

--- Returns the extra effect distance configured for an exact fill root node, 0 by default.
---@param node any
function FillUnit:getFillUnitExtraDistanceFromNode(node) end

--- Returns the fill unit table that owns the given exact fill root node, or nil.
---@param node any
function FillUnit:getFillUnitFromNode(node) end

--- Empties every unit by adding minus infinity to its level; with ignoreDeleteOnEmptyFlag the vehicle is not removed even if configured to delete when empty.
---@param ignoreDeleteOnEmptyFlag any
function FillUnit:emptyAllFillUnits(ignoreDeleteOnEmptyFlag) end

--- Reads one unloading place from XML: node (defaults to the root node), width (default 15) and offset. Always returns true. Note: the iteration index passed by onLoad is unused.
---@param xmlFile any
---@param key any
---@param entry any
---@param index any
function FillUnit:loadFillUnitUnloadingFromXML(xmlFile, key, entry, index) end

--- Returns the pallet XML filename of the unit's current fill type, or nil if the unit is empty.
---@param fillUnitIndex any
function FillUnit:getFillUnitUnloadPalletFilename(fillUnitIndex) end

--- Hook returning false by default; overridden by vehicles that carry mounted pallets which can be unloaded.
function FillUnit:getFillUnitHasMountedPalletsToUnload() end

--- Hook returning nil by default; overridden to return the list of mounted pallets to unload.
function FillUnit:getFillUnitMountedPalletsToUnload() end

--- Builds a list of unloading tasks, one per unloadable non-empty unit with a pallet file, each with unit index, fill type, level and pallet filename.
function FillUnit:getFillUnitUnloadingTasks() end

--- Returns true by default: units without start fill level are emptied when vehicles are reset instead of loaded from the savegame.
function FillUnit:getFillUnitEmptyOnReset() end

--- Returns true only when this vehicle's root vehicle is the one the local player is currently in, so only the player's own vehicle can be refilled from a trigger.
---@param rootVehicle any
function FillUnit:getAllowLoadTriggerActivation(rootVehicle) end

--- Queues a callback for another vehicle to be run (once) in this vehicle's next post update, for exact fill root aiming.
---@param vehicle any
---@param func any
function FillUnit:addExactFillRootAimToUpdate(vehicle, func) end

--- Client: asks the server via FillUnitUnloadEvent. Server: places mounted pallets and spawns new pallet vehicles on the unloading places, filling them with the unit contents, then raises onFillUnitUnloaded and broadcasts FillUnitUnloadedEvent. Shows a notification when there is no space.
---@param ignoreWarning any
function FillUnit:unloadFillUnits(ignoreWarning) end

--- Central function to add or remove liters in a unit and returns the applied delta. Checks farm access, mass limit and tool and fill type support, may switch the fill type, updates sync flags, mass, planes, alarms, effects, animations and dashboards, raises onFillUnitFillLevelChanged and may delete the vehicle when empty.
---@param farmId any
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
function FillUnit:addFillUnitFillLevel(farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData) end

--- Sets the last valid fill type of a unit and its sent copy, and raises the dirty flag so the change is synchronized, if the value differs.
---@param fillUnitIndex any
---@param fillType any
---@param force any
function FillUnit:setFillUnitLastValidFillType(fillUnitIndex, fillType, force) end

--- Loads one fill unit from XML: capacity, supported fill types or categories (one of the two is required, else it fails), start fill, nodes, network bits, HUD options, animations, and on clients alarms, measurement nodes, fill plane, materials, effects and dashboard values. Note: useMaxStateIfEmpty defaults to false here but the schema documents true.
---@param xmlFile any
---@param key any
---@param entry any
---@param index any
function FillUnit:loadFillUnitFromXML(xmlFile, key, entry, index) end

--- Loads an alarm trigger from XML: required min and max fill level fractions, alarm sound, beacon lights and direction. Returns false when a required level is missing. Note: needsTurnOn and turnOffInTrigger are registered in the schema but not read here.
---@param xmlFile any
---@param key any
---@param alarmTrigger any
---@param fillUnit any
function FillUnit:loadAlarmTrigger(xmlFile, key, alarmTrigger, fillUnit) end

--- Loads a measurement node (shader-driven fill gauge) from XML; returns false and warns if the node is missing.
---@param xmlFile any
---@param key any
---@param entry any
function FillUnit:loadMeasurementNode(xmlFile, key, entry) end

--- Drives the measurement nodes' shader parameters fillLevel and prevFillLevel with a 5 second visibility timer and intensity boosted by vehicle speed above about 10 km/h. Client only in practice.
---@param fillUnit any
---@param dt any
---@param setActive any
---@param forcedIntensity any
function FillUnit:updateMeasurementNodes(fillUnit, dt, setActive, forcedIntensity) end

--- Loads the fill plane of a unit: moving nodes with keyframed or min/max Y animation curves, assigns the base material "fillPlane" and terrain texture arrays, and resolves the default fill type. Returns false when absent or invalid default type.
---@param xmlFile any
---@param key any
---@param fillPlane any
---@param fillUnit any
function FillUnit:loadFillPlane(xmlFile, key, fillPlane, fillUnit) end

--- Stores a forced fill type on the unit's fill plane, if the unit has one. Visual use. Note: updateFillUnitFillPlane does not read this value in this file.
---@param fillUnitIndex any
---@param forcedFillType any
function FillUnit:setFillPlaneForcedFillType(fillUnitIndex, forcedFillType) end

--- Positions, rotates, scales and shows the fill plane nodes from the unit's level fraction through the animation curves, and sets the shader fillTypeId texture index when the fill type changes. Note: lastFillPlaneType is never updated, so the shader parameter is rewritten each call.
---@param fillUnit any
function FillUnit:updateFillUnitFillPlane(fillUnit) end

--- Reads the fillTypeMaterials list: either a target node plus reference node whose material is copied, or a material slot name plus custom diffuse texture. Invalid entries are skipped with warnings. Returns the list.
---@param xmlFile any
---@param key any
function FillUnit:loadFillTypeMaterials(xmlFile, key) end

--- For each entry matching the new fill type, either copies the reference node material onto the target node or replaces the slot's diffuse map from file across the vehicle's nodes.
---@param fillTypeMaterials any
---@param fillTypeIndex any
function FillUnit:updateFillTypeMaterials(fillTypeMaterials, fillTypeIndex) end

--- Moves the unit's auto aim target node along Z between startZ and endZ according to the fill level above the start percentage (optionally inverted).
---@param fillUnit any
function FillUnit:updateFillUnitAutoAimTarget(fillUnit) end

--- Registers a fill trigger that currently reaches the vehicle. The first one registers the fill activatable and, on platforms with automatic filling, starts filling. Raises onAddedFillUnitTrigger and re-sorts triggers.
---@param trigger table
---@param fillTypeIndex integer
---@param fillUnitIndex any
function FillUnit:addFillUnitTrigger(trigger, fillTypeIndex, fillUnitIndex) end

--- Unregisters a fill trigger, stops filling on the server if it was the active one, removes the activatable when none remain, raises onRemovedFillUnitTrigger and re-sorts.
---@param trigger table
function FillUnit:removeFillUnitTrigger(trigger) end

--- Sorts the triggers (fillable ones first, fuller units first), updates the activatable's fill type from the first trigger and raises onFillUnitTriggerChanged when the selected trigger changes.
function FillUnit:updateFillUnitTriggers() end

--- Starts or stops refilling from a trigger. Unless noEventSend, sends SetFillUnitIsFillingEvent. Picks the first activatable trigger, toggles fill sounds, raises onFillUnitIsFillingStateChanged and re-sorts triggers when stopping.
---@param isFilling any
---@param noEventSend any
function FillUnit:setFillUnitIsFilling(isFilling, noEventSend) end

--- Starts or stops the looping fill sound sample depending on the argument, only acting when the playing state differs.
---@param isPlaying any
function FillUnit:setFillSoundIsPlaying(isPlaying) end

--- Returns true by default; hook that other specializations can override to deactivate a unit.
---@param fillUnitIndex any
function FillUnit:getIsFillUnitActive(fillUnitIndex) end

--- Overrides the vehicle function: adds the mass of each unit's content (level times the fill type's mass per liter) to the component that is the unit's fill mass node.
---@param superFunc any
---@param component any
function FillUnit:getAdditionalComponentMass(superFunc, component) end

--- Overrides the vehicle function: adds one HUD entry per visible unit (type, level, capacity, precision, max reached flag, display style), merging parent and child units and showing the sole supported type when empty.
---@param superFunc function
---@param display table
function FillUnit:getFillLevelInformation(superFunc, display) end

--- Overrides fold permission: when folding while filled is forbidden, returns false and a warning text if any unit exceeds its folding threshold (for the configured fill type if given); otherwise defers to the parent.
---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function FillUnit:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

--- Overrides the train readiness check: returns false if any unit flagged blocksAutomatedTrainTravel is not empty, otherwise defers to the parent.
---@param superFunc any
function FillUnit:getIsReadyForAutomatedTrainTravel(superFunc) end

--- Extends moving tool loading with fillUnitIndex, minFillLevel and maxFillLevel attributes after the parent loader succeeds.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function FillUnit:loadMovingToolFromXML(superFunc, xmlFile, key, entry) end

--- Overrides moving tool activity: when linked to a fill unit, returns false if the fill fraction is above minFillLevel or below maxFillLevel. Note: this looks inverted compared with the leveler and attacher joint checks, and the min and max defaults are nil, which would error if only the index is set.
---@param superFunc any
---@param movingTool any
function FillUnit:getIsMovingToolActive(superFunc, movingTool) end

--- Overrides PTO power consumption: also true while the vehicle is filling from a trigger and consumePtoPower is configured.
---@param superFunc any
function FillUnit:getDoConsumePtoPower(superFunc) end

--- Overrides PTO activity: also true while filling from a trigger when consumePtoPower is configured.
---@param superFunc any
function FillUnit:getIsPowerTakeOffActive(superFunc) end

--- Overrides turn-on permission: returns false while an active alarm trigger has turnOffInTrigger set, else defers to the parent. Note: loadAlarmTrigger never reads that flag from XML.
---@param superFunc any
function FillUnit:getCanBeTurnedOn(superFunc) end

--- Overrides the info box: lists the total level per fill type (with the unit text and precision) for units visible in the info HUD, rebuilt only when the cached info is dirty, then calls the parent.
---@param superFunc any
---@param box any
function FillUnit:showInfo(superFunc, box) end

--- Extends leveler node loading with fillUnitIndex (default 1) and min and max fill fraction limits.
---@param superFunc any
---@param levelerNode any
---@param xmlFile any
---@param key any
function FillUnit:loadLevelerNodeFromXML(superFunc, levelerNode, xmlFile, key) end

--- Overrides leveler pickup activity: returns false when the linked unit's fill fraction is outside the node's min and max range, else defers to the parent.
---@param superFunc any
---@param levelerNode any
function FillUnit:getIsLevelerPickupNodeActive(superFunc, levelerNode) end

--- Extends attacher joint loading with fillUnitIndex, fillUnitTopArmOnly, minFillLevel and maxFillLevel when a fill unit index is configured.
---@param superFunc table
---@param attacherJoint table
---@param xmlFile string
---@param baseName string
---@param index integer
function FillUnit:loadAttacherJointFromXML(superFunc, attacherJoint, xmlFile, baseName, index) end

--- Overrides joint compatibility: returns false with a warning text when the linked unit's fill fraction is outside the joint's allowed range (for top-arm-only joints only if the implement has a top reference node).
---@param superFunc any
---@param vehicle any
---@param attacherJoint any
---@param inputAttacherVehicle any
---@param inputAttacherJoint any
function FillUnit:getIsAttacherJointCompatible(superFunc, vehicle, attacherJoint, inputAttacherVehicle, inputAttacherJoint) end

--- Debug helper returning a table mapping each fill unit index to its supported fill type set.
function FillUnit:debugGetSupportedFillTypesPerFillUnit() end

--- Recursively walks a vehicle and its attached implements (skipping the excluded vehicle) and fills sources[fillType] with entries holding vehicle and fill unit index for units supporting the wanted fill types.
---@param sources any
---@param currentVehicle any
---@param excludeVehicle any
---@param fillTypes any
function FillUnit.addFillTypeSources(sources, currentVehicle, excludeVehicle, fillTypes) end

--- Shop spec loader: reads capacities per fill unit configuration (or the storeData capacity override), converting them with the display unit when set. Returns a list of configurations or nil.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function FillUnit.loadSpecValueCapacity(xmlFile, customEnvironment, baseDir) end

--- Shop spec getter: computes the capacity text for the selected configuration or a min to max range across selectable configurations, using the real item's current capacity when available. Can return values instead of text when returnValues is set.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function FillUnit.getSpecValueCapacity(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

--- Returns the largest unit capacity found in any fill unit configuration of a vehicle XML file, 0 if none.
---@param xmlFile any
function FillUnit.getCapacityFromXml(xmlFile) end

--- Shop spec loader: collects fill type and category names of all configurations (skipping hidden or zero-capacity units), plus storeData overrides, fruit types and windrow conversion types, into one descriptor table.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function FillUnit.loadSpecValueFillTypes(xmlFile, customEnvironment, baseDir) end

--- Reads all fill type names and fill type category names of units with positive or unspecified capacity from a vehicle XML and returns them as two space-joined strings.
---@param xmlFile any
function FillUnit.getFillTypeNamesFromXML(xmlFile) end

--- Shop spec getter: resolves the loaded descriptor (for the chosen configuration if given) to a list of fill type indices via categories, names, fruit types, fruit categories or windrow types. Returns nil when none.
---@param storeItem any
---@param realItem any
---@param configurations any
function FillUnit.getSpecValueFillTypes(storeItem, realItem, configurations) end

--- Collects data used to estimate a vehicle's start mass: consumer tanks of the first consumer configuration and fill units with a start fill level and type from the first fill unit configuration.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function FillUnit.loadSpecValueFillUnitMassData(xmlFile, customEnvironment, baseDir) end

--- Sums capacity times mass per liter over the collected mass data, using the first fill type of each category or name list. Returns the mass total (game mass units).
---@param fillUnitMassData any
function FillUnit.getSpecValueStartFillUnitMassByMassData(fillUnitMassData) end

--- Debug action: for the selected vehicle, empties unit 1 and fills it with 100 liters of the next supported fill type. Only registered on console development builds.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function FillUnit.actionEventConsoleFillUnitNext(self, actionName, inputValue, callbackState, isAnalog) end

--- Debug action: adds 1000 liters to unit 1 of the selected vehicle, choosing a supported type if it is empty.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function FillUnit.actionEventConsoleFillUnitInc(self, actionName, inputValue, callbackState, isAnalog) end

--- Debug action: removes 1000 liters from unit 1 of the selected vehicle.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function FillUnit.actionEventConsoleFillUnitDec(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback for the UNLOAD action: calls unloadFillUnits on the vehicle.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function FillUnit.actionEventUnload(self, actionName, inputValue, callbackState, isAnalog) end

--- Activates the unload action only when some unloadable unit holds something with a pallet, or mounted pallets exist, and no discharge target is currently set.
---@param self any
function FillUnit.updateUnloadActionDisplay(self) end

--- Creates the helper object used by the activatable system to start and stop refilling from a trigger for a given vehicle; starts with an unknown fill type.
---@param vehicle any
function FillActivatable.new(vehicle) end

--- True when the vehicle is active for input, has a unit that can take the current fill type with more than 1 liter free, supports trigger tool type, and some trigger is activatable; also refreshes the prompt text.
function FillActivatable:getIsActivatable() end

--- Toggles the vehicle's trigger filling state and refreshes the prompt text.
function FillActivatable:run() end

--- Called when the player enters range: registers this object as drawable so draw is called each frame.
function FillActivatable:activate() end

--- Called when leaving range: removes the object from the mission's drawables.
function FillActivatable:deactivate() end

--- Shows the fuel context HUD for the vehicle when the activatable's fill type is diesel fuel.
function FillActivatable:draw() end

--- Sets the prompt text to either the stop or start refilling string with the vehicle's type description.
---@param isFilling any
function FillActivatable:updateActivateText(isFilling) end

--- Sets the fill type index this activatable is about, used when checking whether a unit can take it.
---@param fillTypeIndex any
function FillActivatable:setFillType(fillTypeIndex) end
