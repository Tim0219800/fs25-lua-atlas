# vehicles/specializations/Mulcher.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Mulcher.md)*

Source: `dataS/scripts/vehicles/specializations/Mulcher.lua` — FS25 1.25.1.0

✍ Specialization for mulchers (haulm, stubble, cover crop, vine mulchers). It is one of the few specializations in this batch with a real per-work-area effect system. EFFECTS: vehicle.mulcher.effects.effect(?), loaded by g_effectManager:loadEffect; each entry has workAreaIndex (linked area), activeDirection (0 = all, otherwise must equal movingDirection) and an activity duration of 250 ms. The fill type passed to the effect is fixed: spec.effectFillType = WHEAT (setEffectTypeInfo with that sole argument); no reading of the crop actually mulched nor of its stage. For effects of class CultivatorMotionPathEffect, autoTurnOffSpeed is forced to -infinity (so stopping is driven by this script, not by speed). The effect classes and EffectManager are absent from the dump: rendering UNVERIFIED. TRIGGER (server, or client within Mulcher.CLIENT_DM_UPDATE_RADIUS, constant not defined here, UNVERIFIED): in processMulcherArea, if the FSDensityMapUtil.updateMulcherArea call returns an actually modified area > 0 AND the speed is > 0.5, the effects of that area whose direction fits are (re)armed: activeTime = current time + 250 ms and started if they were stopped. In other words, dust/debris is only emitted when material is actually mulched in the density map (not simply when driving). STOP: onUpdateTick (server side only) turns off expired effects. NETWORK: one boolean per effect sent in the initial stream (onWriteStream) and in updates via effectDirtyFlag; the client applies setEffectTypeInfo + startEffects/stopEffects on reception. A client therefore does not compute the effect itself, unless it also runs processMulcherArea. Note: onLoad removes the onUpdateTick listener when the instance is not a client (Mulcher.lua:173) whereas this function only runs server side; on a dedicated server, effect expiry would therefore never be processed and isActive would stay true, which would prevent any new stop flag (not verified in game). WEATHER/MOISTURE: no reading. MAPS: eraseTireTrack (always, even on a distant client), updateMulcherArea (body absent from the dump), getStoneArea for wear. isWorking = less than 500 ms elapsed since the last real mulching (g_time); getDoGroundManipulation (override) returns false if not isWorking, which WorkParticles.lua:238 consults for its ground particles. dt: activeTime in milliseconds of game time, independent of FPS. EXTENSION POINTS: function processMulcherArea; overrides doCheckSpeedLimit, getDoGroundManipulation, getDirtMultiplier, getWearMultiplier, getAIImplementUseVineSegment, loadWorkAreaFromXML (type MULCHER); events onLoad, onPostLoad, onDelete, network streams, onUpdateTick, onDeactivate, onStart/EndWorkAreaProcessing, onAIFieldCourseSettingsInitialized. Default speed limit: 15.

- **Mulcher** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `Mulcher.initSpecialization()` | 26 | ✍ Declares the mulcher area type and the XML schema: effects (vehicle.mulcher.effects.effect(?) with workAreaIndex/activeDirection) and idle/work sounds. Not read key by key. |
| `Mulcher.prerequisitesPresent(specializations: table) → boolean` | 46 | ✍ Requires WorkArea and GroundReference. |
| `Mulcher.registerFunctions(vehicleType: any)` | 52 | ✍ Registers processMulcherArea on the vehicle type. |
| `Mulcher.registerOverwrittenFunctions(vehicleType: any)` | 58 | ✍ Overrides doCheckSpeedLimit, getDoGroundManipulation, getDirtMultiplier, getWearMultiplier, getAIImplementUseVineSegment and loadWorkAreaFromXML. |
| `Mulcher.registerEventListeners(vehicleType: any)` | 68 | ✍ Subscribes notably to onLoad, onPostLoad, onDelete, the four network stream events, onUpdateTick, onDeactivate and the area processing events (exact list not re-read). |
| `Mulcher:onLoad(savegame: table)` | 86 | ✍ Loads sounds and effects (one table per effect with area, direction, 250 ms window, active/sent states), sets effectFillType to WHEAT, declares the AI needs (crops whose mulched stage is defined, weed replacements) and the stone wear multiplier; removes onUpdateTick if not a client or without effects. |
| `Mulcher:onPostLoad(savegame: any)` | 180 | ✍ Attaches each effect to its work area (workAreaToEffects) and removes those whose workAreaIndex is invalid (with an XML warning). |
| `Mulcher:onDelete()` | 200 | ✍ Frees sounds and effects. |
| `Mulcher:onReadStream(streamId: any, connection: any)` | 216 | ✍ Receives each effect's active state on connection: starts (with effectFillType) or stops the effect. |
| `Mulcher:onWriteStream(streamId: any, connection: any)` | 230 | ✍ Writes each effect's active state. |
| `Mulcher:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 239 | ✍ Client side: if the flag is present, reads each effect's state and starts or stops it. |
| `Mulcher:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 257 | ✍ Server side: writes the effects' state when effectDirtyFlag is raised. |
| `Mulcher:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 270 | ✍ Server only: deactivates the effects whose 250 ms window has expired, raises effectDirtyFlag and calls stopEffects. Removed from the subscription if the instance is not a client or without effects (see module). |
| `Mulcher:processMulcherArea(workArea: any, dt: any)` | 285 | ✍ Erases tire tracks, applies mulching to the density map (updateMulcherArea) and, if real area is processed at speed > 0.5, arms/starts the area's effects (direction permitting) then raises the network flag. Updates lastWorkTime (g_time), isWorking (< 500 ms) and the stone reading. Returns the real and total areas. |
| `Mulcher:doCheckSpeedLimit(superFunc: any) → boolean` | 337 | ✍ Applies the speed limit as soon as the tool chain is lowered. |
| `Mulcher:getDoGroundManipulation(superFunc: any) → boolean` | 344 | ✍ Returns false as long as isWorking is false; otherwise delegates to the parent. Queried by WorkParticles for its ground particles. |
| `Mulcher:getDirtMultiplier(superFunc: any) → number` | 357 | ✍ Adds the work soiling weighted by speed when isWorking (reads spec.speedLimit, a field of the specialization table that this file does not define anywhere, whereas other tools read self.speedLimit: Note: may be provided elsewhere, UNVERIFIED). |
| `Mulcher:getWearMultiplier(superFunc: any) → number` | 371 | ✍ Adds the work wear weighted by speed and by the stone multiplier. |
| `Mulcher:getAIImplementUseVineSegment(superFunc: any, placeable: any, segment: any, segmentSide: any)` | 389 | ✍ Tells whether the AI should process a vine segment: true if more than 1% of the segment's area is covered by the tool. |
| `Mulcher:loadWorkAreaFromXML(superFunc: table, workArea: table, xmlFile: integer, key: string) → boolean` | 406 | ✍ Forces the MULCHER area type if the type read is DEFAULT. |
| `Mulcher:onDeactivate()` | 418 | ✍ Stops sounds and effects. |
| `Mulcher:onStartWorkAreaProcessing(dt: any)` | 434 | ✍ Resets isWorking and isWorkingIdle to false before the pass. |
| `Mulcher:onEndWorkAreaProcessing(dt: any)` | 443 | ✍ Client: starts/stops the work sound (according to isWorking) and the idle sound (according to isWorkingIdle, speed > 0.5). |
| `Mulcher:onAIFieldCourseSettingsInitialized(fieldCourseSettings: any)` | 475 | ✍ AI course settings: borders first, initial segment worked. |
| `Mulcher.getDefaultSpeedLimit() → number` | 483 | ✍ Default speed limit: 15. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `processMulcherArea` | 53 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 59 |
| registerOverwrittenFunction | `getDoGroundManipulation` | 60 |
| registerOverwrittenFunction | `getDirtMultiplier` | 61 |
| registerOverwrittenFunction | `getWearMultiplier` | 62 |
| registerOverwrittenFunction | `getAIImplementUseVineSegment` | 63 |
| registerEventListener | `onLoad` | 69 |
| registerEventListener | `onPostLoad` | 70 |
| registerEventListener | `onDelete` | 71 |
| registerEventListener | `onReadStream` | 72 |
| registerEventListener | `onWriteStream` | 73 |
| registerEventListener | `onReadUpdateStream` | 74 |
| registerEventListener | `onWriteUpdateStream` | 75 |
| registerEventListener | `onUpdateTick` | 76 |
| registerEventListener | `onDeactivate` | 77 |
| registerEventListener | `onStartWorkAreaProcessing` | 78 |
| registerEventListener | `onEndWorkAreaProcessing` | 79 |
| registerEventListener | `onAIFieldCourseSettingsInitialized` | 80 |
