# vehicles/specializations/Baler.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Baler.md)*

Source: `dataS/scripts/vehicles/specializations/Baler.lua` — FS25 1.25.1.0

✍ Specialization of balers (round or square bales, with or without pickup, with nonStopBaling continuous loading buffer, platform, animation-driven ejection). Prerequisites: FillUnit, WorkArea, TurnOnVehicle, AnimatedVehicle, Consumable. BALE LOGIC (summary, not re-read in detail): picking up fills a fill unit; the bale is finished when full, created (createBale, BalerCreateBaleEvent), moved along the animation curve (moveBales/setBaleTime) and dropped (dropBale); a dummy bale (dummyBale) visualizes the bale being formed. EFFECTS (client): fillEffects (vehicle.baler.fillEffect: forage entering the pickup), additiveEffects (liquid additive), buffer.overloadingEffects (buffer unloading), plus animationNodes and unloadAnimationNodes. Effect classes are absent from the dump: rendering UNVERIFIED. fillEffect TRIGGER (onUpdateTick, client, only if the baler is turned on): as long as the server reports pickup (lastAreaBiggerZero) AND a material type is known (fillEffectType), a 500 ms counter is re-armed; the effect stays active while this counter is > 0, then stops (countdown in real dt). While active: setEffectTypeInfo(effects, fillEffectType) then startEffects then setDensity(effects, max(load, 0.40)) where load = litres picked up over 1 s (ValueBuffer of 750 ms capacity) / maxPickupLitersPerSecond (500 by default): the visual intensity therefore follows the flow of picked-up material, with a 40 % floor. The input type is the last material type found by processBalerArea (fillEffectType, server); no crop nor growth state. Additives: play a LIQUIDFERTILIZER effect for 250 ms at each additive pickup (server: consumes the additive and increases litres by 5 %, weighted by availability). NETWORK: a single dirtyFlag for lastAreaBiggerZero, fillEffectTypeSent (SEND_NUM_BITS), bale limit alert, buffer unloading state and additive state; read in onReadUpdateStream (client); initial stream over several fields (not fully re-read). The client does not recompute the pickup. CONDITIONS: area active if: number of bales under the slotSystem limit (when turned on), fill unit not full, pickup allowed (allowPickingUp of Pickup, not re-read), net/film consumables available (round AND square), and for opening balers, no pending bales nor unloading. Turning on is required for the effect to activate (onUpdateTick), but is not tested in getIsWorkAreaActive of this file. Area processing is skipped for a distant client (> Baler.CLIENT_DM_UPDATE_RADIUS, constant not defined here: UNVERIFIED). TERRAIN: pickup from the height map (DensityMapHeightUtil.tipToGroundAroundLine with -infinity), fill types from pickupFillTypes; no crop map modification. WEATHER/WETNESS: no reading in this file. dt: effect and node cleanup counters in ms of game time. EXTENSION POINTS: functions from registerFunctions (setBaleTypeIndex, isUnloadingAllowed, handleUnloadingBaleEvent, dropBaleFromPlatform, getBalerBaleOwnerFarmId, setIsUnloadingBale, getIsBaleUnloading, getTimeFromLevel, moveBales, moveBale, setBaleTime, finishBale, createBale, dropBale, dummy bales, getCanUnloadUnfinishedBale, setBalerAutomaticDrop, processBalerArea); overrides doCheckSpeedLimit, getIsWorkAreaActive, getConsumingLoad, getRequiresPower, getCanBeTurnedOn, getCanBeSelected, getIsAttachedTo, getIsFoldAllowed, addToPhysics, removeFromPhysics, getAlarmTriggerIsActive; events onTurnedOn/Off, onFillUnitFillLevelChanged, onChangedFillType, onRootVehicleChanged, onStart/EndWorkAreaProcessing, onConsumableVariationChanged. Events registered by registerEvents (list not re-read). Default speed limit: 25; a variable speed (variableSpeedLimit) can modulate the limit according to litres picked up per second (server, in onUpdate).

- **Baler** (l.18)

## Functions

| Function | Line | Description |
|---|---|---|
| `Baler.initSpecialization()` | 32 | ✍ Declares the baler configuration, the AI strategy AIDriveStrategyBaler, the baler area type and the XML schema (effects, animations, bale types, buffer, additives, platform, maximum flow...). Not re-read key by key. |
| `Baler.registerBalerXMLPaths(schema: any, basePath: any)` | 73 | ✍ Registers the XML keys of vehicle.baler (and configurations): fillEffect, additiveEffects, animationNodes, unloadAnimationNodes, buffer.overloadingEffect, #maxPickupLitersPerSecond, tying and compaction animations, bale types... Not re-read key by key. |
| `Baler.prerequisitesPresent(specializations: any)` | 198 | ✍ Requires FillUnit, WorkArea, TurnOnVehicle, AnimatedVehicle and Consumable. |
| `Baler.registerEvents(vehicleType: any)` | 208 | ✍ Declares the events specific to the baler (list not re-read). |
| `Baler.registerFunctions(vehicleType: any)` | 215 | ✍ Registers the bale handling, unloading and platform functions and processBalerArea. |
| `Baler.registerOverwrittenFunctions(vehicleType: any)` | 241 | ✍ Overrides doCheckSpeedLimit, getIsWorkAreaActive, getConsumingLoad, getRequiresPower, getCanBeTurnedOn, getCanBeSelected, getIsAttachedTo, getIsFoldAllowed, addToPhysics, removeFromPhysics and others (list not re-read line by line). |
| `Baler.registerEventListeners(vehicleType: any)` | 262 | ✍ Subscribes to onLoad, onPostLoad, onLoadFinished, onDelete, streams, onUpdate, onUpdateTick, onTurnedOn/Off, onFillUnitFillLevelChanged, onChangedFillType, onRootVehicleChanged, onStart/EndWorkAreaProcessing, onRegisterActionEvents and onConsumableVariationChanged (list not re-read line by line). |
| `Baler:onLoad(savegame: any)` | 288 | ✍ Loads bale types, animations, effects (fillEffect, additives, buffer), sound, buffer parameters, platform, variable speed and maximum pickup flow (500 l/s by default, 750 ms buffer); initializes unloading states, bale lists and network flag. Detailed reading not re-read. |
| `Baler:onPostLoad(savegame: any)` | 682 | ✍ Restores from the savegame the bales in progress and the baler state (not re-read in detail). |
| `Baler:onLoadFinished(savegame: any)` | 728 | ✍ Load finalization step (dummy bale, bale configuration; not re-read in detail). |
| `Baler:onDelete()` | 750 | ✍ Frees sounds, effects (fill, additives, buffer), animations, dummy bales and bales in progress. |
| `Baler:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 792 | ✍ Saves the bales being formed, the unloading state and the options (not re-read in detail). |
| `Baler:onReadStream(streamId: any, connection: any)` | 839 | ✍ On connection, reads the pickup state, the effect type, the bales and the unloading state (not re-read in detail; lastAreaBiggerZero read at line 865). |
| `Baler:onWriteStream(streamId: any, connection: any)` | 890 | ✍ Writes the state matching the initial stream. |
| `Baler:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 929 | ✍ Client side: reads lastAreaBiggerZero, fillEffectType, bale limit alert, buffer unloading state (starts/stops effects, sounds, overflow animations) and additive state (starts/stops additiveEffects). |
| `Baler:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 979 | ✍ Server side: writes these values when dirtyFlag is raised. |
| `Baler:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 999 | ✍ Animates the bales, applies the detail visibility cuts and, on the server side, finishes the bale on the next frame (finishBale) and adjusts the variable speed limit according to litres picked up per second (spec.variableSpeedLimit). |
| `Baler:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 1096 | ✍ Drives the input effects (see module: 500 ms counter, density = pickup load, floor 0.40), the sound tying cleanup, compaction, buffer unloading and the automatic unloading logic; server: feeds the buffer of picked-up litres, handles the additive timer (250 ms) and the bale limit alert. |
| `Baler:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 1467 | ✍ Forbids folding if bales are loaded, the baler is turned on or the platform is occupied (with a warning). |
| `Baler:onChangedFillType(fillUnitIndex: any, fillTypeIndex: any, oldFillTypeIndex: any)` | 1493 | ✍ Recomputes the XML file and the bale index from the current material type and bale type (dummy bale included). |
| `Baler:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 1535 | ✍ Updates the dummy bale and the fill animation according to the level; server: triggers the end of the bale when the unit is full (not re-read in detail). |
| `Baler:onConsumableVariationChanged(variationIndex: any, metaData: any)` | 1597 | ✍ Stores the bale variation (bale_variation) supplied by the consumable. |
| `Baler:onTurnedOn()` | 1606 | ✍ Folds the baler into the turn-on position if foldable, starts working animations and sound. |
| `Baler:onTurnedOff()` | 1623 | ✍ Client: stops fillEffects, additiveEffects, buffer effects, animations and sounds. |
| `Baler:onRootVehicleChanged(rootVehicle: table)` | 1648 | ✍ Registers/updates the "baleUnload" action of the actionController. |
| `Baler:actionControllerBaleUnloadEvent(direction: any)` | 1670 | ✍ actionController callback: triggers unloading when direction < 0 if allowed. |
| `Baler:doCheckSpeedLimit(superFunc: any)` | 1689 | ✍ Applies the speed limit if the tool is turned on and lowered. |
| `Baler:setBaleTypeIndex(baleTypeIndex: any, force: any, noEventSend: any)` | 1695 | ✍ Chooses the bale type (immediately if empty or forced, otherwise stored); not re-read in detail. |
| `Baler:isUnloadingAllowed()` | 1710 | ✍ Tells whether manual unloading is allowed (platform, turn on, unloading in progress; for a baler-wrapper, according to allowsGrabbingBale). |
| `Baler:handleUnloadingBaleEvent()` | 1729 | ✍ Opens or closes unloading depending on the state, if allowed. |
| `Baler:dropBaleFromPlatform(waitForNextBale: any, noEventSend: any)` | 1748 | ✍ Starts the platform drop animation and unmounts the dynamically mounted objects (server). |
| `Baler:getBalerBaleOwnerFarmId(x: any, z: any)` | 1772 | ✍ Determines the farm owning the bale (land owner or last farm touched, falling back to the baler owner). |
| `Baler:setIsUnloadingBale(isUnloadingBale: any, noEventSend: any)` | 1796 | ✍ Starts/stops opening the baler (with unfinished bale if allowed) and propagates the state. |
| `Baler:getIsBaleUnloading()` | 1866 | ✍ Returns true during unloading. |
| `Baler:getTimeFromLevel(level: any)` | 1872 | ✍ Converts an amount of material into a time advance on the bale animation curve. |
| `Baler:moveBales(dt: any)` | 1886 | ✍ Advances all bales by the given time. |
| `Baler:moveBale(i: any, dt: any, noEventSend: any)` | 1896 | ✍ Advances one bale by the given time. |
| `Baler:setBaleTime(i: any, baleTime: any, noEventSend: any)` | 1905 | ✍ Places a bale on the animation curve (node and joint on the server side) and handles the end of travel (time >= 1). |
| `Baler:finishBale()` | 1943 | ✍ Finishes the bale: empties the fill unit, resets the material counters, creates the bale and broadcasts BalerCreateBaleEvent (server). |
| `Baler:createBale(baleFillType: any, fillLevel: any, baleServerId: any, baleTime: any, xmlFilename: any, ownerFarmId: any, variationId: any, loadFromSavegame: any)` | 1982 | ✍ Creates the bale object, its physics joint and its initial position (animates the tying). |
| `Baler:dropBale(baleIndex: any)` | 2128 | ✍ Drops the bale from the list: notifies the mission, removes the joint and frees the object (server). |
| `Baler:updateDummyBale(dummyBaleData: any, fillTypeIndex: any, fillLevel: any, capacity: any)` | 2206 | ✍ Creates/scales/deletes the dummy bale according to level and capacity; returns true if a new one was created. |
| `Baler:deleteDummyBale(dummyBaleData: any)` | 2253 | ✍ Deletes the dummy bale and frees its shared loading request. |
| `Baler:createDummyBale(dummyBaleData: any, fillTypeIndex: any)` | 2268 | ✍ Loads the dummy bale from the current bale XML and links it to the bale node. |
| `Baler:getCanUnloadUnfinishedBale()` | 2287 | ✍ True if ejection of an unfinished bale is configured and the level exceeds the threshold. |
| `Baler:setBalerAutomaticDrop(state: any, noEventSend: any)` | 2300 | ✍ Enables/disables automatic drop (platform or classic) and refreshes the actions. |
| `Baler:getCanBeTurnedOn(superFunc: any)` | 2324 | ✍ Refuses turning on during a bale unloading. |
| `Baler:loadSpeedRotatingPartFromXML(superFunc: any, speedRotatingPart: any, xmlFile: any, key: any)` | 2336 | ✍ Reads the rotateOnlyIfFillLevelIncreased option of a rotating part. |
| `Baler:getIsSpeedRotatingPartActive(superFunc: any, speedRotatingPart: any)` | 2344 | ✍ Only rotates a marked part while the pickup counter lastAreaBiggerZeroTime is > 0. |
| `Baler.getDefaultSpeedLimit()` | 2358 | ✍ Default speed limit: 25. |
| `Baler:getIsWorkAreaActive(superFunc: any, workArea: any)` | 2364 | ✍ Inactive if the bale limit is reached (turned on), if the unit is full, if the pickup does not allow, if a consumable is missing, or if a bale is waiting/being unloaded (opening balers without buffer). |
| `Baler:getConsumingLoad(superFunc: any)` | 2395 | ✍ Adds the pickup load (litres over 1 s / maximum flow) to the consumed load. |
| `Baler:getRequiresPower(superFunc: any)` | 2406 | ✍ True if the buffer must empty, if unloading is in progress or if the baler is turned on. |
| `Baler:getCanBeSelected(superFunc: any)` | 2433 | ✍ Returns true: the tool is selectable. |
| `Baler:getIsAttachedTo(superFunc: any, vehicle: any)` | 2439 | ✍ Also considers mounted bales as attached to the baler. |
| `Baler:getAllowDynamicMountFillLevelInfo(superFunc: any)` | 2456 | ✍ Returns false. |
| `Baler:getAlarmTriggerIsActive(superFunc: any, alarmTrigger: any)` | 2462 | ✍ Disables an alarm marked needsBaleLoaded as long as no bale is loaded. |
| `Baler:loadAlarmTrigger(superFunc: any, xmlFile: any, key: any, alarmTrigger: any, fillUnit: any)` | 2478 | ✍ Reads the needsBaleLoaded option of an alarm. |
| `Baler:getShowConsumableEmptyWarning(superFunc: any, typeName: any)` | 2488 | ✍ Only shows the empty consumable warning (net/film) if the baler is turned on. |
| `Baler:addToPhysics(superFunc: any) → boolean` | 2499 | ✍ Puts the bales and their physics joints back into the simulation. |
| `Baler:removeFromPhysics(superFunc: any) → boolean` | 2541 | ✍ Removes bales and joints from the simulation. |
| `Baler:processBalerArea(workArea: any, dt: any)` | 2565 | ✍ Picks up the forage under the area (suction by type of pickupFillTypes), stores fillEffectType (server, type of the material found), applies the additive (server), accumulates the litres of the pass and returns picked-up litres (twice); distant client ignored. |
| `Baler:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 2633 | ✍ Registers the unloading, size toggle and automatic drop actions. |
| `Baler:onRegisterExternalActionEvents(trigger: any, name: any, xmlFile: any, key: any)` | 2667 | ✍ Links the external triggers balerDrop, balerAutomaticDrop and balerBaleSize to the matching actions. |
| `Baler:onStartWorkAreaProcessing(dt: any)` | 2685 | ✍ Server: resets lastAreaBiggerZero and picked-up litres to zero before the pass. |
| `Baler:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 2696 | ✍ Server: chooses the dominant material type, sets lastAreaBiggerZero to true if pickup occurred, adds litres to the unit (or to the buffer), animates the bales, updates the variable speed and raises dirtyFlag if lastAreaBiggerZero or fillEffectType changed. |
| `Baler.actionEventUnloading(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2765 | ✍ Input callback: starts unloading or the platform drop. |
| `Baler.actionEventToggleSize(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2780 | ✍ Input callback: changes the bale type (not re-read in detail). |
| `Baler.actionEventToggleAutomaticDrop(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2793 | ✍ Input callback: toggles automatic drop. |
| `Baler.updateActionEvents(self: any)` | 2799 | ✍ Updates the texts and activations of the baler actions. |
| `Baler.externalActionEventUnloadRegister(data: any, vehicle: any)` | 2876 | ✍ Registers the external unloading action (area trigger). |
| `Baler.externalActionEventUnloadUpdate(data: any, vehicle: any)` | 2890 | ✍ Updates the external unloading action. |
| `Baler.externalActionEventAutomaticUnloadRegister(data: any, vehicle: any)` | 2925 | ✍ Registers the external automatic drop action. |
| `Baler.externalActionEventAutomaticUnloadUpdate(data: any, vehicle: any)` | 2937 | ✍ Updates the external automatic drop action. |
| `Baler.externalActionEventBaleTypeRegister(data: any, vehicle: any)` | 2949 | ✍ Registers the external bale type selection action. |
| `Baler.externalActionEventBaleTypeUpdate(data: any, vehicle: any)` | 2961 | ✍ Updates the external bale type selection action. |
| `Baler.loadSpecValueBaleSize(xmlFile: any, customEnvironment: any, baseDir: any)` | 2976 | ✍ Reads the bale dimensions for the shop (not re-read in detail). |
| `Baler.getSpecValueBaleSize(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any, roundBale: any)` | 3003 | ✍ Formats the bale dimensions for the shop. |
| `Baler.loadSpecValueBaleSizeRound(xmlFile: any, customEnvironment: any, baseDir: any)` | 3039 | ✍ Reads the round bale diameters for the shop. |
| `Baler.loadSpecValueBaleSizeSquare(xmlFile: any, customEnvironment: any, baseDir: any)` | 3050 | ✍ Reads the square bale dimensions for the shop. |
| `Baler.getSpecValueBaleSizeRound(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 3061 | ✍ Formats the round bale sizes for the shop. |
| `Baler.getSpecValueBaleSizeSquare(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 3073 | ✍ Formats the square bale sizes for the shop. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onBalerUnloadingStarted` | 209 |
| registerEvent | `onBalerUnloadingFinished` | 210 |
| registerFunction | `processBalerArea` | 216 |
| registerFunction | `setBaleTypeIndex` | 217 |
| registerFunction | `isUnloadingAllowed` | 218 |
| registerFunction | `getTimeFromLevel` | 219 |
| registerFunction | `moveBales` | 220 |
| registerFunction | `moveBale` | 221 |
| registerFunction | `setIsUnloadingBale` | 222 |
| registerFunction | `getIsBaleUnloading` | 223 |
| registerFunction | `dropBale` | 224 |
| registerFunction | `finishBale` | 225 |
| registerFunction | `createBale` | 226 |
| registerFunction | `setBaleTime` | 227 |
| registerFunction | `getCanUnloadUnfinishedBale` | 228 |
| registerFunction | `setBalerAutomaticDrop` | 229 |
| registerFunction | `updateDummyBale` | 230 |
| registerFunction | `deleteDummyBale` | 231 |
| registerFunction | `createDummyBale` | 232 |
| registerFunction | `handleUnloadingBaleEvent` | 233 |
| registerFunction | `dropBaleFromPlatform` | 234 |
| registerFunction | `getBalerBaleOwnerFarmId` | 235 |
| registerFunction | `getIsRoundBaler` | 236 |
| registerOverwrittenFunction | `loadSpeedRotatingPartFromXML` | 242 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 243 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 244 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 245 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 246 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 247 |
| registerOverwrittenFunction | `getConsumingLoad` | 248 |
| registerOverwrittenFunction | `getRequiresPower` | 249 |
| registerOverwrittenFunction | `getCanBeSelected` | 250 |
| registerOverwrittenFunction | `getIsAttachedTo` | 251 |
| registerOverwrittenFunction | `getAllowDynamicMountFillLevelInfo` | 252 |
| registerOverwrittenFunction | `getAlarmTriggerIsActive` | 253 |
| registerOverwrittenFunction | `loadAlarmTrigger` | 254 |
| registerOverwrittenFunction | `getShowConsumableEmptyWarning` | 255 |
| registerOverwrittenFunction | `addToPhysics` | 256 |
| registerOverwrittenFunction | `removeFromPhysics` | 257 |
| registerEventListener | `onLoad` | 263 |
| registerEventListener | `onPostLoad` | 264 |
| registerEventListener | `onLoadFinished` | 265 |
| registerEventListener | `onDelete` | 266 |
| registerEventListener | `onReadStream` | 267 |
| registerEventListener | `onWriteStream` | 268 |
| registerEventListener | `onReadUpdateStream` | 269 |
| registerEventListener | `onWriteUpdateStream` | 270 |
| registerEventListener | `onUpdate` | 271 |
| registerEventListener | `onUpdateTick` | 272 |
| registerEventListener | `onDraw` | 273 |
| registerEventListener | `onRegisterActionEvents` | 274 |
| registerEventListener | `onRegisterExternalActionEvents` | 275 |
| registerEventListener | `onStartWorkAreaProcessing` | 276 |
| registerEventListener | `onEndWorkAreaProcessing` | 277 |
| registerEventListener | `onTurnedOn` | 278 |
| registerEventListener | `onTurnedOff` | 279 |
| registerEventListener | `onRootVehicleChanged` | 280 |
| registerEventListener | `onChangedFillType` | 281 |
| registerEventListener | `onFillUnitFillLevelChanged` | 282 |
| registerEventListener | `onConsumableVariationChanged` | 283 |
