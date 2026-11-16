# vehicles/specializations/Combine.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Combine.md)*

Source: `dataS/scripts/vehicles/specializations/Combine.lua` — FS25 1.25.1.0

✍ Specialization of combine harvesters (and buffered forage harvesters): receives the harvests computed by the attached Cutters (addCutterArea), stores them in the fill unit, manages an input buffer (processing.inputBuffer, in timed slots) that feeds straw/chopping, and drives the visual effects client-side. EFFECTS (all through g_effectManager:loadEffect, EffectManager absent from the dump: internal rendering UNVERIFIED): "chopperEffect" (chopping, key vehicle.combine.chopperEffect), "strawEffect" (windrow drop), "fillEffect" (filling/ejection) and "effect" (general effects turned on at start), plus animationNodes, chopperAnimationNodes, strawDropAnimationNodes and fillingAnimationNodes. Conditions: chopper and straw are enabled by server timers (isChopperEffectEnabled / isStrawEffectEnabled, set to 500 ms when processCombineChopperArea or processCombineSwathArea really works, then decremented in onUpdateTick); the fillEffect follows isFilling (delay spec.processing.toggleTime after the last cut areas, fillTimeThreshold without cutting). The fill type (setEffectTypeInfo) is getCombineLastValidFillType; the effect density (g_effectManager:setDensity) equals cutterLoad x strawRatio x 0.8 + 0.2 (computed in addCutterArea, default value 0.2). No wind and no dedicated dust is driven here: the visible cutting dust comes from the XML effects (cutter.effect and the effects above) and remains a binary effect + density. WEATHER DATA: a single reading, getIsThreshingDuringRain, which queries weather:getRainFallScale() and weather:getTimeSinceLastRain() (thresholds: rain >= 0.1, or >= 0.02 in "early warning" mode, and time since last rain < 20; Weather units UNVERIFIED). If true (and not on a mission field, and allowThreshingDuringRain false), the yield added in addCutterArea is multiplied by (1 - Combine.RAIN_YIELD_REDUCTION) (constant not defined in the dump: UNVERIFIED) and onDraw shows the "rain reduces yield" warning. No rain-related visual effect here. NETWORK: the server computes; the states isFilling, chopperPSenabled, strawPSenabled, effectDensity (5 bits), fill type and fruit are sent through effectDirtyFlag in onWriteUpdateStream and applied client-side by setChopperPSEnabled / setStrawPSEnabled / setCombineIsFilling; dirtyFlag separates the fruit and the worked hectares; onWriteStream/onReadStream send the full state on connection (density set to 1); setIsSwathActive goes through CombineStrawEnableEvent. On a client, processCombineChopperArea and processCombineSwathArea only work if currentUpdateDistance <= Combine.CLIENT_DM_UPDATE_RADIUS (value UNVERIFIED). Extension points: registered events onStartThreshing and onStopThreshing (registerEvents); registered functions setChopperPSEnabled, setStrawPSEnabled, setCombineIsFilling, setIsSwathActive, getIsThreshingDuringRain, getCombineLastValidFillType, getCombineLoadPercentage, addCutterArea, verifyCombine, processCombineChopperArea/SwathArea, loadCombineEffects; overrides (getCanBeTurnedOn, getIsFoldAllowed, getDirtMultiplier, getWearMultiplier, getIsTurnedOnAnimationActive...). The effect setters are the cleanest hooks to observe or complement emissions without touching the harvest logic. Savegame: isSwathActive, workedHectars, numAttachedCutters.

- **Combine** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `Combine.initSpecialization()` | 20 | ✍ Registers in the XML schema all the keys of vehicle.combine (warnings, buffer, windrow/swath, chopping, ladder, foldable ladder, additives, automatic tilt, folding, effects chopperEffect / strawEffect / fillEffect / effect, animationNodes, sounds, dashboards) and the savegame attributes isSwathActive, workedHectars and numAttachedCutters. Not re-read key by key. |
| `Combine.prerequisitesPresent(specializations: any)` | 128 | ✍ Requires WorkArea, FillUnit, AnimatedVehicle, TurnOnVehicle and (Drivable or Attachable). |
| `Combine.registerEvents(vehicleType: any)` | 138 | ✍ Declares the events onStartThreshing and onStopThreshing. |
| `Combine.registerFunctions(vehicleType: any)` | 145 | ✍ Exposes to the vehicle type the loading functions (loadCombineSetup, loadCombineEffects, loadCombineRotationNodes, loadCombineSamples), effect management (setChopperPSEnabled, setStrawPSEnabled, setCombineIsFilling), processing (processCombineChopperArea, processCombineSwathArea, setIsSwathActive, startThreshing, stopThreshing, addCutterArea, addCutterToCombine, removeCutterFromCombine, setWorkedHectars) and query functions (getIsThreshingDuringRain, verifyCombine, getFillLevelDependentSpeed, getIsCutterCompatible, getCombineLastValidFillType, getCombineFillLevelPercentage, getCombineLoadPercentage). |
| `Combine.registerOverwrittenFunctions(vehicleType: any)` | 173 | ✍ Overrides getCanBeTurnedOn, getTurnedOnNotAllowedWarning, getAreControlledActionsAllowed, getIsFoldAllowed, getCanBeSelected, loadWorkAreaFromXML, getDirtMultiplier, getWearMultiplier, loadTurnedOnAnimationFromXML, getIsTurnedOnAnimationActive, loadRandomlyMovingPartFromXML, getIsRandomlyMovingPartActive, getDischargeFillType and getImplementAllowAutomaticSteering. |
| `Combine.registerEventListeners(vehicleType: any)` | 192 | ✍ Notably listens to onLoad, onPostLoad, onDelete, the network stream events, onUpdate, onUpdateTick, onDraw, onRegisterActionEvents, onStart/EndWorkAreaProcessing, onChangedFillType, onDeactivate, implement attach/detach, onTurnedOn/Off, onEnter/LeaveVehicle, onFoldStateChanged and onFillUnitFillLevelChanged. |
| `Combine:onLoad(savegame: any)` | 221 | ✍ Loads the configuration (loadCombineSetup, effects, rotation nodes, sounds) and initializes the state: attached cutters, warning texts (including "rain reduces yield"), last fruit/fill type, threshingScale (1 by default), work area parameters (effectDensity 0.2, effect timers at 0) and two dirty flags (dirtyFlag, effectDirtyFlag). |
| `Combine:onPostLoad(savegame: table)` | 283 | ✍ After loading: restores the swath state (isSwathActive) and worked hectares from the savegame, detects a buffered harvester (infinite capacity), links the fill units for the HUD, positions the ladder according to the fold state and emits XML warnings on a zero capacity. |
| `Combine:onRegisterDashboardValueTypes()` | 348 | ✍ Declares the harvester dashboard values (worked hectares, session, etc.). Detail not re-read. |
| `Combine:onDelete()` | 364 | ✍ Deletes the effects (general, fill, straw, chopping), animations and sounds. |
| `Combine:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 382 | ✍ Saves isSwathActive (if available), workedHectars and numAttachedCutters. |
| `Combine:onReadStream(streamId: integer, connection: Connection)` | 397 | ✍ Client side on connection: reads fruit, isFilling / chopper / straw states, fill type, swath and hectares, then applies the effects (density 1). |
| `Combine:onWriteStream(streamId: integer, connection: Connection)` | 421 | ✍ Server side on connection: writes the valid fruit, isFilling, chopperPSenabled, strawPSenabled, the valid fill type, isSwathActive and workedHectars. |
| `Combine:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 439 | ✍ Client side: reads, according to two indicators, (1) the valid fruit and worked hectares, (2) isFilling, chopper/straw states, effect density on 5 bits and fill type; applies setCombineIsFilling, setChopperPSEnabled and setStrawPSEnabled in synchronized mode. |
| `Combine:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 470 | ✍ Server side: writes the first block if dirtyFlag is raised and the second if effectDirtyFlag is raised (effect states, density x 31, fill type). |
| `Combine:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 496 | ✍ Per frame: server side, disables the swath if the fruit has no windrow or re-enables it (and empties the input buffer) if possible, updates lastDischargeTime when the tank is empty, and drives the automatic tilt of the header from the Cutter (node rotation, dependent animation, hitch repositioning). |
| `Combine:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 591 | ✍ Per tick, server side: advances the input buffer by slots, enables/disables isFilling after the toggleTime delays, decrements the effect timers, calls setChopperPSEnabled and setStrawPSEnabled with the current density (and raiseActive while they are active), counts threshing time (statistics), empties the intermediate buffer, handles the delayed loading slots and raises effectDirtyFlag when the state or density (difference > 0.05) changed. |
| `Combine:onDraw(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 704 | ✍ Shows once per episode the reduced yield warning if the tool is turned on and getIsThreshingDuringRain(false) is true; shows the trailer warning if showTrailerWarning. |
| `Combine:loadCombineSetup(xmlFile: any, baseKey: any, entry: any)` | 728 | ✍ Reads the base configuration of vehicle.combine: allowThreshingDuringRain (false by default), fill units, buffer, delays, swath, chopping (chopper), ladder, additives, automatic tilt, folding, toggle durations, start animation. Detail not re-read line by line. |
| `Combine:loadCombineEffects(xmlFile: any, baseKey: any, entry: any)` | 865 | ✍ Client side, loads the effect groups chopperEffect, strawEffect, fillEffect and effect, and initializes their states (disabled, unknown type). |
| `Combine:loadCombineRotationNodes(xmlFile: any, baseKey: any, entry: any)` | 890 | ✍ Loads the harvester animationNodes (general, chopping, straw drop, filling) with the inversion parameter according to the fill level. |
| `Combine:loadCombineSamples(xmlFile: any, key: any, entry: any)` | 903 | ✍ Loads the harvester sound samples (start, stop, work, chopping, straw, filling...). |
| `Combine:setIsSwathActive(isSwathActive: boolean, noEventSend: boolean, force: boolean)` | 926 | ✍ Switches between windrow drop and chopping: sends CombineStrawEnableEvent, plays the deflector animation, empties the flow slots, and, if turned on client-side, switches the matching animations and sounds. |
| `Combine:processCombineChopperArea(workArea: any)` | 979 | ✍ Chopping work area (swath inactive): if straw is to be dropped (litersToDrop > 0) and strawRatio > 0.5, writes into the density maps (crop haulm or straw ground type via setGroundTypeLayerArea, tire track erasure, chopped stubble level), then arms isChopperEffectEnabled to 500 ms. Ignored beyond CLIENT_DM_UPDATE_RADIUS on a client. |
| `Combine:processCombineSwathArea(workArea: any)` | 1029 | ✍ Windrow work area: drops a straw windrow along a line (DensityMapHeightUtil.tipToGroundAroundLine) with the fruit windrow type; if litres are dropped, arms isStrawEffectEnabled to 500 ms; the surplus that cannot be dropped is lost rather than buffered. |
| `Combine:setChopperPSEnabled(chopperPSenabled: boolean, fruitTypeChanged: boolean, density: number, isSynchronized: boolean)` | 1073 | ✍ Enables/disables the chopping effect (g_effectManager start/stop with the fill type) and the chopStraw sound; applies the received density. On a synchronized server, stores the sent state. Client side only for the effects. |
| `Combine:setStrawPSEnabled(strawPSenabled: boolean, fruitTypeChanged: boolean, density: number, isSynchronized: boolean)` | 1113 | ✍ Same principle for the straw drop effect and the dropStraw sound; resets strawToDrop to 0 on stop. |
| `Combine:setCombineIsFilling(isFilling: boolean, fruitTypeChanged: boolean, isSynchronized: boolean)` | 1155 | ✍ Enables/disables the filling state: filling animations, fill type of the general effects, fillEffect (start/stop) and filling sound. Client side. |
| `Combine:startThreshing()` | 1199 | ✍ If cutters are attached: turns them on, plays the start animation and sounds, raises onStartThreshing. |
| `Combine:stopThreshing()` | 1224 | ✍ Plays the stop sound, stops isFilling, if the tank is full turns off the cruise control and raises/folds the cutters, turns the cutters off and raises onStopThreshing. |
| `Combine:setWorkedHectars(hectars: number, isInitial: any)` | 1269 | ✍ Updates the worked hectares, synchronizes via dirtyFlag if the difference exceeds 0.01 (server) and refreshes the dashboard (client). |
| `Combine:addCutterToCombine(cutter: any)` | 1295 | ✍ Registers an attached cutter and unfolds the ladder if configured. |
| `Combine:removeCutterFromCombine(cutter: any)` | 1313 | ✍ Removes a cutter: if it was the last one, turns the machine off and empties the invisible buffer of a buffered harvester; folds the ladder; restarts the controlled actions if the AVC is active. |
| `Combine:addCutterArea(area: any, liters: any, inputFruitType: any, outputFillType: any, strawRatio: any, farmId: any, cutterLoad: any)` | 1357 | ✍ Entry point of the harvest: receives area, litres, input fruit, output type, straw ratio and cutter load. Applies threshingScale, the rain yield reduction (if getIsThreshingDuringRain and not on a mission) and the damage one, feeds the input buffer with the straw (stubble ground type or haulm, effectDensity = load x ratio x 0.8 + 0.2), schedules isFilling, consumes additives (+5 % yield), updates the hectares and adds the litres to the tank (with buffer, loading delay). Returns the litres applied. |
| `Combine:getIsThreshingDuringRain(earlyWarning: boolean) → boolean` | 1495 | ✍ True if threshing during rain is forbidden for this model and getRainFallScale() reaches 0.1 (0.02 in early warning) while getTimeSinceLastRain() is below 20. The only weather dependency of the file. |
| `Combine:verifyCombine(fruitType: any, outputFillType: any)` | 1517 | ✍ Checks that the harvester can receive a fruit/output type: refuses if another type already fills the tank above the threshold (or empties the buffer of a buffered harvester) and if the free capacity is insufficient; returns the harvester or nil and an alternative. |
| `Combine:getFillLevelDependentSpeed()` | 1547 | ✍ Returns -1 if the fill level exceeds the animationNodes inversion threshold, otherwise 1. |
| `Combine:getIsCutterCompatible(fillTypes: table) → boolean` | 1565 | ✍ True if one of the cutter output fill types is accepted by the fill unit. |
| `Combine:getCombineLastValidFillType() → integer` | 1584 | ✍ Last valid fill type: buffer, tank, delayed loading slots, then last input type. |
| `Combine:getCombineFillLevelPercentage() → number` | 1617 | ✍ Real fill percentage (capped at 1), including the delayed loading slots. |
| `Combine:getCombineLoadPercentage()` | 1635 | ✍ Average of the loads (getCutterLoad) of the attached cutters. |
| `Combine:getCanBeTurnedOn(superFunc: any) → boolean` | 1658 | ✍ Refuses turning on without an attached cutter or if a cutter refuses to be turned on. |
| `Combine:getTurnedOnNotAllowedWarning(superFunc: any) → string` | 1679 | ✍ Returns the appropriate warning (no cutter, or that of a cutter). |
| `Combine:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 1707 | ✍ Refuses controlled actions without an attached cutter. |
| `Combine:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any) → boolean` | 1721 | ✍ Forbids folding during threshing (according to allowFoldWhileThreshing) or with the tank filled above the threshold. |
| `Combine:getCanBeSelected(superFunc: any)` | 1738 | ✍ Always returns true. |
| `Combine:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 1744 | ✍ Loads a work area and reads the parameters specific to chopping/swath (rest not re-read in detail). |
| `Combine:getDirtMultiplier(superFunc: any)` | 1765 | ✍ Adds the work dirt multiplier x (speed / cutter limit) if an attached cutter is working. |
| `Combine:getWearMultiplier(superFunc: any)` | 1781 | ✍ Same principle for wear, multiplied by the cutter stone factor. |
| `Combine:loadTurnedOnAnimationFromXML(superFunc: any, xmlFile: any, key: any, turnedOnAnimation: any)` | 1798 | ✍ Adds the options activeChopper, activeStrawDrop (true by default) and waitForStraw to the turn-on animations. |
| `Combine:getIsTurnedOnAnimationActive(superFunc: any, turnedOnAnimation: any)` | 1809 | ✍ Disables the animation according to the swath/chopping mode; with waitForStraw, stays active as long as the chopping effect is armed. |
| `Combine:loadRandomlyMovingPartFromXML(superFunc: any, part: any, xmlFile: any, key: any)` | 1825 | ✍ Adds the moveOnlyIfCut option to randomly moving parts. |
| `Combine:getIsRandomlyMovingPartActive(superFunc: any, part: any)` | 1835 | ✍ With moveOnlyIfCut, only activates the part if a cutter cut during the last 150 ms. |
| `Combine:getDischargeFillType(superFunc: any, dischargeNode: any)` | 1854 | ✍ If the fill unit is empty, uses the fill type of the delayed loading slots for the discharge. |
| `Combine:getImplementAllowAutomaticSteering(superFunc: any)` | 1886 | ✍ Always returns true. |
| `Combine:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1892 | ✍ Client side, registers the TOGGLE_CHOPPER action (swath/chopping) if both modes exist. |
| `Combine:onStartWorkAreaProcessing(dt: any)` | 1913 | ✍ Before the work areas: prepares litersToDrop (current buffer slot), minLitersToDrop, strawRatio, stubble ground type, effectDensity and dropFillType. |
| `Combine:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 1954 | ✍ After the areas: removes from the slot the litres actually dropped. |
| `Combine:onChangedFillType(fillUnitIndex: any, fillTypeIndex: any)` | 1964 | ✍ When the fill type changes, restarts the active effects (chopping, straw, filling) with the new type. |
| `Combine:onDeactivate()` | 1987 | ✍ Stops the chopping, straw and filling effects and cancels the timers. |
| `Combine:onPostAttachImplement(attachable: table, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 2000 | ✍ If the attached implement is of cutter type, adds it to the harvester. |
| `Combine:onPostDetachImplement(implementIndex: integer)` | 2012 | ✍ If the detached implement is of cutter type, removes it. |
| `Combine:onTurnedOn()` | 2027 | ✍ Starts threshing (startThreshing), the suitable animations (swath or chopping), the sounds and the general effects with the fill type (client side); server side, turns off if turnOffWhenFull and the tank is full. |
| `Combine:onTurnedOff()` | 2060 | ✍ Stops threshing, animations, general effects and the chopping sound (client side). |
| `Combine:onEnterVehicle()` | 2079 | ✍ Folds the ladder on entering the vehicle, except for fold conditions or an attached cutter. |
| `Combine:onLeaveVehicle()` | 2104 | ✍ Unfolds the ladder when leaving the vehicle, under the same conditions. |
| `Combine:onFoldStateChanged(direction: any, moveToMiddle: any)` | 2129 | ✍ Plays the ladder animation according to the fold direction. |
| `Combine:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 2147 | ✍ Stores the time of the last discharge when the level drops; server side, turns the machine off if turnOffWhenFull and the tank is full. |
| `Combine.actionEventToggleChopper(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2167 | ✍ TOGGLE_CHOPPER action callback: toggles the swath if the fruit has a windrow, otherwise shows the "cannot toggle" warning. |
| `Combine.updateToggleStrawText(self: any)` | 2188 | ✍ Updates the action text according to whether the swath is active or not. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onStartThreshing` | 139 |
| registerEvent | `onStopThreshing` | 140 |
| registerFunction | `loadCombineSetup` | 146 |
| registerFunction | `loadCombineEffects` | 147 |
| registerFunction | `loadCombineRotationNodes` | 148 |
| registerFunction | `loadCombineSamples` | 149 |
| registerFunction | `setIsSwathActive` | 150 |
| registerFunction | `processCombineChopperArea` | 151 |
| registerFunction | `processCombineSwathArea` | 152 |
| registerFunction | `setChopperPSEnabled` | 153 |
| registerFunction | `setStrawPSEnabled` | 154 |
| registerFunction | `setCombineIsFilling` | 155 |
| registerFunction | `startThreshing` | 156 |
| registerFunction | `stopThreshing` | 157 |
| registerFunction | `setWorkedHectars` | 158 |
| registerFunction | `addCutterToCombine` | 159 |
| registerFunction | `removeCutterFromCombine` | 160 |
| registerFunction | `addCutterArea` | 161 |
| registerFunction | `getIsThreshingDuringRain` | 162 |
| registerFunction | `verifyCombine` | 163 |
| registerFunction | `getFillLevelDependentSpeed` | 164 |
| registerFunction | `getCombineLastValidFillType` | 165 |
| registerFunction | `getCombineFillLevelPercentage` | 166 |
| registerFunction | `getCombineLoadPercentage` | 167 |
| registerFunction | `getIsCutterCompatible` | 168 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 174 |
| registerOverwrittenFunction | `getTurnedOnNotAllowedWarning` | 175 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 176 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 177 |
| registerOverwrittenFunction | `getCanBeSelected` | 178 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 179 |
| registerOverwrittenFunction | `getDirtMultiplier` | 180 |
| registerOverwrittenFunction | `getWearMultiplier` | 181 |
| registerOverwrittenFunction | `loadTurnedOnAnimationFromXML` | 182 |
| registerOverwrittenFunction | `getIsTurnedOnAnimationActive` | 183 |
| registerOverwrittenFunction | `loadRandomlyMovingPartFromXML` | 184 |
| registerOverwrittenFunction | `getIsRandomlyMovingPartActive` | 185 |
| registerOverwrittenFunction | `getDischargeFillType` | 186 |
| registerOverwrittenFunction | `getImplementAllowAutomaticSteering` | 187 |
| registerEventListener | `onLoad` | 193 |
| registerEventListener | `onPostLoad` | 194 |
| registerEventListener | `onRegisterDashboardValueTypes` | 195 |
| registerEventListener | `onDelete` | 196 |
| registerEventListener | `onReadStream` | 197 |
| registerEventListener | `onWriteStream` | 198 |
| registerEventListener | `onReadUpdateStream` | 199 |
| registerEventListener | `onWriteUpdateStream` | 200 |
| registerEventListener | `onUpdate` | 201 |
| registerEventListener | `onUpdateTick` | 202 |
| registerEventListener | `onDraw` | 203 |
| registerEventListener | `onRegisterActionEvents` | 204 |
| registerEventListener | `onStartWorkAreaProcessing` | 205 |
| registerEventListener | `onEndWorkAreaProcessing` | 206 |
| registerEventListener | `onChangedFillType` | 207 |
| registerEventListener | `onDeactivate` | 208 |
| registerEventListener | `onPostAttachImplement` | 209 |
| registerEventListener | `onPostDetachImplement` | 210 |
| registerEventListener | `onTurnedOn` | 211 |
| registerEventListener | `onTurnedOff` | 212 |
| registerEventListener | `onEnterVehicle` | 213 |
| registerEventListener | `onLeaveVehicle` | 214 |
| registerEventListener | `onFoldStateChanged` | 215 |
| registerEventListener | `onFillUnitFillLevelChanged` | 216 |
