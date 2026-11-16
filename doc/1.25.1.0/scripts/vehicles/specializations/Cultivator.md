# vehicles/specializations/Cultivator.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Cultivator.md)*

Source: `dataS/scripts/vehicles/specializations/Cultivator.lua` — FS25 1.25.1.0

✍ Specialization for soil-tillage tools (cultivator, disc harrow, power harrow, subsoiler, vineyard tools). NO effect, particle or animation of its own: the file only loads a work sound sample (client). The soil/dust that gets thrown up comes from WorkParticles (WorkParticles.lua:238: active if getDoGroundManipulation() is true and the tool is on a field; Cultivator does not override getDoGroundManipulation, so the default is true, WorkParticles.lua:311, regardless of this script's work state). WORK: processCultivatorArea erases tire tracks (also on a distant client), then, unless the client is farther than Cultivator.CLIENT_DM_UPDATE_RADIUS (constant not defined here: UNVERIFIED), calls, depending on useDeepMode, FSDensityMapUtil.updateCultivatorArea (cultivator mode) or updateDiscHarrowArea (harrow/disc mode), with the tool's angle, the limitToField and limitFruitDestructionToField options, then updateVineCultivatorArea; if isSubsoiler, also updateSubsoilerArea. The FSDensityMapUtil bodies are absent from the dump: exact consequences on the terrain UNVERIFIED. isWorking = speed > 0.5. Area CONDITIONS: active only 2000 ms after attaching and, by default, if the tool is lowered (onlyActiveWhenLowered); spec.isEnabled (true at initialization; nothing in this file modifies it) conditions the cultivation call. Note: updateCultivatorEnabledState and getIsCultivationEnabled are registered (Cultivator.lua:87-88) but no function of that name is defined in the dump, although onStateChange (line 504) and SowingMachine.lua:1208-1209 call them (definition possibly outside the dump, UNVERIFIED; possible runtime failure, not verified in game). Turning on is only tested for power harrows (isPowerHarrow: onStateChange propagates TURN_ON/TURN_OFF between tractor and attached tool, server side). WEATHER/MOISTURE: no data read. NETWORK: no variable or stream; areas are accumulated per pass (workAreaParameters) and sent to farm statistics server side only (cultivatedHectares, cultivatedTime). dt: only used for the cultivated time (dt/60000, in minutes) and the activation delay is measured in game time. The soiling and wear multipliers use spec.speedLimit, a field not defined in this file (other tools use self.speedLimit): if absent, the division would fail (not verified in game, UNVERIFIED). EXTENSION POINTS: registerFunctions functions (processCultivatorArea, processVineCultivatorArea, getCultivatorLimitToField, getUseCultivatorAIRequirements, updateCultivatorAIRequirements, updateCultivatorEnabledState, getIsCultivationEnabled); overrides doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML (type CULTIVATOR), getIsWorkAreaActive, loadWorkModeFromXML (#useDeepMode), getAIImplementUseVineSegment; events onLoad, onDelete, onPostAttach, onDeactivate, onStart/EndWorkAreaProcessing, onStateChange, onWorkModeChanged. For a tillage dust mod: the only data specific to this script that is useful for effects is spec.isWorking and the deep/flat mode; color and particles are handled elsewhere (WorkParticles). Default speed limit: 15.

- **Cultivator** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `Cultivator.initSpecialization()` | 50 | ✍ Declares the cultivator area type and the XML schema (work sounds, the useDeepMode key of the work modes, options of the cultivator node). Not read key by key. |
| `Cultivator.prerequisitesPresent(specializations: table) → boolean` | 75 | ✍ Requires the WorkArea specialization. |
| `Cultivator.registerFunctions(vehicleType: any)` | 81 | ✍ Registers processCultivatorArea, processVineCultivatorArea, getCultivatorLimitToField, getUseCultivatorAIRequirements, updateCultivatorAIRequirements, updateCultivatorEnabledState and getIsCultivationEnabled (the last two reference Cultivator.updateCultivatorEnabledState / getIsCultivationEnabled, which are defined nowhere in the dump: probably nil, UNVERIFIED). |
| `Cultivator.registerOverwrittenFunctions(vehicleType: any)` | 93 | ✍ Overrides doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML, getIsWorkAreaActive, loadWorkModeFromXML and getAIImplementUseVineSegment. |
| `Cultivator.registerEventListeners(vehicleType: any)` | 105 | ✍ Subscribes to onLoad, onDelete, onPostAttach, onDeactivate, onStartWorkAreaProcessing, onEndWorkAreaProcessing, onStateChange and onWorkModeChanged (list not re-read line by line). |
| `Cultivator:onLoad(savegame: table)` | 119 | ✍ Reads the direction node, onlyActiveWhenLowered (true), isSubsoiler, isPowerHarrow, useDeepMode (true); loads the work sound (client); initializes the activation delay (2000 ms), isEnabled, limitToField and the area accumulators; computes the AI requirements. |
| `Cultivator:onDelete()` | 160 | ✍ Frees the sound samples. |
| `Cultivator:processCultivatorArea(workArea: any, dt: any)` | 169 | ✍ Erases tire tracks then, if enabled and not a distant client, works the soil in the density map (cultivator or harrow depending on useDeepMode, plus vine, plus subsoiler). Accumulates real/statistics/total areas, sets isWorking (speed > 0.5). Returns the real and total areas. |
| `Cultivator:processVineCultivatorArea(workArea: any, dt: any)` | 210 | ✍ Variant for an area dedicated to vines: calls updateVineCultivatorArea if enabled and within the radius; always returns 0, 0. |
| `Cultivator:getCultivatorLimitToField() → boolean` | 231 | ✍ Returns the limitToField option (true by default). |
| `Cultivator:getUseCultivatorAIRequirements() → boolean` | 238 | ✍ Returns true; override point to disable the AI requirements. |
| `Cultivator:updateCultivatorAIRequirements()` | 244 | ✍ Sets the ground types required by the AI (deep or flat), excluding rolled soils if a roller is attached, or clears them if a seeder is attached. Unrelated to effects. |
| `Cultivator:doCheckSpeedLimit(superFunc: any) → boolean` | 326 | ✍ Applies the speed limit when the tool chain is lowered. |
| `Cultivator:getDirtMultiplier(superFunc: any) → number` | 333 | ✍ Adds the work soiling weighted by speed/limit when isWorking (see the note on spec.speedLimit in the module). |
| `Cultivator:getWearMultiplier(superFunc: any) → number` | 347 | ✍ Adds the work wear weighted by speed/limit when isWorking (no stone factor here, unlike other tools). |
| `Cultivator:loadWorkAreaFromXML(superFunc: table, workArea: table, xmlFile: integer, key: string) → boolean` | 364 | ✍ Forces the CULTIVATOR area type if the type read is DEFAULT. |
| `Cultivator:getIsWorkAreaActive(superFunc: any, workArea: any)` | 376 | ✍ For CULTIVATOR: inactive during the post-attach delay and, if required, as long as the tool is not lowered. |
| `Cultivator:loadWorkModeFromXML(superFunc: any, xmlFile: any, key: any, workMode: any)` | 396 | ✍ Extends the loading of a work mode: reads #useDeepMode. |
| `Cultivator:getAIImplementUseVineSegment(superFunc: any, placeable: any, segment: any, segmentSide: any)` | 408 | ✍ True if more than 1% of the vine segment's area is covered by the tool. |
| `Cultivator:onPostAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer)` | 424 | ✍ Arms the 2000 ms activation delay. |
| `Cultivator:onDeactivate()` | 431 | ✍ Stops the work sound. |
| `Cultivator:onStartWorkAreaProcessing(dt: any)` | 441 | ✍ Before the pass: isWorking = false; computes limitToField (forced to true without the createFields permission), the density map angle from the direction node, and resets the areas to zero. |
| `Cultivator:onEndWorkAreaProcessing(dt: any)` | 466 | ✍ Server: updates the statistics (cultivatedHectares, cultivatedTime) and the worked area. Client: starts/stops the sound according to isWorking. No visual effect. |
| `Cultivator:onStateChange(state: any, data: any)` | 501 | ✍ On attach, detach or AI line start: recomputes the AI requirements and the enabled state. For a power harrow, server: propagates turn on/off between the tool and its carrier or its attached tools. |
| `Cultivator:onWorkModeChanged(workMode: any, oldWorkMode: any)` | 546 | ✍ Adopts useDeepMode from the new work mode and recomputes the AI needs. |
| `Cultivator.getDefaultSpeedLimit() → number` | 556 | ✍ Default speed limit: 15. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `processCultivatorArea` | 82 |
| registerFunction | `processVineCultivatorArea` | 83 |
| registerFunction | `getCultivatorLimitToField` | 84 |
| registerFunction | `getUseCultivatorAIRequirements` | 85 |
| registerFunction | `updateCultivatorAIRequirements` | 86 |
| registerFunction | `updateCultivatorEnabledState` | 87 |
| registerFunction | `getIsCultivationEnabled` | 88 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 94 |
| registerOverwrittenFunction | `getDirtMultiplier` | 95 |
| registerOverwrittenFunction | `getWearMultiplier` | 96 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 97 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 98 |
| registerOverwrittenFunction | `loadWorkModeFromXML` | 99 |
| registerOverwrittenFunction | `getAIImplementUseVineSegment` | 100 |
| registerEventListener | `onLoad` | 106 |
| registerEventListener | `onDelete` | 107 |
| registerEventListener | `onPostAttach` | 108 |
| registerEventListener | `onDeactivate` | 109 |
| registerEventListener | `onStartWorkAreaProcessing` | 110 |
| registerEventListener | `onEndWorkAreaProcessing` | 111 |
| registerEventListener | `onStateChange` | 112 |
| registerEventListener | `onWorkModeChanged` | 113 |
