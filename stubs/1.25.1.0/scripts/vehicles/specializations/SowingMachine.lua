---@meta
-- FS25 1.25.1.0 : vehicles/specializations/SowingMachine.lua (generated stub, FS25 Lua Atlas)

--- Specialization for seeders and planters (conventional sowing, direct sowing, water sowing, ridge sowing). Prerequisites: FillUnit, WorkArea, TurnOnVehicle. EFFECTS (client): two groups loaded by g_effectManager:loadEffect: effects (vehicle.sowingMachine.effects: seeds on the ground, driven continuously) and fillEffects (vehicle.sowingMachine.fillEffects: fill effect), plus animationNodes and sounds (airBlower fan on turn-on, work sound). Effect classes are absent from the dump: rendering UNVERIFIED. TRIGGERING: onUpdate (client only: the subscription is removed off-client) starts the effects with the forced material fill type of the fill unit (getFillUnitForcedMaterialFillType, so the displayed seed type, not the fruit) as long as spec.isProcessing is true, otherwise stops them, every frame. isProcessing is set in processSowingMachineArea, after all the guards: speed > 0.5 (isWorking), seeder turned on (or activation not required), seeds available (or AI buying seeds), plantable fruit (type having a terrain map AND a valid planting period, except getCanPlantOutsideSeason), water sowing consistent with water (isInWater), and client distance <= SowingMachine.CLIENT_DM_UPDATE_RADIUS (constant not defined here: UNVERIFIED). A client receives NO effect state over the network: it recomputes isProcessing locally, so a client's sowing effects depend on its own execution of processSowingMachineArea, and a distant seeder does not emit (early return before isProcessing). The fillEffects are driven by onFillUnitFillLevelChanged (client): started if the unit contains something, with the forced type or the received type, stopped if empty. No growth stage or width is passed to the effects. TERRAIN: FSDensityMapUtil.updateSowingArea (conventional sowing) or updateDirectSowingArea (direct sowing) with fruit, target field ground type, ridge option and row angle (angle of the tool direction, rounded to the fruit's directionSnapAngle if non-zero); bodies absent from the dump: consequences UNVERIFIED. eraseTireTrack is called after the guards. Crop check: fruitTypeDesc.seedRequiredFieldType (rice) compared with FSDensityMapUtil.getFieldTypeAtWorldPos. SEASON: getIsPlantableInPeriod(growthMode, environment.currentPeriod) (calendar period), NO reading of weather, rain or soil moisture. CONSUMPTION: server, at the end of the pass, seedUsagePerSqm * area * seedUsageScale (increased by vehicle damage) subtracted from the fill unit or the consumable, or charged to the AI if seeds are bought. dt: only for the sown time (sownTime statistic). NETWORK: only the seed index is synchronized (initial stream, SetSeedIndexEvent); the effects are not. Warning: onStateChange tests `... or VehicleStateChange.FILLTYPE_CHANGE`, an always-true expression (SowingMachine.lua:1131): the seed sources update therefore runs on every state change (not verified in game). The `updateCultivatorEnabledState` called by this file is discussed in Cultivator. EXTENSION POINTS: functions setSeedIndex, changeSeedIndex, setSeedFruitType, getIsSeedChangeAllowed, getSowingMachineFillUnitIndex, getSowingMachineSeedFillTypeIndex, getCurrentSeedTypeIcon, processSowingMachineArea, updateMissionSowingWarning, getUseSowingMachineAIRequirements, setFillTypeSourceDisplayFillType, getCanPlantOutsideSeason, getSowingMachineCanConsume, getAllowFillFromAir, getDirectionSnapAngle; overrides addFillUnitFillLevel, getFillUnitAllowsFillType, getCanBeTurnedOn, getCanToggleTurnedOn, doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML (SOWINGMACHINE type), getCanAIImplementContinueWork; events onTurnedOn/Off, onStart/EndWorkAreaProcessing, onFillUnitFillLevelChanged, onChangedFillType, onStateChange. Default speed limit: 15.
---@class SowingMachine
SowingMachine = {}

--- Declares the sowingMachine area type and the XML schema: effects, fillEffects, animationNodes, seeds (categories or types), direct/water/ridge sowing, fill unit, consumable, usage. Not re-read key by key.
function SowingMachine.initSpecialization() end

--- Requires FillUnit, WorkArea and TurnOnVehicle.
---@param specializations any
function SowingMachine.prerequisitesPresent(specializations) end

--- Registers the functions for seed management, area processing, mission warning, AI requirements and consumption (list not re-read line by line).
---@param vehicleType any
function SowingMachine.registerFunctions(vehicleType) end

--- Overrides addFillUnitFillLevel, getFillUnitAllowsFillType, getCanBeTurnedOn, getCanToggleTurnedOn, doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML, getCanAIImplementContinueWork and others (list not re-read line by line).
---@param vehicleType any
function SowingMachine.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostLoad, onDelete, initial stream, onUpdate, onUpdateTick, onRegisterActionEvents, onTurnedOn/Off, onStart/EndWorkAreaProcessing, onDeactivate, onStateChange, onChangedFillType, onFillUnitFillLevelChanged and onAIFieldCourseSettingsInitialized.
---@param vehicleType any
function SowingMachine.registerEventListeners(vehicleType) end

--- Loads sounds, animations and effects (client), reads the sowable fruits, the seed type, the required activation (false by default), direct/water/ridge sowing, the fill unit, the consumable and the usage scale; selects the default seed or the savegame one; removes onUpdate/onUpdateTick off-client; enables needWaterInfo.
---@param savegame any
function SowingMachine:onLoad(savegame) end

--- Computes the initial AI parameters.
---@param savegame any
function SowingMachine:onPostLoad(savegame) end

--- Frees sounds, animations and effects (client: sounds, effects, fillEffects, animations).
function SowingMachine:onDelete() end

--- Saves the selected seed and the permission to change seed.
---@param xmlFile any
---@param key any
---@param usedModNames any
function SowingMachine:saveToXMLFile(xmlFile, key, usedModNames) end

--- Reads the seed index on join and applies it without sending an event back.
---@param streamId any
---@param connection any
function SowingMachine:onReadStream(streamId, connection) end

--- Writes the current seed index.
---@param streamId any
---@param connection any
function SowingMachine:onWriteStream(streamId, connection) end

--- Client: starts the sowing effects with the forced material type of the fill unit as long as isProcessing is true (if this type is known), otherwise stops them. Runs every frame, with no throttling.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function SowingMachine:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client: enables/disables the seed change action and shows the blinking warnings (non-plantable fruit, wrong mission seed, wrong period, water required/forbidden, field type).
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function SowingMachine:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Chooses the seed (clamped), sends SetSeedIndexEvent, updates the displayed type of the fill unit and of the sources, the AI requirements and the action text.
---@param seedIndex any
---@param noEventSend any
function SowingMachine:setSeedIndex(seedIndex, noEventSend) end

--- Moves to the next or previous seed in a circular way.
---@param increment any
function SowingMachine:changeSeedIndex(increment) end

--- Selects the seed matching a fruit index.
---@param fruitType any
---@param noEventSend any
function SowingMachine:setSeedFruitType(fruitType, noEventSend) end

--- Returns allowsSeedChanging.
function SowingMachine:getIsSeedChangeAllowed() end

--- Returns the index of the seed fill unit.
function SowingMachine:getSowingMachineFillUnitIndex() end

--- Returns the fill type matching the current seed.
function SowingMachine:getSowingMachineSeedFillTypeIndex() end

--- Returns the HUD icon file of the current seed fill type (nil if unknown).
function SowingMachine:getCurrentSeedTypeIcon() end

--- Core of sowing: applies the guards (water, activation, seeds, plantable fruit, field type), erases tire tracks, sets isProcessing (drives the effects) and calls conventional or direct sowing in the density map; reads stone presence and prepares the mission warning. Returns modified and total area.
---@param workArea any
---@param dt any
function SowingMachine:processSowingMachineArea(workArea, dt) end

--- Reports a wrong fruit if the seeder works on a field of an unleased sowing mission.
---@param x any
---@param z any
function SowingMachine:updateMissionSowingWarning(x, z) end

--- True if the AI must turn the seeder on or if it is turned on.
function SowingMachine:getUseSowingMachineAIRequirements() end

--- Updates the fill type displayed on the seed source vehicles (trailers) for the selected seed.
---@param fillType any
function SowingMachine:setFillTypeSourceDisplayFillType(fillType) end

--- Asks to display "fill first" when the seeder is selected and empty.
---@param superFunc any
function SowingMachine:getDrawFirstFillText(superFunc) end

--- Forbids controlled actions while a seeder with mandatory filling is empty.
---@param superFunc any
---@return boolean
---@return string
function SowingMachine:getAreControlledActionsAllowed(superFunc) end

--- Accepts the configured seed type or the type already in the unit.
---@param superFunc any
---@param fillUnitIndex any
---@param fillType any
function SowingMachine:getFillUnitAllowsFillType(superFunc, fillUnitIndex, fillType) end

--- Refuses turning on if needsActivation is false.
---@param superFunc any
function SowingMachine:getCanBeTurnedOn(superFunc) end

--- Refuses manual toggling if needsActivation is false.
---@param superFunc any
function SowingMachine:getCanToggleTurnedOn(superFunc) end

--- Returns false; override point to ignore the planting period.
function SowingMachine:getCanPlantOutsideSeason() end

--- Tells whether the seeder has something to consume (consumable available or level > 0).
function SowingMachine:getSowingMachineCanConsume() end

--- Forbids filling from the air when turned on if the allowFillFromAirWhileTurnedOn option is false.
---@param superFunc any
function SowingMachine:getAllowFillFromAir(superFunc) end

--- Takes the larger of the snap angle of the current fruit and of the parent.
---@param superFunc any
function SowingMachine:getDirectionSnapAngle(superFunc) end

--- Forces the seed type of the fill unit (forced material) before adding the quantity; this forced type is what onUpdate reads for the effects.
---@param superFunc any
---@param farmId any
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillInfo any
function SowingMachine:addFillUnitFillLevel(superFunc, farmId, fillUnitIndex, fillLevelDelta, fillType, toolType, fillInfo) end

--- Applies the speed limit when the tool chain is lowered and, if activation is required, when the tool is turned on.
---@param superFunc any
function SowingMachine:doCheckSpeedLimit(superFunc) end

--- Adds the work dirt (forward driving, isWorking, turned on if required) weighted by speed.
---@param superFunc any
function SowingMachine:getDirtMultiplier(superFunc) end

--- Same for wear, with a stone factor.
---@param superFunc any
---@return number
function SowingMachine:getWearMultiplier(superFunc) end

--- Forces the SOWINGMACHINE area type if DEFAULT.
---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function SowingMachine:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Returns true: the tool is selectable.
---@param superFunc any
function SowingMachine:getCanBeSelected(superFunc) end

--- The AI stops if the seed is not plantable in the current period (unless out-of-season planting is allowed).
---@param superFunc any
---@param isTurning any
function SowingMachine:getCanAIImplementContinueWork(superFunc, isTurning) end

--- Registers the seed change actions (next/previous) if there are several seeds.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function SowingMachine:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Updates the text of the seed choice action with the name of the current fill type.
---@param self any
function SowingMachine.updateChooseSeedActionEvent(self) end

--- Client: starts the fan and the animations; server: turns on the seed source vehicles; recomputes the AI requirements.
function SowingMachine:onTurnedOn() end

--- Symmetric: stops fan and animations, turns off the sources, recomputes the AI requirements.
function SowingMachine:onTurnedOff() end

--- Before the pass: isWorking/isProcessing = false; chooses the seed source vehicle, computes the row angle, the plantable fruit, the planting period (calendar) and the warnings, and fills workAreaParameters.
---@param dt any
function SowingMachine:onStartWorkAreaProcessing(dt) end

--- Server: computes seed consumption (or the AI bill), updates statistics and area; client: starts/stops the work sound depending on isWorking.
---@param dt any
---@param hasProcessed any
function SowingMachine:onEndWorkAreaProcessing(dt, hasProcessed) end

--- Stops the work and fan sounds.
function SowingMachine:onDeactivate() end

--- Rebuilds the seed sources and the displayed type on every state change (always-true condition, see module).
---@param state any
---@param data any
function SowingMachine:onStateChange(state, data) end

--- Passes the new fill type to the animations.
---@param fillUnitIndex any
---@param fillTypeIndex any
---@param oldFillTypeIndex any
function SowingMachine:onChangedFillType(fillUnitIndex, fillTypeIndex, oldFillTypeIndex) end

--- Client: starts the fillEffects (with the forced or received type) if the unit contains something, otherwise stops them.
---@param fillUnitIndex integer
---@param fillLevelDelta number
---@param fillTypeIndex integer
---@param toolType integer
---@param fillPositionData table?
---@param appliedDelta number
function SowingMachine:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData, appliedDelta) end

--- For PLANTED type sowing: headlands first and initial segment worked.
---@param fieldCourseSettings any
function SowingMachine:onAIFieldCourseSettingsInitialized(fieldCourseSettings) end

--- Recomputes the AI requirements (required or excluded ground types, crops) depending on the seed, the presence of a source and the turned-on state (lines 1192-1270 not re-read in detail).
---@param self any
function SowingMachine.updateAiParameters(self) end

--- Default speed limit: 15.
function SowingMachine.getDefaultSpeedLimit() end

--- Input callback: next seed.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function SowingMachine.actionEventToggleSeedType(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: previous seed.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function SowingMachine.actionEventToggleSeedTypeBack(self, actionName, inputValue, callbackState, isAnalog) end

--- Reads for the shop the seed types of a seeder from its XML.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function SowingMachine.loadSpecValueSeedFillTypes(xmlFile, customEnvironment, baseDir) end

--- Formats the list of seed types for the shop.
---@param storeItem any
---@param realItem any
function SowingMachine.getSpecValueSeedFillTypes(storeItem, realItem) end
