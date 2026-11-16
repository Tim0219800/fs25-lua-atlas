# vehicles/specializations/SowingMachine.lua

*[Version française](../../../fr/scripts/vehicles/specializations/SowingMachine.md)*

Source: `dataS/scripts/vehicles/specializations/SowingMachine.lua` — FS25 1.25.1.0

✍ Specialization for seeders and planters (conventional sowing, direct sowing, water sowing, ridge sowing). Prerequisites: FillUnit, WorkArea, TurnOnVehicle. EFFECTS (client): two groups loaded by g_effectManager:loadEffect: effects (vehicle.sowingMachine.effects: seeds on the ground, driven continuously) and fillEffects (vehicle.sowingMachine.fillEffects: fill effect), plus animationNodes and sounds (airBlower fan on turn-on, work sound). Effect classes are absent from the dump: rendering UNVERIFIED. TRIGGERING: onUpdate (client only: the subscription is removed off-client) starts the effects with the forced material fill type of the fill unit (getFillUnitForcedMaterialFillType, so the displayed seed type, not the fruit) as long as spec.isProcessing is true, otherwise stops them, every frame. isProcessing is set in processSowingMachineArea, after all the guards: speed > 0.5 (isWorking), seeder turned on (or activation not required), seeds available (or AI buying seeds), plantable fruit (type having a terrain map AND a valid planting period, except getCanPlantOutsideSeason), water sowing consistent with water (isInWater), and client distance <= SowingMachine.CLIENT_DM_UPDATE_RADIUS (constant not defined here: UNVERIFIED). A client receives NO effect state over the network: it recomputes isProcessing locally, so a client's sowing effects depend on its own execution of processSowingMachineArea, and a distant seeder does not emit (early return before isProcessing). The fillEffects are driven by onFillUnitFillLevelChanged (client): started if the unit contains something, with the forced type or the received type, stopped if empty. No growth stage or width is passed to the effects. TERRAIN: FSDensityMapUtil.updateSowingArea (conventional sowing) or updateDirectSowingArea (direct sowing) with fruit, target field ground type, ridge option and row angle (angle of the tool direction, rounded to the fruit's directionSnapAngle if non-zero); bodies absent from the dump: consequences UNVERIFIED. eraseTireTrack is called after the guards. Crop check: fruitTypeDesc.seedRequiredFieldType (rice) compared with FSDensityMapUtil.getFieldTypeAtWorldPos. SEASON: getIsPlantableInPeriod(growthMode, environment.currentPeriod) (calendar period), NO reading of weather, rain or soil moisture. CONSUMPTION: server, at the end of the pass, seedUsagePerSqm * area * seedUsageScale (increased by vehicle damage) subtracted from the fill unit or the consumable, or charged to the AI if seeds are bought. dt: only for the sown time (sownTime statistic). NETWORK: only the seed index is synchronized (initial stream, SetSeedIndexEvent); the effects are not. Warning: onStateChange tests `... or VehicleStateChange.FILLTYPE_CHANGE`, an always-true expression (SowingMachine.lua:1131): the seed sources update therefore runs on every state change (not verified in game). The `updateCultivatorEnabledState` called by this file is discussed in Cultivator. EXTENSION POINTS: functions setSeedIndex, changeSeedIndex, setSeedFruitType, getIsSeedChangeAllowed, getSowingMachineFillUnitIndex, getSowingMachineSeedFillTypeIndex, getCurrentSeedTypeIcon, processSowingMachineArea, updateMissionSowingWarning, getUseSowingMachineAIRequirements, setFillTypeSourceDisplayFillType, getCanPlantOutsideSeason, getSowingMachineCanConsume, getAllowFillFromAir, getDirectionSnapAngle; overrides addFillUnitFillLevel, getFillUnitAllowsFillType, getCanBeTurnedOn, getCanToggleTurnedOn, doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML (SOWINGMACHINE type), getCanAIImplementContinueWork; events onTurnedOn/Off, onStart/EndWorkAreaProcessing, onFillUnitFillLevelChanged, onChangedFillType, onStateChange. Default speed limit: 15.

- **SowingMachine** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `SowingMachine.initSpecialization()` | 38 | ✍ Declares the sowingMachine area type and the XML schema: effects, fillEffects, animationNodes, seeds (categories or types), direct/water/ridge sowing, fill unit, consumable, usage. Not re-read key by key. |
| `SowingMachine.prerequisitesPresent(specializations: any)` | 86 | ✍ Requires FillUnit, WorkArea and TurnOnVehicle. |
| `SowingMachine.registerFunctions(vehicleType: any)` | 94 | ✍ Registers the functions for seed management, area processing, mission warning, AI requirements and consumption (list not re-read line by line). |
| `SowingMachine.registerOverwrittenFunctions(vehicleType: any)` | 113 | ✍ Overrides addFillUnitFillLevel, getFillUnitAllowsFillType, getCanBeTurnedOn, getCanToggleTurnedOn, doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML, getCanAIImplementContinueWork and others (list not re-read line by line). |
| `SowingMachine.registerEventListeners(vehicleType: any)` | 132 | ✍ Subscribes to onLoad, onPostLoad, onDelete, initial stream, onUpdate, onUpdateTick, onRegisterActionEvents, onTurnedOn/Off, onStart/EndWorkAreaProcessing, onDeactivate, onStateChange, onChangedFillType, onFillUnitFillLevelChanged and onAIFieldCourseSettingsInitialized. |
| `SowingMachine:onLoad(savegame: any)` | 154 | ✍ Loads sounds, animations and effects (client), reads the sowable fruits, the seed type, the required activation (false by default), direct/water/ridge sowing, the fill unit, the consumable and the usage scale; selects the default seed or the savegame one; removes onUpdate/onUpdateTick off-client; enables needWaterInfo. |
| `SowingMachine:onPostLoad(savegame: any)` | 305 | ✍ Computes the initial AI parameters. |
| `SowingMachine:onDelete()` | 312 | ✍ Frees sounds, animations and effects (client: sounds, effects, fillEffects, animations). |
| `SowingMachine:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 328 | ✍ Saves the selected seed and the permission to change seed. |
| `SowingMachine:onReadStream(streamId: any, connection: any)` | 345 | ✍ Reads the seed index on join and applies it without sending an event back. |
| `SowingMachine:onWriteStream(streamId: any, connection: any)` | 352 | ✍ Writes the current seed index. |
| `SowingMachine:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 359 | ✍ Client: starts the sowing effects with the forced material type of the fill unit as long as isProcessing is true (if this type is known), otherwise stops them. Runs every frame, with no throttling. |
| `SowingMachine:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 374 | ✍ Client: enables/disables the seed change action and shows the blinking warnings (non-plantable fruit, wrong mission seed, wrong period, water required/forbidden, field type). |
| `SowingMachine:setSeedIndex(seedIndex: any, noEventSend: any)` | 402 | ✍ Chooses the seed (clamped), sends SetSeedIndexEvent, updates the displayed type of the fill unit and of the sources, the AI requirements and the action text. |
| `SowingMachine:changeSeedIndex(increment: any)` | 422 | ✍ Moves to the next or previous seed in a circular way. |
| `SowingMachine:setSeedFruitType(fruitType: any, noEventSend: any)` | 436 | ✍ Selects the seed matching a fruit index. |
| `SowingMachine:getIsSeedChangeAllowed()` | 454 | ✍ Returns allowsSeedChanging. |
| `SowingMachine:getSowingMachineFillUnitIndex()` | 460 | ✍ Returns the index of the seed fill unit. |
| `SowingMachine:getSowingMachineSeedFillTypeIndex()` | 466 | ✍ Returns the fill type matching the current seed. |
| `SowingMachine:getCurrentSeedTypeIcon()` | 473 | ✍ Returns the HUD icon file of the current seed fill type (nil if unknown). |
| `SowingMachine:processSowingMachineArea(workArea: any, dt: any)` | 485 | ✍ Core of sowing: applies the guards (water, activation, seeds, plantable fruit, field type), erases tire tracks, sets isProcessing (drives the effects) and calls conventional or direct sowing in the density map; reads stone presence and prepares the mission warning. Returns modified and total area. |
| `SowingMachine:updateMissionSowingWarning(x: any, z: any)` | 584 | ✍ Reports a wrong fruit if the seeder works on a field of an unleased sowing mission. |
| `SowingMachine:getUseSowingMachineAIRequirements()` | 602 | ✍ True if the AI must turn the seeder on or if it is turned on. |
| `SowingMachine:setFillTypeSourceDisplayFillType(fillType: any)` | 608 | ✍ Updates the fill type displayed on the seed source vehicles (trailers) for the selected seed. |
| `SowingMachine:getDrawFirstFillText(superFunc: any)` | 639 | ✍ Asks to display "fill first" when the seeder is selected and empty. |
| `SowingMachine:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 663 | ✍ Forbids controlled actions while a seeder with mandatory filling is empty. |
| `SowingMachine:getFillUnitAllowsFillType(superFunc: any, fillUnitIndex: any, fillType: any)` | 683 | ✍ Accepts the configured seed type or the type already in the unit. |
| `SowingMachine:getCanBeTurnedOn(superFunc: any)` | 703 | ✍ Refuses turning on if needsActivation is false. |
| `SowingMachine:getCanToggleTurnedOn(superFunc: any)` | 714 | ✍ Refuses manual toggling if needsActivation is false. |
| `SowingMachine:getCanPlantOutsideSeason()` | 725 | ✍ Returns false; override point to ignore the planting period. |
| `SowingMachine:getSowingMachineCanConsume()` | 731 | ✍ Tells whether the seeder has something to consume (consumable available or level > 0). |
| `SowingMachine:getAllowFillFromAir(superFunc: any)` | 744 | ✍ Forbids filling from the air when turned on if the allowFillFromAirWhileTurnedOn option is false. |
| `SowingMachine:getDirectionSnapAngle(superFunc: any)` | 754 | ✍ Takes the larger of the snap angle of the current fruit and of the parent. |
| `SowingMachine:addFillUnitFillLevel(superFunc: any, farmId: any, fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillInfo: any)` | 767 | ✍ Forces the seed type of the fill unit (forced material) before adding the quantity; this forced type is what onUpdate reads for the effects. |
| `SowingMachine:doCheckSpeedLimit(superFunc: any)` | 794 | ✍ Applies the speed limit when the tool chain is lowered and, if activation is required, when the tool is turned on. |
| `SowingMachine:getDirtMultiplier(superFunc: any)` | 801 | ✍ Adds the work dirt (forward driving, isWorking, turned on if required) weighted by speed. |
| `SowingMachine:getWearMultiplier(superFunc: any) → number` | 815 | ✍ Same for wear, with a stone factor. |
| `SowingMachine:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 833 | ✍ Forces the SOWINGMACHINE area type if DEFAULT. |
| `SowingMachine:getCanBeSelected(superFunc: any)` | 845 | ✍ Returns true: the tool is selectable. |
| `SowingMachine:getCanAIImplementContinueWork(superFunc: any, isTurning: any)` | 851 | ✍ The AI stops if the seed is not plantable in the current period (unless out-of-season planting is allowed). |
| `SowingMachine:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 872 | ✍ Registers the seed change actions (next/previous) if there are several seeds. |
| `SowingMachine.updateChooseSeedActionEvent(self: any)` | 891 | ✍ Updates the text of the seed choice action with the name of the current fill type. |
| `SowingMachine:onTurnedOn()` | 909 | ✍ Client: starts the fan and the animations; server: turns on the seed source vehicles; recomputes the AI requirements. |
| `SowingMachine:onTurnedOff()` | 932 | ✍ Symmetric: stops fan and animations, turns off the sources, recomputes the AI requirements. |
| `SowingMachine:onStartWorkAreaProcessing(dt: any)` | 955 | ✍ Before the pass: isWorking/isProcessing = false; chooses the seed source vehicle, computes the row angle, the plantable fruit, the planting period (calendar) and the warnings, and fills workAreaParameters. |
| `SowingMachine:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 1054 | ✍ Server: computes seed consumption (or the AI bill), updates statistics and area; client: starts/stops the work sound depending on isWorking. |
| `SowingMachine:onDeactivate()` | 1119 | ✍ Stops the work and fan sounds. |
| `SowingMachine:onStateChange(state: any, data: any)` | 1130 | ✍ Rebuilds the seed sources and the displayed type on every state change (always-true condition, see module). |
| `SowingMachine:onChangedFillType(fillUnitIndex: any, fillTypeIndex: any, oldFillTypeIndex: any)` | 1152 | ✍ Passes the new fill type to the animations. |
| `SowingMachine:onFillUnitFillLevelChanged(fillUnitIndex: integer, fillLevelDelta: number, fillTypeIndex: integer, toolType: integer, fillPositionData: table?, appliedDelta: number)` | 1167 | ✍ Client: starts the fillEffects (with the forced or received type) if the unit contains something, otherwise stops them. |
| `SowingMachine:onAIFieldCourseSettingsInitialized(fieldCourseSettings: any)` | 1182 | ✍ For PLANTED type sowing: headlands first and initial segment worked. |
| `SowingMachine.updateAiParameters(self: any)` | 1192 | ✍ Recomputes the AI requirements (required or excluded ground types, crops) depending on the seed, the presence of a source and the turned-on state (lines 1192-1270 not re-read in detail). |
| `SowingMachine.getDefaultSpeedLimit()` | 1271 | ✍ Default speed limit: 15. |
| `SowingMachine.actionEventToggleSeedType(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1277 | ✍ Input callback: next seed. |
| `SowingMachine.actionEventToggleSeedTypeBack(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1285 | ✍ Input callback: previous seed. |
| `SowingMachine.loadSpecValueSeedFillTypes(xmlFile: any, customEnvironment: any, baseDir: any)` | 1293 | ✍ Reads for the shop the seed types of a seeder from its XML. |
| `SowingMachine.getSpecValueSeedFillTypes(storeItem: any, realItem: any)` | 1302 | ✍ Formats the list of seed types for the shop. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `setSeedFruitType` | 95 |
| registerFunction | `setSeedIndex` | 96 |
| registerFunction | `changeSeedIndex` | 97 |
| registerFunction | `getIsSeedChangeAllowed` | 98 |
| registerFunction | `setIsSeedChangeAllowed` | 99 |
| registerFunction | `getSowingMachineFillUnitIndex` | 100 |
| registerFunction | `getSowingMachineSeedFillTypeIndex` | 101 |
| registerFunction | `getCurrentSeedTypeIcon` | 102 |
| registerFunction | `processSowingMachineArea` | 103 |
| registerFunction | `getUseSowingMachineAIRequirements` | 104 |
| registerFunction | `setFillTypeSourceDisplayFillType` | 105 |
| registerFunction | `updateMissionSowingWarning` | 106 |
| registerFunction | `getCanPlantOutsideSeason` | 107 |
| registerFunction | `getSowingMachineCanConsume` | 108 |
| registerOverwrittenFunction | `getDrawFirstFillText` | 114 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 115 |
| registerOverwrittenFunction | `getFillUnitAllowsFillType` | 116 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 117 |
| registerOverwrittenFunction | `getCanToggleTurnedOn` | 118 |
| registerOverwrittenFunction | `getAllowFillFromAir` | 119 |
| registerOverwrittenFunction | `getDirectionSnapAngle` | 120 |
| registerOverwrittenFunction | `addFillUnitFillLevel` | 121 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 122 |
| registerOverwrittenFunction | `getDirtMultiplier` | 123 |
| registerOverwrittenFunction | `getWearMultiplier` | 124 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 125 |
| registerOverwrittenFunction | `getCanBeSelected` | 126 |
| registerOverwrittenFunction | `getCanAIImplementContinueWork` | 127 |
| registerEventListener | `onLoad` | 133 |
| registerEventListener | `onPostLoad` | 134 |
| registerEventListener | `onDelete` | 135 |
| registerEventListener | `onReadStream` | 136 |
| registerEventListener | `onWriteStream` | 137 |
| registerEventListener | `onUpdate` | 138 |
| registerEventListener | `onUpdateTick` | 139 |
| registerEventListener | `onRegisterActionEvents` | 140 |
| registerEventListener | `onTurnedOn` | 141 |
| registerEventListener | `onTurnedOff` | 142 |
| registerEventListener | `onStartWorkAreaProcessing` | 143 |
| registerEventListener | `onEndWorkAreaProcessing` | 144 |
| registerEventListener | `onDeactivate` | 145 |
| registerEventListener | `onStateChange` | 146 |
| registerEventListener | `onChangedFillType` | 147 |
| registerEventListener | `onFillUnitFillLevelChanged` | 148 |
| registerEventListener | `onAIFieldCourseSettingsInitialized` | 149 |
