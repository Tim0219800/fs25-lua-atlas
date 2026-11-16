# vehicles/specializations/StonePicker.lua

*[Version française](../../../fr/scripts/vehicles/specializations/StonePicker.md)*

Source: `dataS/scripts/vehicles/specializations/StonePicker.lua` — FS25 1.25.1.0

✍ Stone picker specialization: picks up stones from the stone density map (stoneSystem) and pours them into a STONE-type fill unit. EFFECTS (client): two groups loaded by g_effectManager:loadEffect, effects (vehicle.stonePicker.effects: ejected/picked stones) and soilEffects (vehicle.stonePicker.soilEffects: soil lifted by the tool). Effect classes and EffectManager are absent from the dump: rendering UNVERIFIED. TRIGGERING (computed server side in onEndWorkAreaProcessing, then broadcast): the stone effect is active if area was touched within the last 500 ms (lastChangedAreaTime); the soil effect (soilEffects) is active if the tool is working (isWorking: speed > 0.5 during an area processing) AND the vehicle is on a field (self.isOnField). The server calls setStonePickerEffectsState only if one of the three items (stones, stage 1-3, soil) changed, then raises dirtyFlag. DATA PASSED: for stones, setEffectTypeInfo(effects, FillType.STONE, nil, growthState) where growthState = clamp(floor(stoneFactor + 0.49), 1, 3) (stone density stage read by updateStonePickerArea); for soil, a plain start/stop without type. AREA CONDITIONS: area processing happens only if the tool is turned on (if needsActivation, true by default), is not full (freeCapacity > 0, except AI), 2000 ms after attaching and, by default, lowered. Becoming full also stops the tool (onFillUnitFillLevelChanged, server). TERRAIN: updateStonePickerArea (body absent from the dump, UNVERIFIED) returns a stone factor, touched area and total area; litres = area in m2 (getFruitPixelsToSqm) * stoneSystem:getLitersPerSqm() * factor, added to the fill unit at the end of the pass. eraseTireTrack is always called; away from the client (> StonePicker.CLIENT_DM_UPDATE_RADIUS, constant not defined here, UNVERIFIED) the processing is skipped. WEATHER/MOISTURE: no data read. NETWORK: initial stream and update stream (stone effect, stage on 2 bits, soil effect); the client therefore applies the server state via setStonePickerEffectsState without recomputing it. dt: the 500 ms window is measured with g_time, independent of FPS. getDoGroundManipulation (override) returns false if not isWorking: queried by WorkParticles.lua:238 for the ground particles. The dirt/wear multipliers only count forward driving (movingDirection > 0); the dirt one reads spec.speedLimit (field not defined in this file, the wear line reads self.speedLimit: UNVERIFIED). EXTENSION POINTS: functions processStonePickerArea and setStonePickerEffectsState; overrides doCheckSpeedLimit, getDoGroundManipulation, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML (STONEPICKER type), getIsWorkAreaActive, getCanBeTurnedOn, getTurnedOnNotAllowedWarning, getCanToggleTurnedOn; stream events, onFillUnitFillLevelChanged, onPostAttach, onDeactivate, onStart/EndWorkAreaProcessing, onAIFieldCourseSettingsInitialized. Also registers an AI strategy (AIDriveStrategyStonePicker). Default speed limit: 10.

- **StonePicker** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `StonePicker.initSpecialization()` | 17 | ✍ Registers the AI drive strategy AIDriveStrategyStonePicker, the stonePicker area type and the XML schema (effects and soilEffects, sounds, fill unit, direction node, needsActivation, onlyActiveWhenLowered). Not re-read key by key. |
| `StonePicker.prerequisitesPresent(specializations: table) → boolean` | 46 | ✍ Requires FillUnit and WorkArea. |
| `StonePicker.registerFunctions(vehicleType: any)` | 53 | ✍ Registers processStonePickerArea and setStonePickerEffectsState (exact list not re-read). |
| `StonePicker.registerOverwrittenFunctions(vehicleType: any)` | 60 | ✍ Overrides doCheckSpeedLimit, getDoGroundManipulation, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML, getIsWorkAreaActive, getCanBeTurnedOn, getTurnedOnNotAllowedWarning, getCanToggleTurnedOn. |
| `StonePicker.registerEventListeners(vehicleType: any)` | 74 | ✍ Subscribes notably to onLoad, onDelete, the four stream events, onFillUnitFillLevelChanged, onAIFieldCourseSettingsInitialized, onPostAttach, onDeactivate and the area processing events. |
| `StonePicker:onLoad(savegame: table)` | 92 | ✍ Loads sounds and two effect groups (client), reads fill unit, load node, direction, needsActivation (true) and onlyActiveWhenLowered (true), initializes the pass parameters and, server side, the AI requirements (sowable range, stone map). |
| `StonePicker:onDelete()` | 154 | ✍ Frees the effects and soilEffects groups. |
| `StonePicker:onReadStream(streamId: any, connection: any)` | 163 | ✍ On join, reads the stone effect state, the stage (2 bits) and the soil effect state, then applies them. |
| `StonePicker:onWriteStream(streamId: any, connection: any)` | 172 | ✍ Writes these three values. |
| `StonePicker:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 181 | ✍ Client side: if the flag is raised, reads and applies the three values. |
| `StonePicker:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 194 | ✍ Server side: writes the three values when dirtyFlag is raised. |
| `StonePicker:processStonePickerArea(workArea: any, dt: any)` | 207 | ✍ Skipped if the tool is not active (isActive of the pass). Erases tire tracks, then (away from a distant client) calls updateStonePickerArea, computes the picked litres, keeps the stone stage 1-3, the last-change time and sets isWorking (speed > 0.5). Returns touched and total area. |
| `StonePicker:setStonePickerEffectsState(state: any, growthState: any, stateSoil: any)` | 247 | ✍ Central point of the effects: stores the three states and, client side, starts/stops the stone effect (with FillType.STONE and the stage), the soil effect and the related sounds. Acts only on state change. |
| `StonePicker:doCheckSpeedLimit(superFunc: any) → boolean` | 294 | ✍ Applies the speed limit when the tool is lowered and, if activation is required, turned on. |
| `StonePicker:getDoGroundManipulation(superFunc: any) → boolean` | 302 | ✍ Returns false if isWorking is false; otherwise delegates. Queried by WorkParticles. |
| `StonePicker:getDirtMultiplier(superFunc: any) → number` | 315 | ✍ Adds the work dirt (forward driving, isWorking, tool turned on if required), weighted by speed. |
| `StonePicker:getWearMultiplier(superFunc: any) → number` | 330 | ✍ Same for wear, without a stone factor. |
| `StonePicker:loadWorkAreaFromXML(superFunc: table, workArea: table, xmlFile: integer, key: string) → boolean` | 347 | ✍ Forces the STONEPICKER area type if the type read is DEFAULT. |
| `StonePicker:getIsWorkAreaActive(superFunc: any, workArea: any)` | 359 | ✍ For STONEPICKER: inactive during the post-attach delay, if not lowered (when required) or if the tool is full (except AI). |
| `StonePicker:getCanBeTurnedOn(superFunc: any)` | 384 | ✍ Refuses turning on if the tool is full (except AI). |
| `StonePicker:getTurnedOnNotAllowedWarning(superFunc: any)` | 397 | ✍ Returns the "tool full" warning text in that case. |
| `StonePicker:getCanToggleTurnedOn(superFunc: any)` | 410 | ✍ Forbids manual toggling if needsActivation is false. |
| `StonePicker:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 421 | ✍ Server: turns the tool off when the fill unit becomes full (except AI). |
| `StonePicker:onAIFieldCourseSettingsInitialized(fieldCourseSettings: any)` | 436 | ✍ AI course settings: headlands first, initial segment worked, segment splitting at 50, tool always active. |
| `StonePicker:onPostAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer)` | 450 | ✍ Arms the 2000 ms activation delay. |
| `StonePicker:onDeactivate()` | 457 | ✍ Stops the work sound (the end of the file does not stop the effects: not verified in game). |
| `StonePicker:onStartWorkAreaProcessing(dt: any)` | 467 | ✍ Before the pass: isWorking = false, pass active if turned on (or activation not required), density map angle, litres and areas reset to zero. |
| `StonePicker:onEndWorkAreaProcessing(dt: any)` | 485 | ✍ Server: area statistics, decision of the effect states (stones < 500 ms, soil = isWorking and on field) with network broadcast on change, then adds the stone litres to the fill unit. |
| `StonePicker.getDefaultSpeedLimit() → number` | 515 | ✍ Default speed limit: 10. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `processStonePickerArea` | 54 |
| registerFunction | `setStonePickerEffectsState` | 55 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 61 |
| registerOverwrittenFunction | `getDoGroundManipulation` | 62 |
| registerOverwrittenFunction | `getDirtMultiplier` | 63 |
| registerOverwrittenFunction | `getWearMultiplier` | 64 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 65 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 66 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 67 |
| registerOverwrittenFunction | `getTurnedOnNotAllowedWarning` | 68 |
| registerOverwrittenFunction | `getCanToggleTurnedOn` | 69 |
| registerEventListener | `onLoad` | 75 |
| registerEventListener | `onDelete` | 76 |
| registerEventListener | `onReadStream` | 77 |
| registerEventListener | `onWriteStream` | 78 |
| registerEventListener | `onReadUpdateStream` | 79 |
| registerEventListener | `onWriteUpdateStream` | 80 |
| registerEventListener | `onPostAttach` | 81 |
| registerEventListener | `onDeactivate` | 82 |
| registerEventListener | `onStartWorkAreaProcessing` | 83 |
| registerEventListener | `onEndWorkAreaProcessing` | 84 |
| registerEventListener | `onFillUnitFillLevelChanged` | 85 |
| registerEventListener | `onAIFieldCourseSettingsInitialized` | 86 |
