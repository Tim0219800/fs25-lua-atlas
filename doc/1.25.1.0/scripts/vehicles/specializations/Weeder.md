# vehicles/specializations/Weeder.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Weeder.md)*

Source: `dataS/scripts/vehicles/specializations/Weeder.lua` — FS25 1.25.1.0

✍ Specialization for weeders / tine harrows (weed control), with a hoeing option (isHoe) and a grassland option (isGrasslandWeeder). No EffectManager effects are loaded; the visual originality is the colouring of ground particles: for each ground particle mapping declared with adjustColor (XML key on the WorkParticles node), onUpdateTick recolours the shader of that particle system. WORK: processWeederArea (server, or client at a distance <= Weeder.CLIENT_DM_UPDATE_RADIUS, a constant not defined here: UNVERIFIED) calls FSDensityMapUtil.updateWeederArea (weed map; body absent from the dump, UNVERIFIED) and, in grassland mode, updateGrassRollerArea; isWorking = speed > 0.5. getStoneArea is read for wear (stones). AREA CONDITIONS: getIsWorkAreaActive requires ground contact of the reference node (if requiresGroundContact) and, if disableBackwards, movingDirection > 0; the lowered state is not tested here (the speed limit follows getIsImplementChainLowered). Note: startActivationTime is armed on attach (2000 ms) but is never consulted in this file (not verified in game: possibly no effect). COLOURING (onUpdateTick, client and server, while isWorking): the base colour is read at the node's world position: on a field, getFieldGroundTyreTrackColor(densityBits) of the fieldGroundSystem (tyre track colour of the ground type), otherwise getTerrainAttributesAtWorldPos (terrain attribute colour); a smoothed transition over 1 s (alpha += dt/1000, vector3ArrayLerp interpolation) then setShaderParameter psColor (final alpha 1). The psColor parameter of the particle shader cannot be verified in the dump. Note: the condition that restarts a transition (lines 144-147) compares components with a logical AND of differences, which only triggers when all three channels change at once (not verified in game). WEATHER/WETNESS: no data read; the ground colour comes from the terrain maps, so it is indirectly tied to what they encode (not re-read). NETWORK: no stream or dirtyFlag; the colouring and the isWorking state are recomputed locally by each client. dt: used for the colour transition (seconds = dt/1000). EXTENSION POINTS: functions processWeederArea, updateWeederAIRequirements; overrides doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML (type WEEDER), getIsWorkAreaActive, loadGroundParticleMapping (adds adjustColor). The ground particles themselves are loaded/driven by WorkParticles (WorkParticles.lua:238: active if getDoGroundManipulation() and on a field; Weeder does not override getDoGroundManipulation, so the default true of WorkParticles.lua:311 applies). Default speed limit: 15.

- **Weeder** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `Weeder.initSpecialization()` | 17 | ✍ Declares the weeder work area type, the XML schema (work sounds, vehicle.weeder#isHoe, #isGrasslandWeeder) and adds the adjustColor key to WorkParticles' mapping table. |
| `Weeder.prerequisitesPresent(specializations: table) → boolean` | 36 | ✍ Requires WorkArea and AttacherJoints. |
| `Weeder.registerFunctions(vehicleType: any)` | 43 | ✍ Registers processWeederArea and updateWeederAIRequirements. |
| `Weeder.registerOverwrittenFunctions(vehicleType: any)` | 50 | ✍ Overrides doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML, getIsWorkAreaActive and loadGroundParticleMapping. |
| `Weeder.registerEventListeners(vehicleType: any)` | 61 | ✍ Subscribes to onLoad, onDelete, onUpdateTick, onDeactivate, onPostAttach, onStartWorkAreaProcessing, onEndWorkAreaProcessing and onStateChange. |
| `Weeder:onLoad(savegame: table)` | 75 | ✍ Loads the sounds (client), reads isHoe and isGrasslandWeeder, initialises the surface accumulators, the activation delay and the stone-related wear multiplier data (WEEDER type of the stoneSystem), then the AI requirements. |
| `Weeder:onDelete()` | 104 | ✍ Releases the work sounds if they exist. |
| `Weeder:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 113 | ✍ If the tool is working and has colour-adjustable particles: re-reads the ground colour under each node (tyre track colour on a field, terrain attribute otherwise), blends over 1 s and sends it to the psColor shader parameter of the particle system. Runs on any participant that has these particles (client or host). No weather reading. |
| `Weeder:processWeederArea(workArea: any, dt: any)` | 157 | ✍ Applies weeding (and the grassland roller if isGrasslandWeeder) to the density map, accumulates areas, sets isWorking (speed > 0.5) and reads stone presence if the tool is working. Returns the area twice (actual and total identical). |
| `Weeder:updateWeederAIRequirements()` | 190 | ✍ Declares to the AI the targeted weed states (via weedSystem:getWeederReplacements) unless a seeder is attached; unrelated to effects. End of function (lines 230-240) not re-read. |
| `Weeder:loadWorkAreaFromXML(superFunc: table, workArea: table, xmlFile: integer, key: string) → boolean` | 251 | ✍ Forces the WEEDER area type when the type read is DEFAULT. |
| `Weeder:getIsWorkAreaActive(superFunc: table, workArea: table) → boolean` | 263 | ✍ For WEEDER: active if ground contact (when required) and, where relevant, forward motion only; looks at neither ignition nor the post-attach delay. |
| `Weeder:doCheckSpeedLimit(superFunc: any) → boolean` | 281 | ✍ Applies the speed limit as soon as the implement chain is lowered. |
| `Weeder:getDirtMultiplier(superFunc: any) → number` | 288 | ✍ Adds the work dirt, weighted by speed / speed limit, when isWorking. |
| `Weeder:getWearMultiplier(superFunc: any) → number` | 302 | ✍ Adds the work wear, weighted by speed / limit and by the stone multiplier (spec.stoneLastState). |
| `Weeder:loadGroundParticleMapping(superFunc: XMLFile, xmlFile: XMLFile, key: string, mapping: table, index: integer, i3dNode: integer) → boolean` | 326 | ✍ Extends the loading of a ground particle mapping: reads adjustColor and, if true, registers the mapping in spec.colorParticleSystems with a colour buffer. |
| `Weeder:onStartWorkAreaProcessing(dt: any)` | 347 | ✍ Resets isWorking and the areas before the pass. |
| `Weeder:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 356 | ✍ Server: declares the worked area (updateLastWorkedArea). Client: starts/stops the work sound according to isWorking. |
| `Weeder:onStateChange(state: any, data: any)` | 382 | ✍ On attach or detach, recomputes the AI requirements. |
| `Weeder:onDeactivate()` | 390 | ✍ Stops the work sound. |
| `Weeder:onPostAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer)` | 403 | ✍ Arms startActivationTime (2000 ms), a value not consulted elsewhere in this file. |
| `Weeder.getDefaultSpeedLimit() → number` | 411 | ✍ Default speed limit: 15. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `processWeederArea` | 44 |
| registerFunction | `updateWeederAIRequirements` | 45 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 51 |
| registerOverwrittenFunction | `getDirtMultiplier` | 52 |
| registerOverwrittenFunction | `getWearMultiplier` | 53 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 54 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 55 |
| registerOverwrittenFunction | `loadGroundParticleMapping` | 56 |
| registerEventListener | `onLoad` | 62 |
| registerEventListener | `onDelete` | 63 |
| registerEventListener | `onUpdateTick` | 64 |
| registerEventListener | `onDeactivate` | 65 |
| registerEventListener | `onPostAttach` | 66 |
| registerEventListener | `onStartWorkAreaProcessing` | 67 |
| registerEventListener | `onEndWorkAreaProcessing` | 68 |
| registerEventListener | `onStateChange` | 69 |
