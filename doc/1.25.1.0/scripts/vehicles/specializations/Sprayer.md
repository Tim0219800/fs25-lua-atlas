# vehicles/specializations/Sprayer.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Sprayer.md)*

Source: `dataS/scripts/vehicles/specializations/Sprayer.lua` — FS25 1.25.1.0

✍ Specialization for sprayers, manure spreaders and slurry tankers (prerequisites: FillUnit, WorkArea, TurnOnVehicle). It does two things: (a) on the server (and on the nearby client), the agronomic processing: processSprayerArea calls FSDensityMapUtil.updateSprayArea on the work area, onEndWorkAreaProcessing consumes the liquid (addFillUnitFillLevel) and updates the farm statistics; (b) on the client, the visual and sound effects. EFFECTS: spec.effects (XML key vehicle.sprayer.effects) and, for each "sprayType" (vehicle.sprayer.sprayTypes.sprayType(?), chosen from the fill type), its own effects, animationNodes, sounds and animations, all loaded by g_effectManager:loadEffect (EffectManager is absent from the dump: internal behaviour UNVERIFIED). Switch-on condition: getAreEffectsVisible, true as long as workAreaParameters.lastSprayTime + 100 ms > g_time; lastSprayTime is only updated in processSprayerArea, so when a work area actually processes with a fill level > 0 (on a client, only if currentUpdateDistance <= Sprayer.CLIENT_DM_UPDATE_RADIUS, a constant not defined in this file: value UNVERIFIED). updateSprayerEffects (called by onTurnedOn, onTurnedOff, onEndWorkAreaProcessing, sprayType changes and variable-width section changes) starts or stops the effects, passing the fill type through setEffectTypeInfo; it is a binary toggle, with no modulation of intensity, boom width or wind in this file. WEATHER/MOISTURE DATA: none (neither wind, rain nor moisture are read). Other data used: tank fillType, speed (isWorking if getLastSpeed() > 1), on/lowered state, working width (usageScales). Network: the server decides consumption; the "doubled amount" state is synchronized by SprayerDoubledAmountEvent; switching on goes through TurnOnVehicle; there is no dirty flag or stream reading in this file. Extension points for a modder: registered functions getAreEffectsVisible, updateSprayerEffects, getSprayerUsage, getActiveSprayType, getIsSprayTypeActive, getSprayerFillUnitIndex, getExternalFill, getIsSprayerExternallyFilled, setSprayerDoubledAmountActive, getSprayerDoubledAmountActive, processSprayerArea, loadSprayTypeFromXML; registered event onSprayTypeChange; functions overridden (via registerOverwrittenFunction) getEffectByNode, getRawSpeedLimit, doCheckSpeedLimit, getCanBeTurnedOn, getIsWorkAreaActive, getDirtMultiplier, getWearMultiplier, getFillVolumeUVScrollSpeed, getVariableWorkWidthUsage, etc. Overriding getAreEffectsVisible is the most direct way to drive the vanilla effects' switch-on without touching the spraying logic. Default speed limit: 15 (Sprayer.getDefaultSpeedLimit).

- **Sprayer** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `Sprayer.initSpecialization()` | 37 | ✍ Registers in the vehicle XML schema all the vehicle.sprayer keys (usageScales, sprayTypes with fillTypes, effects, animations, sounds, own usageScales and objectChanges, doubledAmount, turnedAnimation, fillUnitIndex, fillVolumeIndex, effects, animationNodes, sounds) as well as the #sprayType attribute of the work areas. Not reread key by key. |
| `Sprayer.prerequisitesPresent(specializations: any)` | 109 | ✍ Requires FillUnit, WorkArea and TurnOnVehicle. |
| `Sprayer.registerEvents(vehicleType: any)` | 117 | ✍ Declares the onSprayTypeChange event. |
| `Sprayer.registerFunctions(vehicleType: any)` | 123 | ✍ Exposes to the vehicle type processSprayerArea, getIsSprayerExternallyFilled, getExternalFill, getAreEffectsVisible, updateSprayerEffects, getSprayerUsage, getUseSprayerAIRequirements, setSprayerAITerrainDetailProhibitedRange, getSprayerFillUnitIndex, loadSprayTypeFromXML, getActiveSprayType, getIsSprayTypeActive, setSprayerDoubledAmountActive and getSprayerDoubledAmountActive. |
| `Sprayer.registerOverwrittenFunctions(vehicleType: any)` | 142 | ✍ Overrides getDrawFirstFillText, getAreControlledActionsAllowed, getCanToggleTurnedOn, getCanBeTurnedOn, loadWorkAreaFromXML, getIsWorkAreaActive, doCheckSpeedLimit, getRawSpeedLimit, getFillVolumeUVScrollSpeed, getAIRequiresTurnOffOnHeadland, getDirtMultiplier, getWearMultiplier, getEffectByNode, getVariableWorkWidthUsage and getAIImplementUseVineSegment. |
| `Sprayer.registerEventListeners(vehicleType: any)` | 162 | ✍ Listens to onLoad, onDelete, onUpdateTick, onRegisterActionEvents, onTurnedOn, onTurnedOff, onPreDetach, onStartWorkAreaProcessing, onEndWorkAreaProcessing, onStateChange, onSetLowered, onFillUnitFillLevelChanged, onSprayTypeChange, onAIImplementEnd and onVariableWorkWidthSectionChanged. |
| `Sprayer:onLoad(savegame: any)` | 182 | ✍ Reads the base parameters (allowsSpraying, activateOnLowering, activateTankOnLowering, usageScales per fill type, default working width 12 m, sprayTypes, doubledAmount with reduced speed or a 0.5 factor, animations, fill unit/volume indexes). On the client, loads the effects (vehicle.sprayer.effects), sounds and animationNodes. Determines the profile: slurry/digestate tanker, manure spreader or fertilizer sprayer. Fails (load state ERROR) if the fill unit is missing. Initializes workAreaParameters. Removes the "doubled amount" action if there is no work area. |
| `Sprayer:onDelete()` | 319 | ✍ Deletes the effects, animations and sound samples of the sprayer and of each of its sprayTypes. |
| `Sprayer:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 344 | ✍ Detects a change of the active sprayType: stops the old one's effects, raises onSprayTypeChange and forces updateSprayerEffects(true). On the client, updates the text and activation of the "doubled amount" action. On the server, switches the implement on if an activation was pending after lowering. |
| `Sprayer:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 393 | ✍ On the client, registers the doubled-amount input action (by default InputAction.DOUBLED_SPRAY_AMOUNT) when the vehicle is active for input. |
| `Sprayer.actionEventDoubledAmount(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 406 | ✍ Input action callback: toggles the "doubled amount" state. |
| `Sprayer:processSprayerArea(workArea: any, dt: any)` | 412 | ✍ Processing of one work area: returns without doing anything if the tank is empty, if the AI has no fill type (it then stops its work) or if, on a client, the vehicle is beyond CLIENT_DM_UPDATE_RADIUS. Otherwise calls FSDensityMapUtil.updateSprayArea (start/width/height corners of the area, spray type, factor 1 or 2), accumulates the areas, updates lastSprayTime (which turns the effects on) and sets isWorking to true if the speed exceeds 1. |
| `Sprayer:getIsSprayerExternallyFilled()` | 454 | ✍ Returns true only when the AI is active in field work with an external source allowed by the helper settings (slurry, manure, fertilizer purchase); returns false outside the AI. |
| `Sprayer:getExternalFill(fillType: any, dt: any)` | 488 | ✍ Determines, for the AI, the fill type and consumption supplied by purchase or by a loading station according to the missionInfo settings (helperSlurrySource, helperManureSource, helperBuyFertilizer); on the server, debits the account or the station (price x 1.5) and the expense statistics. Returns (FillType.UNKNOWN, 0) if nothing is found. |
| `Sprayer:getAreEffectsVisible()` | 593 | ✍ True if lastSprayTime + 100 ms > g_time: this is the condition that turns the spraying effects on. Key function for a mod that wants to replace or complement the emission. |
| `Sprayer:updateSprayerEffects(force: any)` | 599 | ✍ Compares the wanted effects state (getAreEffectsVisible) with the previous one (or forces). On switch-on: determines the fillType (last valid one in the tank, else the first supported), sends it to g_effectManager:setEffectTypeInfo then startEffects for the base effects and those of the active sprayType, starts sounds and animations. On stop: stops the effects, animations and sounds of the base and of all sprayTypes. No wind or weather data. |
| `Sprayer:getSprayerUsage(fillType: any, dt: any)` | 648 | ✍ Consumption over dt (ms): scale (per fill type or default) x litersPerSecond of the spray type (1 by default) x self.speedLimit x working width (work area or default value) x dt x 0.001. So it uses the speed limit and not the actual speed. |
| `Sprayer:getUseSprayerAIRequirements()` | 681 | ✍ Returns true: the AI applies the sprayer's field requirements. |
| `Sprayer.updateAiParameters(self: any)` | 687 | ✍ Updates the AI terrain restrictions: depending on the active fill type, calls setSprayerAITerrainDetailProhibitedRange, otherwise restores the default requirements (Sprayer.AI_REQUIRED_GROUND_TYPES). |
| `Sprayer:setSprayerAITerrainDetailProhibitedRange(fillType: any)` | 709 | ✍ Rebuilds the AI requirements and prohibitions (density maps) according to the spray type: herbicide (target weeds), fertilizer (forbid pixels already at maximum level or of the same type) or lime (forbid the same type), and forbids crops that reached maturity (except grass). |
| `Sprayer:getSprayerFillUnitIndex()` | 778 | ✍ Fill unit index: that of the active sprayType if there is one, otherwise that of the specialization. |
| `Sprayer:loadSprayTypeFromXML(xmlFile: any, key: any, sprayType: any)` | 789 | ✍ Loads a sprayType: fill unit, volume, variable width support, sounds, effects (g_effectManager:loadEffect), animationNodes, rotation animation, list of trigger fillTypes, objectChanges, usage scales and AI settings. |
| `Sprayer:getActiveSprayType()` | 838 | ✍ Returns the first sprayType for which getIsSprayTypeActive is true, otherwise nil. |
| `Sprayer:getIsSprayTypeActive(sprayType: any)` | 851 | ✍ True if the sprayType has no fillTypes list, or if the current fill type of its fill unit is in that list. |
| `Sprayer:setSprayerDoubledAmountActive(isActive: any, noEventSend: any)` | 872 | ✍ Changes the "doubled amount" state and sends SprayerDoubledAmountEvent (network sync) if the state changes. |
| `Sprayer:getSprayerDoubledAmountActive(sprayTypeIndex: any)` | 883 | ✍ Returns (active, allowed). Allowed only for manure, slurry and digestate (or a fertilizer spray type); never for a fertilizer sprayer (isFertilizerSprayer). |
| `Sprayer:getDrawFirstFillText(superFunc: any)` | 906 | ✍ Shows the "fill the tool first" prompt when the sprayer is selected, empty and cannot be turned on. |
| `Sprayer:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 926 | ✍ Refuses controlled actions (AVC) if the tank is empty (with the info_firstFillTheTool message). |
| `Sprayer:getCanToggleTurnedOn(superFunc: any)` | 940 | ✍ On the client, forbids toggling if the implement cannot be turned on and has no tank. |
| `Sprayer:getCanBeTurnedOn(superFunc: any)` | 955 | ✍ Refuses switch-on if allowsSpraying is false or if neither the tank nor a reachable fill source contains liquid (outside the AI). |
| `Sprayer:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 986 | ✍ After the original function, converts a default area type to WorkAreaType.SPRAYER and reads the area's #sprayType. |
| `Sprayer:getIsWorkAreaActive(superFunc: any, workArea: any)` | 1000 | ✍ Disables the work area if it is bound to a sprayType that is not active. |
| `Sprayer:doCheckSpeedLimit(superFunc: any)` | 1014 | ✍ The speed limit also applies when the implement is turned on (useSpeedLimit). |
| `Sprayer:getRawSpeedLimit(superFunc: any)` | 1020 | ✍ When doubled amount is active and the implement is on, returns the reduced speed limit doubledAmountSpeed. |
| `Sprayer:getFillVolumeUVScrollSpeed(superFunc: any, fillVolumeIndex: any)` | 1036 | ✍ Scrolls the fill volume UVs (draining effect in the tank) when the implement is on and not supplied externally. |
| `Sprayer:getAIRequiresTurnOffOnHeadland(superFunc: any)` | 1058 | ✍ Always returns true: the AI turns the implement off at the headland. |
| `Sprayer:getDirtMultiplier(superFunc: any)` | 1064 | ✍ Adds to the dirt the work multiplier x (speed / speed limit) while isWorking is true. |
| `Sprayer:getWearMultiplier(superFunc: any)` | 1076 | ✍ Adds to the wear the work multiplier x (speed / speed limit) while isWorking is true. |
| `Sprayer:getEffectByNode(superFunc: integer, node: integer)` | 1089 | ✍ Looks up the effect matching a node in the base effects then in those of the sprayTypes, otherwise delegates to the original function. |
| `Sprayer:getVariableWorkWidthUsage(superFunc: any) → number` | 1115 | ✍ Returns the per-minute consumption (usagePerMin) when the original function gives none and the implement is on, otherwise 0. |
| `Sprayer:getAIImplementUseVineSegment(superFunc: any, placeable: any, segment: any, segmentSide: any)` | 1130 | ✍ For AI in vineyards: true if more than 10 % of the segment side's area is covered by the implement. |
| `Sprayer:onTurnedOn()` | 1143 | ✍ Client side: updates the effects, plays the implement animation and the work sounds, and the "turned" animations of the sprayType and the base (except external supply if configured). |
| `Sprayer:onTurnedOff()` | 1171 | ✍ Client side: updates the effects, stops the animation and the work sounds, and plays the stop animations. |
| `Sprayer:onPreDetach(attacherVehicle: any, jointDescIndex: any)` | 1195 | ✍ Before detaching, turns off the carrying vehicle if it is on. |
| `Sprayer:onStartWorkAreaProcessing(dt: any)` | 1203 | ✍ Before the areas are processed: picks the liquid source (own tank or an attached source), computes fillType, consumption and available level, applies the AI's external supply, syncs the animations, and fills workAreaParameters (sprayType, sprayFillType, sprayFillLevel, usage, usagePerMin). Resets isWorking to false. |
| `Sprayer:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 1312 | ✍ On the server, if an area worked: debits the source (addFillUnitFillLevel), updates sprayedHectares, sprayedTime, sprayUsage and the last worked area. In all cases (client included) then calls updateSprayerEffects. |
| `Sprayer:onStateChange(state: any, data: any)` | 1348 | ✍ On attach, detach or fill type change: rebuilds the list of supported types and fill sources (FillUnit.addFillTypeSources from the root vehicle). |
| `Sprayer:onSetLowered(isLowered: any)` | 1372 | ✍ On the server, turns the implement on when lowered if activateOnLowering (or sets the activation pending). Also turns source tanks on/off if activateTankOnLowering. |
| `Sprayer:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 1410 | ✍ If the tank drops to 0 while the implement is on (outside the AI) and no valid source of the same type exists, turns the implement off and replays the controlled actions if AVC is available. |
| `Sprayer:onSprayTypeChange(activeSprayType: any)` | 1444 | ✍ Applies the objectChanges of the active sprayType and sets the activation of the variable working width. |
| `Sprayer:onAIImplementEnd()` | 1457 | ✍ At the end of AI work, turns off all the fill sources that are on. |
| `Sprayer:onVariableWorkWidthSectionChanged()` | 1474 | ✍ Forces the effects update when a variable-width section changes. |
| `Sprayer.getDefaultSpeedLimit()` | 1480 | ✍ Default speed limit: 15. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onSprayTypeChange` | 118 |
| registerFunction | `processSprayerArea` | 124 |
| registerFunction | `getIsSprayerExternallyFilled` | 125 |
| registerFunction | `getExternalFill` | 126 |
| registerFunction | `getAreEffectsVisible` | 127 |
| registerFunction | `updateSprayerEffects` | 128 |
| registerFunction | `getSprayerUsage` | 129 |
| registerFunction | `getUseSprayerAIRequirements` | 130 |
| registerFunction | `setSprayerAITerrainDetailProhibitedRange` | 131 |
| registerFunction | `getSprayerFillUnitIndex` | 132 |
| registerFunction | `loadSprayTypeFromXML` | 133 |
| registerFunction | `getActiveSprayType` | 134 |
| registerFunction | `getIsSprayTypeActive` | 135 |
| registerFunction | `setSprayerDoubledAmountActive` | 136 |
| registerFunction | `getSprayerDoubledAmountActive` | 137 |
| registerOverwrittenFunction | `getDrawFirstFillText` | 143 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 144 |
| registerOverwrittenFunction | `getCanToggleTurnedOn` | 145 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 146 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 147 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 148 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 149 |
| registerOverwrittenFunction | `getRawSpeedLimit` | 150 |
| registerOverwrittenFunction | `getFillVolumeUVScrollSpeed` | 151 |
| registerOverwrittenFunction | `getAIRequiresTurnOffOnHeadland` | 152 |
| registerOverwrittenFunction | `getDirtMultiplier` | 153 |
| registerOverwrittenFunction | `getWearMultiplier` | 154 |
| registerOverwrittenFunction | `getEffectByNode` | 155 |
| registerOverwrittenFunction | `getVariableWorkWidthUsage` | 156 |
| registerOverwrittenFunction | `getAIImplementUseVineSegment` | 157 |
| registerEventListener | `onLoad` | 163 |
| registerEventListener | `onDelete` | 164 |
| registerEventListener | `onUpdateTick` | 165 |
| registerEventListener | `onRegisterActionEvents` | 166 |
| registerEventListener | `onTurnedOn` | 167 |
| registerEventListener | `onTurnedOff` | 168 |
| registerEventListener | `onPreDetach` | 169 |
| registerEventListener | `onStartWorkAreaProcessing` | 170 |
| registerEventListener | `onEndWorkAreaProcessing` | 171 |
| registerEventListener | `onStateChange` | 172 |
| registerEventListener | `onSetLowered` | 173 |
| registerEventListener | `onFillUnitFillLevelChanged` | 174 |
| registerEventListener | `onSprayTypeChange` | 175 |
| registerEventListener | `onAIImplementEnd` | 176 |
| registerEventListener | `onVariableWorkWidthSectionChanged` | 177 |
