# vehicles/specializations/Tedder.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Tedder.md)*

Source: `dataS/scripts/vehicles/specializations/Tedder.lua` — FS25 1.25.1.0

✍ Tedder specialization: picks up the windrow/forage under the work area (height map, DensityMapHeightUtil) and drops it again spread out in a drop area, converting the fill type (fillTypeConverter: e.g. grass to dry hay, names not re-read). Prerequisites: WorkArea and TurnOnVehicle. EFFECTS (client): animationNodes (vehicle.tedder.animationNodes, started on turn-on, stopped on turn-off) and a list of effects vehicle.tedder.effects.effect(?) loaded by g_effectManager:loadEffect, each tied to an area by workAreaIndex, with a 250 ms activity window. Effect classes are absent from the dump: rendering UNVERIFIED. TRIGGER (server): in processTedderArea, if litres were actually dropped again (dropped > 0) and speed (getLastSpeed(true)) is > 0.5, the area's effects are armed (activeTime = time + 250 ms), started if needed and set to the dropped fill type (setEffectTypeInfo at start or when the type changes). The effect density is set to max(speed / speed limit, 0.6) on the player host (g_effectManager:setDensity); on a remote client, the network stream only carries the type and the active state: density is not set (onReadUpdateStream applies setEffectTypeInfo and startEffects, then handles sounds), so the effect runs there at the default density of the XML definition (UNVERIFIED: EffectManager behaviour is absent). In other words, the thrown dust/forage only appears if material is really picked up AND dropped, not when running empty. The effects therefore receive the converted (target) fill type, never a crop stage. STOP: onUpdateTick (server only, the listener is removed otherwise) stops expired effects and raises effectDirtyFlag. WEATHER/WETNESS: no data read. NETWORK: array of fill types per area (fillTypesDirtyFlag, SEND_NUM_BITS) and an active-effect boolean per effect (effectDirtyFlag); the client applies type + start/stop on reception; the client does not recompute the effect. CONDITIONS: active according to the TEDDER area type (no turn-on test in getIsWorkAreaActive: not overridden here, the activation logic comes from elsewhere, UNVERIFIED); doCheckSpeedLimit applies if turned on and implement chain lowered. isWorking = litres dropped during the pass > 0 (onEndWorkAreaProcessing). Pickup: tipToGroundAroundLine with -infinity on each input type; processing skipped for a distant client (> Tedder.CLIENT_DM_UPDATE_RADIUS, a constant not defined here, UNVERIFIED). dt: 250 ms windows in game time (g_currentMission.time). Note: onPostLoad, for an invalid workAreaIndex, calls table.insert(spec.effects, i) instead of table.remove (Tedder.lua:166), which looks like a mistake (not verified in game). The tedderWorkAreaFillTypes table is initialised with FruitType.UNKNOWN although it holds fill types. EXTENSION POINTS: registerFunctions functions (preprocessTedderArea, processTedderArea, processDropArea); overrides loadWorkAreaFromXML (adds dropWindrowWorkAreaIndex and the area effect fields), getDirtMultiplier, getWearMultiplier, doCheckSpeedLimit; events onLoad, onPostLoad, streams, onUpdateTick, onTurnedOn/Off, onStart/EndWorkAreaProcessing, onDeactivate. Default speed limit: 15.

- **Tedder** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `Tedder.initSpecialization()` | 18 | ✍ Declares the tedder area type and the XML schema: effects (vehicle.tedder.effects.effect(?)), animationNodes, type converter, sounds. Not re-read key by key. |
| `Tedder.prerequisitesPresent(specializations: any)` | 40 | ✍ Requires WorkArea and TurnOnVehicle. |
| `Tedder.registerFunctions(vehicleType: any)` | 46 | ✍ Registers preprocessTedderArea, processTedderArea and processDropArea. |
| `Tedder.registerOverwrittenFunctions(vehicleType: any)` | 54 | ✍ Overrides loadWorkAreaFromXML, getDirtMultiplier, getWearMultiplier and doCheckSpeedLimit (list not re-read line by line). |
| `Tedder.registerEventListeners(vehicleType: any)` | 63 | ✍ Subscribes to onLoad, onPostLoad, onDelete, the four stream events, onUpdateTick, onStart/EndWorkAreaProcessing, onTurnedOn/Off, onAIFieldCourseSettingsInitialized and onDeactivate (list not re-read line by line). |
| `Tedder:onLoad(savegame: any)` | 82 | ✍ Loads the type converter (warns if missing), the animations and effects (client), initialises dropped litres, the stone wear multiplier (TEDDER type) and network flags; declares to the AI the requirement of a grass windrow. |
| `Tedder:onPostLoad(savegame: any)` | 152 | ✍ Links each effect to its area (workAreaToEffects) and to the area's fill type index; removes the onUpdateTick listener off the server. Note: insertion instead of removal for an invalid index. |
| `Tedder:onDelete()` | 177 | ✍ Releases the effects and animations. |
| `Tedder:onReadStream(streamId: any, connection: any)` | 199 | ✍ Reads the fill types per area then the state of each effect, and starts/stops the effects with the area's type. |
| `Tedder:onWriteStream(streamId: any, connection: any)` | 218 | ✍ Writes the fill types per area then the sent state of each effect. |
| `Tedder:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 230 | ✍ Client side: reads, if present, the types per area and the state of each effect, applies type and start/stop then drives the work sounds; does not set the density. |
| `Tedder:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 272 | ✍ Server side: writes types (fillTypesDirtyFlag) and effect states (effectDirtyFlag). |
| `Tedder:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 292 | ✍ Server: stops the effects whose 250 ms window has expired, updates isActiveSent and the flags; on the player host, calls stopEffects. |
| `Tedder:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 323 | ✍ Forces the TEDDER type if DEFAULT; for a TEDDER area, reads the drop area (dropWindrowWorkAreaIndex) and initialises litres to drop, the last drop type and particle flags, and reserves a slot in tedderWorkAreaFillTypes. |
| `Tedder:getDirtMultiplier(superFunc: any)` | 352 | ✍ Adds the work dirt weighted by speed/limit when isWorking. |
| `Tedder:getWearMultiplier(superFunc: any)` | 366 | ✍ Adds the work wear weighted by speed/limit and by the stone multiplier. |
| `Tedder:doCheckSpeedLimit(superFunc: any)` | 385 | ✍ Applies the speed limit if the tool is turned on and the implement chain is lowered. |
| `Tedder:preprocessTedderArea(workArea: any)` | 391 | ✍ Resets the picked-up and dropped litres of the area before processing. |
| `Tedder:processTedderArea(workArea: any, dt: any)` | 398 | ✍ Picks up each converter input type along the area's line, adds the litres to drop, drops them again via processDropArea and, on the server at speed > 0.5, updates the type per area, arms and starts the effects (with density). Also reads stone presence if the tool is moving. Returns the area (line width * distance travelled) twice. |
| `Tedder:processDropArea(dropArea: any, fillType: any, litersToDrop: any)` | 501 | ✍ Drops the converted litres on the drop area's line (tipToGroundAroundLine) and stores the line offset; returns the litres actually dropped (0, 0 for a distant client: the return value is not uniform). |
| `Tedder:onStartWorkAreaProcessing(dt: any)` | 515 | ✍ Resets spec.lastDroppedLiters before the pass. |
| `Tedder:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 523 | ✍ isWorking becomes true if litres were dropped during the pass. |
| `Tedder:onTurnedOn()` | 532 | ✍ Client: starts the animationNodes. |
| `Tedder:onTurnedOff()` | 542 | ✍ Client: stops the animations and all effects. |
| `Tedder:onAIFieldCourseSettingsInitialized(fieldCourseSettings: any)` | 554 | ✍ AI course settings: borders first, initial segment worked. |
| `Tedder:onDeactivate()` | 561 | ✍ Client: stops all effects. |
| `Tedder.getDefaultSpeedLimit()` | 572 | ✍ Default speed limit: 15. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `preprocessTedderArea` | 47 |
| registerFunction | `processTedderArea` | 48 |
| registerFunction | `processDropArea` | 49 |
| registerOverwrittenFunction | `getDirtMultiplier` | 55 |
| registerOverwrittenFunction | `getWearMultiplier` | 56 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 57 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 58 |
| registerEventListener | `onLoad` | 64 |
| registerEventListener | `onPostLoad` | 65 |
| registerEventListener | `onDelete` | 66 |
| registerEventListener | `onReadStream` | 67 |
| registerEventListener | `onWriteStream` | 68 |
| registerEventListener | `onReadUpdateStream` | 69 |
| registerEventListener | `onWriteUpdateStream` | 70 |
| registerEventListener | `onUpdateTick` | 71 |
| registerEventListener | `onStartWorkAreaProcessing` | 72 |
| registerEventListener | `onEndWorkAreaProcessing` | 73 |
| registerEventListener | `onDeactivate` | 74 |
| registerEventListener | `onTurnedOn` | 75 |
| registerEventListener | `onTurnedOff` | 76 |
| registerEventListener | `onAIFieldCourseSettingsInitialized` | 77 |
