---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Combine.lua (generated stub, FS25 Lua Atlas)

--- Specialization of combine harvesters (and buffered forage harvesters): receives the harvests computed by the attached Cutters (addCutterArea), stores them in the fill unit, manages an input buffer (processing.inputBuffer, in timed slots) that feeds straw/chopping, and drives the visual effects client-side. EFFECTS (all through g_effectManager:loadEffect, EffectManager absent from the dump: internal rendering UNVERIFIED): "chopperEffect" (chopping, key vehicle.combine.chopperEffect), "strawEffect" (windrow drop), "fillEffect" (filling/ejection) and "effect" (general effects turned on at start), plus animationNodes, chopperAnimationNodes, strawDropAnimationNodes and fillingAnimationNodes. Conditions: chopper and straw are enabled by server timers (isChopperEffectEnabled / isStrawEffectEnabled, set to 500 ms when processCombineChopperArea or processCombineSwathArea really works, then decremented in onUpdateTick); the fillEffect follows isFilling (delay spec.processing.toggleTime after the last cut areas, fillTimeThreshold without cutting). The fill type (setEffectTypeInfo) is getCombineLastValidFillType; the effect density (g_effectManager:setDensity) equals cutterLoad x strawRatio x 0.8 + 0.2 (computed in addCutterArea, default value 0.2). No wind and no dedicated dust is driven here: the visible cutting dust comes from the XML effects (cutter.effect and the effects above) and remains a binary effect + density. WEATHER DATA: a single reading, getIsThreshingDuringRain, which queries weather:getRainFallScale() and weather:getTimeSinceLastRain() (thresholds: rain >= 0.1, or >= 0.02 in "early warning" mode, and time since last rain < 20; Weather units UNVERIFIED). If true (and not on a mission field, and allowThreshingDuringRain false), the yield added in addCutterArea is multiplied by (1 - Combine.RAIN_YIELD_REDUCTION) (constant not defined in the dump: UNVERIFIED) and onDraw shows the "rain reduces yield" warning. No rain-related visual effect here. NETWORK: the server computes; the states isFilling, chopperPSenabled, strawPSenabled, effectDensity (5 bits), fill type and fruit are sent through effectDirtyFlag in onWriteUpdateStream and applied client-side by setChopperPSEnabled / setStrawPSEnabled / setCombineIsFilling; dirtyFlag separates the fruit and the worked hectares; onWriteStream/onReadStream send the full state on connection (density set to 1); setIsSwathActive goes through CombineStrawEnableEvent. On a client, processCombineChopperArea and processCombineSwathArea only work if currentUpdateDistance <= Combine.CLIENT_DM_UPDATE_RADIUS (value UNVERIFIED). Extension points: registered events onStartThreshing and onStopThreshing (registerEvents); registered functions setChopperPSEnabled, setStrawPSEnabled, setCombineIsFilling, setIsSwathActive, getIsThreshingDuringRain, getCombineLastValidFillType, getCombineLoadPercentage, addCutterArea, verifyCombine, processCombineChopperArea/SwathArea, loadCombineEffects; overrides (getCanBeTurnedOn, getIsFoldAllowed, getDirtMultiplier, getWearMultiplier, getIsTurnedOnAnimationActive...). The effect setters are the cleanest hooks to observe or complement emissions without touching the harvest logic. Savegame: isSwathActive, workedHectars, numAttachedCutters.
---@class Combine
Combine = {}

--- Registers in the XML schema all the keys of vehicle.combine (warnings, buffer, windrow/swath, chopping, ladder, foldable ladder, additives, automatic tilt, folding, effects chopperEffect / strawEffect / fillEffect / effect, animationNodes, sounds, dashboards) and the savegame attributes isSwathActive, workedHectars and numAttachedCutters. Not re-read key by key.
function Combine.initSpecialization() end

--- Requires WorkArea, FillUnit, AnimatedVehicle, TurnOnVehicle and (Drivable or Attachable).
---@param specializations any
function Combine.prerequisitesPresent(specializations) end

--- Declares the events onStartThreshing and onStopThreshing.
---@param vehicleType any
function Combine.registerEvents(vehicleType) end

--- Exposes to the vehicle type the loading functions (loadCombineSetup, loadCombineEffects, loadCombineRotationNodes, loadCombineSamples), effect management (setChopperPSEnabled, setStrawPSEnabled, setCombineIsFilling), processing (processCombineChopperArea, processCombineSwathArea, setIsSwathActive, startThreshing, stopThreshing, addCutterArea, addCutterToCombine, removeCutterFromCombine, setWorkedHectars) and query functions (getIsThreshingDuringRain, verifyCombine, getFillLevelDependentSpeed, getIsCutterCompatible, getCombineLastValidFillType, getCombineFillLevelPercentage, getCombineLoadPercentage).
---@param vehicleType any
function Combine.registerFunctions(vehicleType) end

--- Overrides getCanBeTurnedOn, getTurnedOnNotAllowedWarning, getAreControlledActionsAllowed, getIsFoldAllowed, getCanBeSelected, loadWorkAreaFromXML, getDirtMultiplier, getWearMultiplier, loadTurnedOnAnimationFromXML, getIsTurnedOnAnimationActive, loadRandomlyMovingPartFromXML, getIsRandomlyMovingPartActive, getDischargeFillType and getImplementAllowAutomaticSteering.
---@param vehicleType any
function Combine.registerOverwrittenFunctions(vehicleType) end

--- Notably listens to onLoad, onPostLoad, onDelete, the network stream events, onUpdate, onUpdateTick, onDraw, onRegisterActionEvents, onStart/EndWorkAreaProcessing, onChangedFillType, onDeactivate, implement attach/detach, onTurnedOn/Off, onEnter/LeaveVehicle, onFoldStateChanged and onFillUnitFillLevelChanged.
---@param vehicleType any
function Combine.registerEventListeners(vehicleType) end

--- Loads the configuration (loadCombineSetup, effects, rotation nodes, sounds) and initializes the state: attached cutters, warning texts (including "rain reduces yield"), last fruit/fill type, threshingScale (1 by default), work area parameters (effectDensity 0.2, effect timers at 0) and two dirty flags (dirtyFlag, effectDirtyFlag).
---@param savegame any
function Combine:onLoad(savegame) end

--- After loading: restores the swath state (isSwathActive) and worked hectares from the savegame, detects a buffered harvester (infinite capacity), links the fill units for the HUD, positions the ladder according to the fold state and emits XML warnings on a zero capacity.
---@param savegame table
function Combine:onPostLoad(savegame) end

--- Declares the harvester dashboard values (worked hectares, session, etc.). Detail not re-read.
function Combine:onRegisterDashboardValueTypes() end

--- Deletes the effects (general, fill, straw, chopping), animations and sounds.
function Combine:onDelete() end

--- Saves isSwathActive (if available), workedHectars and numAttachedCutters.
---@param xmlFile any
---@param key any
---@param usedModNames any
function Combine:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client side on connection: reads fruit, isFilling / chopper / straw states, fill type, swath and hectares, then applies the effects (density 1).
---@param streamId integer
---@param connection Connection
function Combine:onReadStream(streamId, connection) end

--- Server side on connection: writes the valid fruit, isFilling, chopperPSenabled, strawPSenabled, the valid fill type, isSwathActive and workedHectars.
---@param streamId integer
---@param connection Connection
function Combine:onWriteStream(streamId, connection) end

--- Client side: reads, according to two indicators, (1) the valid fruit and worked hectares, (2) isFilling, chopper/straw states, effect density on 5 bits and fill type; applies setCombineIsFilling, setChopperPSEnabled and setStrawPSEnabled in synchronized mode.
---@param streamId integer
---@param timestamp integer
---@param connection table
function Combine:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: writes the first block if dirtyFlag is raised and the second if effectDirtyFlag is raised (effect states, density x 31, fill type).
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function Combine:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Per frame: server side, disables the swath if the fruit has no windrow or re-enables it (and empties the input buffer) if possible, updates lastDischargeTime when the tank is empty, and drives the automatic tilt of the header from the Cutter (node rotation, dependent animation, hitch repositioning).
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Combine:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Per tick, server side: advances the input buffer by slots, enables/disables isFilling after the toggleTime delays, decrements the effect timers, calls setChopperPSEnabled and setStrawPSEnabled with the current density (and raiseActive while they are active), counts threshing time (statistics), empties the intermediate buffer, handles the delayed loading slots and raises effectDirtyFlag when the state or density (difference > 0.05) changed.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Combine:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Shows once per episode the reduced yield warning if the tool is turned on and getIsThreshingDuringRain(false) is true; shows the trailer warning if showTrailerWarning.
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Combine:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Reads the base configuration of vehicle.combine: allowThreshingDuringRain (false by default), fill units, buffer, delays, swath, chopping (chopper), ladder, additives, automatic tilt, folding, toggle durations, start animation. Detail not re-read line by line.
---@param xmlFile any
---@param baseKey any
---@param entry any
function Combine:loadCombineSetup(xmlFile, baseKey, entry) end

--- Client side, loads the effect groups chopperEffect, strawEffect, fillEffect and effect, and initializes their states (disabled, unknown type).
---@param xmlFile any
---@param baseKey any
---@param entry any
function Combine:loadCombineEffects(xmlFile, baseKey, entry) end

--- Loads the harvester animationNodes (general, chopping, straw drop, filling) with the inversion parameter according to the fill level.
---@param xmlFile any
---@param baseKey any
---@param entry any
function Combine:loadCombineRotationNodes(xmlFile, baseKey, entry) end

--- Loads the harvester sound samples (start, stop, work, chopping, straw, filling...).
---@param xmlFile any
---@param key any
---@param entry any
function Combine:loadCombineSamples(xmlFile, key, entry) end

--- Switches between windrow drop and chopping: sends CombineStrawEnableEvent, plays the deflector animation, empties the flow slots, and, if turned on client-side, switches the matching animations and sounds.
---@param isSwathActive boolean
---@param noEventSend boolean
---@param force boolean
function Combine:setIsSwathActive(isSwathActive, noEventSend, force) end

--- Chopping work area (swath inactive): if straw is to be dropped (litersToDrop > 0) and strawRatio > 0.5, writes into the density maps (crop haulm or straw ground type via setGroundTypeLayerArea, tire track erasure, chopped stubble level), then arms isChopperEffectEnabled to 500 ms. Ignored beyond CLIENT_DM_UPDATE_RADIUS on a client.
---@param workArea any
function Combine:processCombineChopperArea(workArea) end

--- Windrow work area: drops a straw windrow along a line (DensityMapHeightUtil.tipToGroundAroundLine) with the fruit windrow type; if litres are dropped, arms isStrawEffectEnabled to 500 ms; the surplus that cannot be dropped is lost rather than buffered.
---@param workArea any
function Combine:processCombineSwathArea(workArea) end

--- Enables/disables the chopping effect (g_effectManager start/stop with the fill type) and the chopStraw sound; applies the received density. On a synchronized server, stores the sent state. Client side only for the effects.
---@param chopperPSenabled boolean
---@param fruitTypeChanged boolean
---@param density number
---@param isSynchronized boolean
function Combine:setChopperPSEnabled(chopperPSenabled, fruitTypeChanged, density, isSynchronized) end

--- Same principle for the straw drop effect and the dropStraw sound; resets strawToDrop to 0 on stop.
---@param strawPSenabled boolean
---@param fruitTypeChanged boolean
---@param density number
---@param isSynchronized boolean
function Combine:setStrawPSEnabled(strawPSenabled, fruitTypeChanged, density, isSynchronized) end

--- Enables/disables the filling state: filling animations, fill type of the general effects, fillEffect (start/stop) and filling sound. Client side.
---@param isFilling boolean
---@param fruitTypeChanged boolean
---@param isSynchronized boolean
function Combine:setCombineIsFilling(isFilling, fruitTypeChanged, isSynchronized) end

--- If cutters are attached: turns them on, plays the start animation and sounds, raises onStartThreshing.
function Combine:startThreshing() end

--- Plays the stop sound, stops isFilling, if the tank is full turns off the cruise control and raises/folds the cutters, turns the cutters off and raises onStopThreshing.
function Combine:stopThreshing() end

--- Updates the worked hectares, synchronizes via dirtyFlag if the difference exceeds 0.01 (server) and refreshes the dashboard (client).
---@param hectars number
---@param isInitial any
function Combine:setWorkedHectars(hectars, isInitial) end

--- Registers an attached cutter and unfolds the ladder if configured.
---@param cutter any
function Combine:addCutterToCombine(cutter) end

--- Removes a cutter: if it was the last one, turns the machine off and empties the invisible buffer of a buffered harvester; folds the ladder; restarts the controlled actions if the AVC is active.
---@param cutter any
function Combine:removeCutterFromCombine(cutter) end

--- Entry point of the harvest: receives area, litres, input fruit, output type, straw ratio and cutter load. Applies threshingScale, the rain yield reduction (if getIsThreshingDuringRain and not on a mission) and the damage one, feeds the input buffer with the straw (stubble ground type or haulm, effectDensity = load x ratio x 0.8 + 0.2), schedules isFilling, consumes additives (+5 % yield), updates the hectares and adds the litres to the tank (with buffer, loading delay). Returns the litres applied.
---@param area any
---@param liters any
---@param inputFruitType any
---@param outputFillType any
---@param strawRatio any
---@param farmId any
---@param cutterLoad any
function Combine:addCutterArea(area, liters, inputFruitType, outputFillType, strawRatio, farmId, cutterLoad) end

--- True if threshing during rain is forbidden for this model and getRainFallScale() reaches 0.1 (0.02 in early warning) while getTimeSinceLastRain() is below 20. The only weather dependency of the file.
---@param earlyWarning boolean
---@return boolean
function Combine:getIsThreshingDuringRain(earlyWarning) end

--- Checks that the harvester can receive a fruit/output type: refuses if another type already fills the tank above the threshold (or empties the buffer of a buffered harvester) and if the free capacity is insufficient; returns the harvester or nil and an alternative.
---@param fruitType any
---@param outputFillType any
function Combine:verifyCombine(fruitType, outputFillType) end

--- Returns -1 if the fill level exceeds the animationNodes inversion threshold, otherwise 1.
function Combine:getFillLevelDependentSpeed() end

--- True if one of the cutter output fill types is accepted by the fill unit.
---@param fillTypes table
---@return boolean
function Combine:getIsCutterCompatible(fillTypes) end

--- Last valid fill type: buffer, tank, delayed loading slots, then last input type.
---@return integer
function Combine:getCombineLastValidFillType() end

--- Real fill percentage (capped at 1), including the delayed loading slots.
---@return number
function Combine:getCombineFillLevelPercentage() end

--- Average of the loads (getCutterLoad) of the attached cutters.
function Combine:getCombineLoadPercentage() end

--- Refuses turning on without an attached cutter or if a cutter refuses to be turned on.
---@param superFunc any
---@return boolean
function Combine:getCanBeTurnedOn(superFunc) end

--- Returns the appropriate warning (no cutter, or that of a cutter).
---@param superFunc any
---@return string
function Combine:getTurnedOnNotAllowedWarning(superFunc) end

--- Refuses controlled actions without an attached cutter.
---@param superFunc any
---@return boolean
---@return string
function Combine:getAreControlledActionsAllowed(superFunc) end

--- Forbids folding during threshing (according to allowFoldWhileThreshing) or with the tank filled above the threshold.
---@param superFunc any
---@param direction any
---@param onAiTurnOn any
---@return boolean
function Combine:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

--- Always returns true.
---@param superFunc any
function Combine:getCanBeSelected(superFunc) end

--- Loads a work area and reads the parameters specific to chopping/swath (rest not re-read in detail).
---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function Combine:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Adds the work dirt multiplier x (speed / cutter limit) if an attached cutter is working.
---@param superFunc any
function Combine:getDirtMultiplier(superFunc) end

--- Same principle for wear, multiplied by the cutter stone factor.
---@param superFunc any
function Combine:getWearMultiplier(superFunc) end

--- Adds the options activeChopper, activeStrawDrop (true by default) and waitForStraw to the turn-on animations.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param turnedOnAnimation any
function Combine:loadTurnedOnAnimationFromXML(superFunc, xmlFile, key, turnedOnAnimation) end

--- Disables the animation according to the swath/chopping mode; with waitForStraw, stays active as long as the chopping effect is armed.
---@param superFunc any
---@param turnedOnAnimation any
function Combine:getIsTurnedOnAnimationActive(superFunc, turnedOnAnimation) end

--- Adds the moveOnlyIfCut option to randomly moving parts.
---@param superFunc any
---@param part any
---@param xmlFile any
---@param key any
function Combine:loadRandomlyMovingPartFromXML(superFunc, part, xmlFile, key) end

--- With moveOnlyIfCut, only activates the part if a cutter cut during the last 150 ms.
---@param superFunc any
---@param part any
function Combine:getIsRandomlyMovingPartActive(superFunc, part) end

--- If the fill unit is empty, uses the fill type of the delayed loading slots for the discharge.
---@param superFunc any
---@param dischargeNode any
function Combine:getDischargeFillType(superFunc, dischargeNode) end

--- Always returns true.
---@param superFunc any
function Combine:getImplementAllowAutomaticSteering(superFunc) end

--- Client side, registers the TOGGLE_CHOPPER action (swath/chopping) if both modes exist.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Combine:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Before the work areas: prepares litersToDrop (current buffer slot), minLitersToDrop, strawRatio, stubble ground type, effectDensity and dropFillType.
---@param dt any
function Combine:onStartWorkAreaProcessing(dt) end

--- After the areas: removes from the slot the litres actually dropped.
---@param dt any
---@param hasProcessed any
function Combine:onEndWorkAreaProcessing(dt, hasProcessed) end

--- When the fill type changes, restarts the active effects (chopping, straw, filling) with the new type.
---@param fillUnitIndex any
---@param fillTypeIndex any
function Combine:onChangedFillType(fillUnitIndex, fillTypeIndex) end

--- Stops the chopping, straw and filling effects and cancels the timers.
function Combine:onDeactivate() end

--- If the attached implement is of cutter type, adds it to the harvester.
---@param attachable table
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param loadFromSavegame any
function Combine:onPostAttachImplement(attachable, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

--- If the detached implement is of cutter type, removes it.
---@param implementIndex integer
function Combine:onPostDetachImplement(implementIndex) end

--- Starts threshing (startThreshing), the suitable animations (swath or chopping), the sounds and the general effects with the fill type (client side); server side, turns off if turnOffWhenFull and the tank is full.
function Combine:onTurnedOn() end

--- Stops threshing, animations, general effects and the chopping sound (client side).
function Combine:onTurnedOff() end

--- Folds the ladder on entering the vehicle, except for fold conditions or an attached cutter.
function Combine:onEnterVehicle() end

--- Unfolds the ladder when leaving the vehicle, under the same conditions.
function Combine:onLeaveVehicle() end

--- Plays the ladder animation according to the fold direction.
---@param direction any
---@param moveToMiddle any
function Combine:onFoldStateChanged(direction, moveToMiddle) end

--- Stores the time of the last discharge when the level drops; server side, turns the machine off if turnOffWhenFull and the tank is full.
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function Combine:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData, appliedDelta) end

--- TOGGLE_CHOPPER action callback: toggles the swath if the fruit has a windrow, otherwise shows the "cannot toggle" warning.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Combine.actionEventToggleChopper(self, actionName, inputValue, callbackState, isAnalog) end

--- Updates the action text according to whether the swath is active or not.
---@param self any
function Combine.updateToggleStrawText(self) end
