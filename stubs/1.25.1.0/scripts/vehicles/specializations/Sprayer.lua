---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Sprayer.lua (generated stub, FS25 Lua Atlas)

--- Specialization for sprayers, manure spreaders and slurry tankers (prerequisites: FillUnit, WorkArea, TurnOnVehicle). It does two things: (a) on the server (and on the nearby client), the agronomic processing: processSprayerArea calls FSDensityMapUtil.updateSprayArea on the work area, onEndWorkAreaProcessing consumes the liquid (addFillUnitFillLevel) and updates the farm statistics; (b) on the client, the visual and sound effects. EFFECTS: spec.effects (XML key vehicle.sprayer.effects) and, for each "sprayType" (vehicle.sprayer.sprayTypes.sprayType(?), chosen from the fill type), its own effects, animationNodes, sounds and animations, all loaded by g_effectManager:loadEffect (EffectManager is absent from the dump: internal behaviour UNVERIFIED). Switch-on condition: getAreEffectsVisible, true as long as workAreaParameters.lastSprayTime + 100 ms > g_time; lastSprayTime is only updated in processSprayerArea, so when a work area actually processes with a fill level > 0 (on a client, only if currentUpdateDistance <= Sprayer.CLIENT_DM_UPDATE_RADIUS, a constant not defined in this file: value UNVERIFIED). updateSprayerEffects (called by onTurnedOn, onTurnedOff, onEndWorkAreaProcessing, sprayType changes and variable-width section changes) starts or stops the effects, passing the fill type through setEffectTypeInfo; it is a binary toggle, with no modulation of intensity, boom width or wind in this file. WEATHER/MOISTURE DATA: none (neither wind, rain nor moisture are read). Other data used: tank fillType, speed (isWorking if getLastSpeed() > 1), on/lowered state, working width (usageScales). Network: the server decides consumption; the "doubled amount" state is synchronized by SprayerDoubledAmountEvent; switching on goes through TurnOnVehicle; there is no dirty flag or stream reading in this file. Extension points for a modder: registered functions getAreEffectsVisible, updateSprayerEffects, getSprayerUsage, getActiveSprayType, getIsSprayTypeActive, getSprayerFillUnitIndex, getExternalFill, getIsSprayerExternallyFilled, setSprayerDoubledAmountActive, getSprayerDoubledAmountActive, processSprayerArea, loadSprayTypeFromXML; registered event onSprayTypeChange; functions overridden (via registerOverwrittenFunction) getEffectByNode, getRawSpeedLimit, doCheckSpeedLimit, getCanBeTurnedOn, getIsWorkAreaActive, getDirtMultiplier, getWearMultiplier, getFillVolumeUVScrollSpeed, getVariableWorkWidthUsage, etc. Overriding getAreEffectsVisible is the most direct way to drive the vanilla effects' switch-on without touching the spraying logic. Default speed limit: 15 (Sprayer.getDefaultSpeedLimit).
---@class Sprayer
Sprayer = {}

--- Registers in the vehicle XML schema all the vehicle.sprayer keys (usageScales, sprayTypes with fillTypes, effects, animations, sounds, own usageScales and objectChanges, doubledAmount, turnedAnimation, fillUnitIndex, fillVolumeIndex, effects, animationNodes, sounds) as well as the #sprayType attribute of the work areas. Not reread key by key.
function Sprayer.initSpecialization() end

--- Requires FillUnit, WorkArea and TurnOnVehicle.
---@param specializations any
function Sprayer.prerequisitesPresent(specializations) end

--- Declares the onSprayTypeChange event.
---@param vehicleType any
function Sprayer.registerEvents(vehicleType) end

--- Exposes to the vehicle type processSprayerArea, getIsSprayerExternallyFilled, getExternalFill, getAreEffectsVisible, updateSprayerEffects, getSprayerUsage, getUseSprayerAIRequirements, setSprayerAITerrainDetailProhibitedRange, getSprayerFillUnitIndex, loadSprayTypeFromXML, getActiveSprayType, getIsSprayTypeActive, setSprayerDoubledAmountActive and getSprayerDoubledAmountActive.
---@param vehicleType any
function Sprayer.registerFunctions(vehicleType) end

--- Overrides getDrawFirstFillText, getAreControlledActionsAllowed, getCanToggleTurnedOn, getCanBeTurnedOn, loadWorkAreaFromXML, getIsWorkAreaActive, doCheckSpeedLimit, getRawSpeedLimit, getFillVolumeUVScrollSpeed, getAIRequiresTurnOffOnHeadland, getDirtMultiplier, getWearMultiplier, getEffectByNode, getVariableWorkWidthUsage and getAIImplementUseVineSegment.
---@param vehicleType any
function Sprayer.registerOverwrittenFunctions(vehicleType) end

--- Listens to onLoad, onDelete, onUpdateTick, onRegisterActionEvents, onTurnedOn, onTurnedOff, onPreDetach, onStartWorkAreaProcessing, onEndWorkAreaProcessing, onStateChange, onSetLowered, onFillUnitFillLevelChanged, onSprayTypeChange, onAIImplementEnd and onVariableWorkWidthSectionChanged.
---@param vehicleType any
function Sprayer.registerEventListeners(vehicleType) end

--- Reads the base parameters (allowsSpraying, activateOnLowering, activateTankOnLowering, usageScales per fill type, default working width 12 m, sprayTypes, doubledAmount with reduced speed or a 0.5 factor, animations, fill unit/volume indexes). On the client, loads the effects (vehicle.sprayer.effects), sounds and animationNodes. Determines the profile: slurry/digestate tanker, manure spreader or fertilizer sprayer. Fails (load state ERROR) if the fill unit is missing. Initializes workAreaParameters. Removes the "doubled amount" action if there is no work area.
---@param savegame any
function Sprayer:onLoad(savegame) end

--- Deletes the effects, animations and sound samples of the sprayer and of each of its sprayTypes.
function Sprayer:onDelete() end

--- Detects a change of the active sprayType: stops the old one's effects, raises onSprayTypeChange and forces updateSprayerEffects(true). On the client, updates the text and activation of the "doubled amount" action. On the server, switches the implement on if an activation was pending after lowering.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Sprayer:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- On the client, registers the doubled-amount input action (by default InputAction.DOUBLED_SPRAY_AMOUNT) when the vehicle is active for input.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Sprayer:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Input action callback: toggles the "doubled amount" state.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Sprayer.actionEventDoubledAmount(self, actionName, inputValue, callbackState, isAnalog) end

--- Processing of one work area: returns without doing anything if the tank is empty, if the AI has no fill type (it then stops its work) or if, on a client, the vehicle is beyond CLIENT_DM_UPDATE_RADIUS. Otherwise calls FSDensityMapUtil.updateSprayArea (start/width/height corners of the area, spray type, factor 1 or 2), accumulates the areas, updates lastSprayTime (which turns the effects on) and sets isWorking to true if the speed exceeds 1.
---@param workArea any
---@param dt any
function Sprayer:processSprayerArea(workArea, dt) end

--- Returns true only when the AI is active in field work with an external source allowed by the helper settings (slurry, manure, fertilizer purchase); returns false outside the AI.
function Sprayer:getIsSprayerExternallyFilled() end

--- Determines, for the AI, the fill type and consumption supplied by purchase or by a loading station according to the missionInfo settings (helperSlurrySource, helperManureSource, helperBuyFertilizer); on the server, debits the account or the station (price x 1.5) and the expense statistics. Returns (FillType.UNKNOWN, 0) if nothing is found.
---@param fillType any
---@param dt any
function Sprayer:getExternalFill(fillType, dt) end

--- True if lastSprayTime + 100 ms > g_time: this is the condition that turns the spraying effects on. Key function for a mod that wants to replace or complement the emission.
function Sprayer:getAreEffectsVisible() end

--- Compares the wanted effects state (getAreEffectsVisible) with the previous one (or forces). On switch-on: determines the fillType (last valid one in the tank, else the first supported), sends it to g_effectManager:setEffectTypeInfo then startEffects for the base effects and those of the active sprayType, starts sounds and animations. On stop: stops the effects, animations and sounds of the base and of all sprayTypes. No wind or weather data.
---@param force any
function Sprayer:updateSprayerEffects(force) end

--- Consumption over dt (ms): scale (per fill type or default) x litersPerSecond of the spray type (1 by default) x self.speedLimit x working width (work area or default value) x dt x 0.001. So it uses the speed limit and not the actual speed.
---@param fillType any
---@param dt any
function Sprayer:getSprayerUsage(fillType, dt) end

--- Returns true: the AI applies the sprayer's field requirements.
function Sprayer:getUseSprayerAIRequirements() end

--- Updates the AI terrain restrictions: depending on the active fill type, calls setSprayerAITerrainDetailProhibitedRange, otherwise restores the default requirements (Sprayer.AI_REQUIRED_GROUND_TYPES).
---@param self any
function Sprayer.updateAiParameters(self) end

--- Rebuilds the AI requirements and prohibitions (density maps) according to the spray type: herbicide (target weeds), fertilizer (forbid pixels already at maximum level or of the same type) or lime (forbid the same type), and forbids crops that reached maturity (except grass).
---@param fillType any
function Sprayer:setSprayerAITerrainDetailProhibitedRange(fillType) end

--- Fill unit index: that of the active sprayType if there is one, otherwise that of the specialization.
function Sprayer:getSprayerFillUnitIndex() end

--- Loads a sprayType: fill unit, volume, variable width support, sounds, effects (g_effectManager:loadEffect), animationNodes, rotation animation, list of trigger fillTypes, objectChanges, usage scales and AI settings.
---@param xmlFile any
---@param key any
---@param sprayType any
function Sprayer:loadSprayTypeFromXML(xmlFile, key, sprayType) end

--- Returns the first sprayType for which getIsSprayTypeActive is true, otherwise nil.
function Sprayer:getActiveSprayType() end

--- True if the sprayType has no fillTypes list, or if the current fill type of its fill unit is in that list.
---@param sprayType any
function Sprayer:getIsSprayTypeActive(sprayType) end

--- Changes the "doubled amount" state and sends SprayerDoubledAmountEvent (network sync) if the state changes.
---@param isActive any
---@param noEventSend any
function Sprayer:setSprayerDoubledAmountActive(isActive, noEventSend) end

--- Returns (active, allowed). Allowed only for manure, slurry and digestate (or a fertilizer spray type); never for a fertilizer sprayer (isFertilizerSprayer).
---@param sprayTypeIndex any
function Sprayer:getSprayerDoubledAmountActive(sprayTypeIndex) end

--- Shows the "fill the tool first" prompt when the sprayer is selected, empty and cannot be turned on.
---@param superFunc any
function Sprayer:getDrawFirstFillText(superFunc) end

--- Refuses controlled actions (AVC) if the tank is empty (with the info_firstFillTheTool message).
---@param superFunc any
---@return boolean
---@return string
function Sprayer:getAreControlledActionsAllowed(superFunc) end

--- On the client, forbids toggling if the implement cannot be turned on and has no tank.
---@param superFunc any
function Sprayer:getCanToggleTurnedOn(superFunc) end

--- Refuses switch-on if allowsSpraying is false or if neither the tank nor a reachable fill source contains liquid (outside the AI).
---@param superFunc any
function Sprayer:getCanBeTurnedOn(superFunc) end

--- After the original function, converts a default area type to WorkAreaType.SPRAYER and reads the area's #sprayType.
---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function Sprayer:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Disables the work area if it is bound to a sprayType that is not active.
---@param superFunc any
---@param workArea any
function Sprayer:getIsWorkAreaActive(superFunc, workArea) end

--- The speed limit also applies when the implement is turned on (useSpeedLimit).
---@param superFunc any
function Sprayer:doCheckSpeedLimit(superFunc) end

--- When doubled amount is active and the implement is on, returns the reduced speed limit doubledAmountSpeed.
---@param superFunc any
function Sprayer:getRawSpeedLimit(superFunc) end

--- Scrolls the fill volume UVs (draining effect in the tank) when the implement is on and not supplied externally.
---@param superFunc any
---@param fillVolumeIndex any
function Sprayer:getFillVolumeUVScrollSpeed(superFunc, fillVolumeIndex) end

--- Always returns true: the AI turns the implement off at the headland.
---@param superFunc any
function Sprayer:getAIRequiresTurnOffOnHeadland(superFunc) end

--- Adds to the dirt the work multiplier x (speed / speed limit) while isWorking is true.
---@param superFunc any
function Sprayer:getDirtMultiplier(superFunc) end

--- Adds to the wear the work multiplier x (speed / speed limit) while isWorking is true.
---@param superFunc any
function Sprayer:getWearMultiplier(superFunc) end

--- Looks up the effect matching a node in the base effects then in those of the sprayTypes, otherwise delegates to the original function.
---@param superFunc integer
---@param node integer
function Sprayer:getEffectByNode(superFunc, node) end

--- Returns the per-minute consumption (usagePerMin) when the original function gives none and the implement is on, otherwise 0.
---@param superFunc any
---@return number
function Sprayer:getVariableWorkWidthUsage(superFunc) end

--- For AI in vineyards: true if more than 10 % of the segment side's area is covered by the implement.
---@param superFunc any
---@param placeable any
---@param segment any
---@param segmentSide any
function Sprayer:getAIImplementUseVineSegment(superFunc, placeable, segment, segmentSide) end

--- Client side: updates the effects, plays the implement animation and the work sounds, and the "turned" animations of the sprayType and the base (except external supply if configured).
function Sprayer:onTurnedOn() end

--- Client side: updates the effects, stops the animation and the work sounds, and plays the stop animations.
function Sprayer:onTurnedOff() end

--- Before detaching, turns off the carrying vehicle if it is on.
---@param attacherVehicle any
---@param jointDescIndex any
function Sprayer:onPreDetach(attacherVehicle, jointDescIndex) end

--- Before the areas are processed: picks the liquid source (own tank or an attached source), computes fillType, consumption and available level, applies the AI's external supply, syncs the animations, and fills workAreaParameters (sprayType, sprayFillType, sprayFillLevel, usage, usagePerMin). Resets isWorking to false.
---@param dt any
function Sprayer:onStartWorkAreaProcessing(dt) end

--- On the server, if an area worked: debits the source (addFillUnitFillLevel), updates sprayedHectares, sprayedTime, sprayUsage and the last worked area. In all cases (client included) then calls updateSprayerEffects.
---@param dt any
---@param hasProcessed any
function Sprayer:onEndWorkAreaProcessing(dt, hasProcessed) end

--- On attach, detach or fill type change: rebuilds the list of supported types and fill sources (FillUnit.addFillTypeSources from the root vehicle).
---@param state any
---@param data any
function Sprayer:onStateChange(state, data) end

--- On the server, turns the implement on when lowered if activateOnLowering (or sets the activation pending). Also turns source tanks on/off if activateTankOnLowering.
---@param isLowered any
function Sprayer:onSetLowered(isLowered) end

--- If the tank drops to 0 while the implement is on (outside the AI) and no valid source of the same type exists, turns the implement off and replays the controlled actions if AVC is available.
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function Sprayer:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

--- Applies the objectChanges of the active sprayType and sets the activation of the variable working width.
---@param activeSprayType any
function Sprayer:onSprayTypeChange(activeSprayType) end

--- At the end of AI work, turns off all the fill sources that are on.
function Sprayer:onAIImplementEnd() end

--- Forces the effects update when a variable-width section changes.
function Sprayer:onVariableWorkWidthSectionChanged() end

--- Default speed limit: 15.
function Sprayer.getDefaultSpeedLimit() end
