---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Baler.lua (generated stub, FS25 Lua Atlas)

--- Specialization of balers (round or square bales, with or without pickup, with nonStopBaling continuous loading buffer, platform, animation-driven ejection). Prerequisites: FillUnit, WorkArea, TurnOnVehicle, AnimatedVehicle, Consumable. BALE LOGIC (summary, not re-read in detail): picking up fills a fill unit; the bale is finished when full, created (createBale, BalerCreateBaleEvent), moved along the animation curve (moveBales/setBaleTime) and dropped (dropBale); a dummy bale (dummyBale) visualizes the bale being formed. EFFECTS (client): fillEffects (vehicle.baler.fillEffect: forage entering the pickup), additiveEffects (liquid additive), buffer.overloadingEffects (buffer unloading), plus animationNodes and unloadAnimationNodes. Effect classes are absent from the dump: rendering UNVERIFIED. fillEffect TRIGGER (onUpdateTick, client, only if the baler is turned on): as long as the server reports pickup (lastAreaBiggerZero) AND a material type is known (fillEffectType), a 500 ms counter is re-armed; the effect stays active while this counter is > 0, then stops (countdown in real dt). While active: setEffectTypeInfo(effects, fillEffectType) then startEffects then setDensity(effects, max(load, 0.40)) where load = litres picked up over 1 s (ValueBuffer of 750 ms capacity) / maxPickupLitersPerSecond (500 by default): the visual intensity therefore follows the flow of picked-up material, with a 40 % floor. The input type is the last material type found by processBalerArea (fillEffectType, server); no crop nor growth state. Additives: play a LIQUIDFERTILIZER effect for 250 ms at each additive pickup (server: consumes the additive and increases litres by 5 %, weighted by availability). NETWORK: a single dirtyFlag for lastAreaBiggerZero, fillEffectTypeSent (SEND_NUM_BITS), bale limit alert, buffer unloading state and additive state; read in onReadUpdateStream (client); initial stream over several fields (not fully re-read). The client does not recompute the pickup. CONDITIONS: area active if: number of bales under the slotSystem limit (when turned on), fill unit not full, pickup allowed (allowPickingUp of Pickup, not re-read), net/film consumables available (round AND square), and for opening balers, no pending bales nor unloading. Turning on is required for the effect to activate (onUpdateTick), but is not tested in getIsWorkAreaActive of this file. Area processing is skipped for a distant client (> Baler.CLIENT_DM_UPDATE_RADIUS, constant not defined here: UNVERIFIED). TERRAIN: pickup from the height map (DensityMapHeightUtil.tipToGroundAroundLine with -infinity), fill types from pickupFillTypes; no crop map modification. WEATHER/WETNESS: no reading in this file. dt: effect and node cleanup counters in ms of game time. EXTENSION POINTS: functions from registerFunctions (setBaleTypeIndex, isUnloadingAllowed, handleUnloadingBaleEvent, dropBaleFromPlatform, getBalerBaleOwnerFarmId, setIsUnloadingBale, getIsBaleUnloading, getTimeFromLevel, moveBales, moveBale, setBaleTime, finishBale, createBale, dropBale, dummy bales, getCanUnloadUnfinishedBale, setBalerAutomaticDrop, processBalerArea); overrides doCheckSpeedLimit, getIsWorkAreaActive, getConsumingLoad, getRequiresPower, getCanBeTurnedOn, getCanBeSelected, getIsAttachedTo, getIsFoldAllowed, addToPhysics, removeFromPhysics, getAlarmTriggerIsActive; events onTurnedOn/Off, onFillUnitFillLevelChanged, onChangedFillType, onRootVehicleChanged, onStart/EndWorkAreaProcessing, onConsumableVariationChanged. Events registered by registerEvents (list not re-read). Default speed limit: 25; a variable speed (variableSpeedLimit) can modulate the limit according to litres picked up per second (server, in onUpdate).
---@class Baler
Baler = {}

--- Declares the baler configuration, the AI strategy AIDriveStrategyBaler, the baler area type and the XML schema (effects, animations, bale types, buffer, additives, platform, maximum flow...). Not re-read key by key.
function Baler.initSpecialization() end

--- Registers the XML keys of vehicle.baler (and configurations): fillEffect, additiveEffects, animationNodes, unloadAnimationNodes, buffer.overloadingEffect, #maxPickupLitersPerSecond, tying and compaction animations, bale types... Not re-read key by key.
---@param schema any
---@param basePath any
function Baler.registerBalerXMLPaths(schema, basePath) end

--- Requires FillUnit, WorkArea, TurnOnVehicle, AnimatedVehicle and Consumable.
---@param specializations any
function Baler.prerequisitesPresent(specializations) end

--- Declares the events specific to the baler (list not re-read).
---@param vehicleType any
function Baler.registerEvents(vehicleType) end

--- Registers the bale handling, unloading and platform functions and processBalerArea.
---@param vehicleType any
function Baler.registerFunctions(vehicleType) end

--- Overrides doCheckSpeedLimit, getIsWorkAreaActive, getConsumingLoad, getRequiresPower, getCanBeTurnedOn, getCanBeSelected, getIsAttachedTo, getIsFoldAllowed, addToPhysics, removeFromPhysics and others (list not re-read line by line).
---@param vehicleType any
function Baler.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostLoad, onLoadFinished, onDelete, streams, onUpdate, onUpdateTick, onTurnedOn/Off, onFillUnitFillLevelChanged, onChangedFillType, onRootVehicleChanged, onStart/EndWorkAreaProcessing, onRegisterActionEvents and onConsumableVariationChanged (list not re-read line by line).
---@param vehicleType any
function Baler.registerEventListeners(vehicleType) end

--- Loads bale types, animations, effects (fillEffect, additives, buffer), sound, buffer parameters, platform, variable speed and maximum pickup flow (500 l/s by default, 750 ms buffer); initializes unloading states, bale lists and network flag. Detailed reading not re-read.
---@param savegame any
function Baler:onLoad(savegame) end

--- Restores from the savegame the bales in progress and the baler state (not re-read in detail).
---@param savegame any
function Baler:onPostLoad(savegame) end

--- Load finalization step (dummy bale, bale configuration; not re-read in detail).
---@param savegame any
function Baler:onLoadFinished(savegame) end

--- Frees sounds, effects (fill, additives, buffer), animations, dummy bales and bales in progress.
function Baler:onDelete() end

--- Saves the bales being formed, the unloading state and the options (not re-read in detail).
---@param xmlFile any
---@param key any
---@param usedModNames any
function Baler:saveToXMLFile(xmlFile, key, usedModNames) end

--- On connection, reads the pickup state, the effect type, the bales and the unloading state (not re-read in detail; lastAreaBiggerZero read at line 865).
---@param streamId any
---@param connection any
function Baler:onReadStream(streamId, connection) end

--- Writes the state matching the initial stream.
---@param streamId any
---@param connection any
function Baler:onWriteStream(streamId, connection) end

--- Client side: reads lastAreaBiggerZero, fillEffectType, bale limit alert, buffer unloading state (starts/stops effects, sounds, overflow animations) and additive state (starts/stops additiveEffects).
---@param streamId any
---@param timestamp any
---@param connection any
function Baler:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: writes these values when dirtyFlag is raised.
---@param streamId any
---@param connection any
---@param dirtyMask any
function Baler:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Animates the bales, applies the detail visibility cuts and, on the server side, finishes the bale on the next frame (finishBale) and adjusts the variable speed limit according to litres picked up per second (spec.variableSpeedLimit).
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Baler:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Drives the input effects (see module: 500 ms counter, density = pickup load, floor 0.40), the sound tying cleanup, compaction, buffer unloading and the automatic unloading logic; server: feeds the buffer of picked-up litres, handles the additive timer (250 ms) and the bale limit alert.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Baler:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Forbids folding if bales are loaded, the baler is turned on or the platform is occupied (with a warning).
---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function Baler:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

--- Recomputes the XML file and the bale index from the current material type and bale type (dummy bale included).
---@param fillUnitIndex any
---@param fillTypeIndex any
---@param oldFillTypeIndex any
function Baler:onChangedFillType(fillUnitIndex, fillTypeIndex, oldFillTypeIndex) end

--- Updates the dummy bale and the fill animation according to the level; server: triggers the end of the bale when the unit is full (not re-read in detail).
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function Baler:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData, appliedDelta) end

--- Stores the bale variation (bale_variation) supplied by the consumable.
---@param variationIndex any
---@param metaData any
function Baler:onConsumableVariationChanged(variationIndex, metaData) end

--- Folds the baler into the turn-on position if foldable, starts working animations and sound.
function Baler:onTurnedOn() end

--- Client: stops fillEffects, additiveEffects, buffer effects, animations and sounds.
function Baler:onTurnedOff() end

--- Registers/updates the "baleUnload" action of the actionController.
---@param rootVehicle table
function Baler:onRootVehicleChanged(rootVehicle) end

--- actionController callback: triggers unloading when direction < 0 if allowed.
---@param direction any
function Baler:actionControllerBaleUnloadEvent(direction) end

--- Applies the speed limit if the tool is turned on and lowered.
---@param superFunc any
function Baler:doCheckSpeedLimit(superFunc) end

--- Chooses the bale type (immediately if empty or forced, otherwise stored); not re-read in detail.
---@param baleTypeIndex any
---@param force any
---@param noEventSend any
function Baler:setBaleTypeIndex(baleTypeIndex, force, noEventSend) end

--- Tells whether manual unloading is allowed (platform, turn on, unloading in progress; for a baler-wrapper, according to allowsGrabbingBale).
function Baler:isUnloadingAllowed() end

--- Opens or closes unloading depending on the state, if allowed.
function Baler:handleUnloadingBaleEvent() end

--- Starts the platform drop animation and unmounts the dynamically mounted objects (server).
---@param waitForNextBale any
---@param noEventSend any
function Baler:dropBaleFromPlatform(waitForNextBale, noEventSend) end

--- Determines the farm owning the bale (land owner or last farm touched, falling back to the baler owner).
---@param x any
---@param z any
function Baler:getBalerBaleOwnerFarmId(x, z) end

--- Starts/stops opening the baler (with unfinished bale if allowed) and propagates the state.
---@param isUnloadingBale any
---@param noEventSend any
function Baler:setIsUnloadingBale(isUnloadingBale, noEventSend) end

--- Returns true during unloading.
function Baler:getIsBaleUnloading() end

--- Converts an amount of material into a time advance on the bale animation curve.
---@param level any
function Baler:getTimeFromLevel(level) end

--- Advances all bales by the given time.
---@param dt any
function Baler:moveBales(dt) end

--- Advances one bale by the given time.
---@param i any
---@param dt any
---@param noEventSend any
function Baler:moveBale(i, dt, noEventSend) end

--- Places a bale on the animation curve (node and joint on the server side) and handles the end of travel (time >= 1).
---@param i any
---@param baleTime any
---@param noEventSend any
function Baler:setBaleTime(i, baleTime, noEventSend) end

--- Finishes the bale: empties the fill unit, resets the material counters, creates the bale and broadcasts BalerCreateBaleEvent (server).
function Baler:finishBale() end

--- Creates the bale object, its physics joint and its initial position (animates the tying).
---@param baleFillType any
---@param fillLevel any
---@param baleServerId any
---@param baleTime any
---@param xmlFilename any
---@param ownerFarmId any
---@param variationId any
---@param loadFromSavegame any
function Baler:createBale(baleFillType, fillLevel, baleServerId, baleTime, xmlFilename, ownerFarmId, variationId, loadFromSavegame) end

--- Drops the bale from the list: notifies the mission, removes the joint and frees the object (server).
---@param baleIndex any
function Baler:dropBale(baleIndex) end

--- Creates/scales/deletes the dummy bale according to level and capacity; returns true if a new one was created.
---@param dummyBaleData any
---@param fillTypeIndex any
---@param fillLevel any
---@param capacity any
function Baler:updateDummyBale(dummyBaleData, fillTypeIndex, fillLevel, capacity) end

--- Deletes the dummy bale and frees its shared loading request.
---@param dummyBaleData any
function Baler:deleteDummyBale(dummyBaleData) end

--- Loads the dummy bale from the current bale XML and links it to the bale node.
---@param dummyBaleData any
---@param fillTypeIndex any
function Baler:createDummyBale(dummyBaleData, fillTypeIndex) end

--- True if ejection of an unfinished bale is configured and the level exceeds the threshold.
function Baler:getCanUnloadUnfinishedBale() end

--- Enables/disables automatic drop (platform or classic) and refreshes the actions.
---@param state any
---@param noEventSend any
function Baler:setBalerAutomaticDrop(state, noEventSend) end

--- Refuses turning on during a bale unloading.
---@param superFunc any
function Baler:getCanBeTurnedOn(superFunc) end

--- Reads the rotateOnlyIfFillLevelIncreased option of a rotating part.
---@param superFunc any
---@param speedRotatingPart any
---@param xmlFile any
---@param key any
function Baler:loadSpeedRotatingPartFromXML(superFunc, speedRotatingPart, xmlFile, key) end

--- Only rotates a marked part while the pickup counter lastAreaBiggerZeroTime is > 0.
---@param superFunc any
---@param speedRotatingPart any
function Baler:getIsSpeedRotatingPartActive(superFunc, speedRotatingPart) end

--- Default speed limit: 25.
function Baler.getDefaultSpeedLimit() end

--- Inactive if the bale limit is reached (turned on), if the unit is full, if the pickup does not allow, if a consumable is missing, or if a bale is waiting/being unloaded (opening balers without buffer).
---@param superFunc any
---@param workArea any
function Baler:getIsWorkAreaActive(superFunc, workArea) end

--- Adds the pickup load (litres over 1 s / maximum flow) to the consumed load.
---@param superFunc any
function Baler:getConsumingLoad(superFunc) end

--- True if the buffer must empty, if unloading is in progress or if the baler is turned on.
---@param superFunc any
function Baler:getRequiresPower(superFunc) end

--- Returns true: the tool is selectable.
---@param superFunc any
function Baler:getCanBeSelected(superFunc) end

--- Also considers mounted bales as attached to the baler.
---@param superFunc any
---@param vehicle any
function Baler:getIsAttachedTo(superFunc, vehicle) end

--- Returns false.
---@param superFunc any
function Baler:getAllowDynamicMountFillLevelInfo(superFunc) end

--- Disables an alarm marked needsBaleLoaded as long as no bale is loaded.
---@param superFunc any
---@param alarmTrigger any
function Baler:getAlarmTriggerIsActive(superFunc, alarmTrigger) end

--- Reads the needsBaleLoaded option of an alarm.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param alarmTrigger any
---@param fillUnit any
function Baler:loadAlarmTrigger(superFunc, xmlFile, key, alarmTrigger, fillUnit) end

--- Only shows the empty consumable warning (net/film) if the baler is turned on.
---@param superFunc any
---@param typeName any
function Baler:getShowConsumableEmptyWarning(superFunc, typeName) end

--- Puts the bales and their physics joints back into the simulation.
---@param superFunc any
---@return boolean
function Baler:addToPhysics(superFunc) end

--- Removes bales and joints from the simulation.
---@param superFunc any
---@return boolean
function Baler:removeFromPhysics(superFunc) end

--- Picks up the forage under the area (suction by type of pickupFillTypes), stores fillEffectType (server, type of the material found), applies the additive (server), accumulates the litres of the pass and returns picked-up litres (twice); distant client ignored.
---@param workArea any
---@param dt any
function Baler:processBalerArea(workArea, dt) end

--- Registers the unloading, size toggle and automatic drop actions.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Baler:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Links the external triggers balerDrop, balerAutomaticDrop and balerBaleSize to the matching actions.
---@param trigger any
---@param name any
---@param xmlFile any
---@param key any
function Baler:onRegisterExternalActionEvents(trigger, name, xmlFile, key) end

--- Server: resets lastAreaBiggerZero and picked-up litres to zero before the pass.
---@param dt any
function Baler:onStartWorkAreaProcessing(dt) end

--- Server: chooses the dominant material type, sets lastAreaBiggerZero to true if pickup occurred, adds litres to the unit (or to the buffer), animates the bales, updates the variable speed and raises dirtyFlag if lastAreaBiggerZero or fillEffectType changed.
---@param dt any
---@param hasProcessed any
function Baler:onEndWorkAreaProcessing(dt, hasProcessed) end

--- Input callback: starts unloading or the platform drop.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Baler.actionEventUnloading(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: changes the bale type (not re-read in detail).
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Baler.actionEventToggleSize(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: toggles automatic drop.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Baler.actionEventToggleAutomaticDrop(self, actionName, inputValue, callbackState, isAnalog) end

--- Updates the texts and activations of the baler actions.
---@param self any
function Baler.updateActionEvents(self) end

--- Registers the external unloading action (area trigger).
---@param data any
---@param vehicle any
function Baler.externalActionEventUnloadRegister(data, vehicle) end

--- Updates the external unloading action.
---@param data any
---@param vehicle any
function Baler.externalActionEventUnloadUpdate(data, vehicle) end

--- Registers the external automatic drop action.
---@param data any
---@param vehicle any
function Baler.externalActionEventAutomaticUnloadRegister(data, vehicle) end

--- Updates the external automatic drop action.
---@param data any
---@param vehicle any
function Baler.externalActionEventAutomaticUnloadUpdate(data, vehicle) end

--- Registers the external bale type selection action.
---@param data any
---@param vehicle any
function Baler.externalActionEventBaleTypeRegister(data, vehicle) end

--- Updates the external bale type selection action.
---@param data any
---@param vehicle any
function Baler.externalActionEventBaleTypeUpdate(data, vehicle) end

--- Reads the bale dimensions for the shop (not re-read in detail).
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Baler.loadSpecValueBaleSize(xmlFile, customEnvironment, baseDir) end

--- Formats the bale dimensions for the shop.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
---@param roundBale any
function Baler.getSpecValueBaleSize(storeItem, realItem, configurations, saleItem, returnValues, returnRange, roundBale) end

--- Reads the round bale diameters for the shop.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Baler.loadSpecValueBaleSizeRound(xmlFile, customEnvironment, baseDir) end

--- Reads the square bale dimensions for the shop.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Baler.loadSpecValueBaleSizeSquare(xmlFile, customEnvironment, baseDir) end

--- Formats the round bale sizes for the shop.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function Baler.getSpecValueBaleSizeRound(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

--- Formats the square bale sizes for the shop.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function Baler.getSpecValueBaleSizeSquare(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end
