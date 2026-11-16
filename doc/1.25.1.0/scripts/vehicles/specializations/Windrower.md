# vehicles/specializations/Windrower.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Windrower.md)*

Source: `dataS/scripts/vehicles/specializations/Windrower.lua` — FS25 1.25.1.0

✍ Windrower specialization: picks up the spread forage (types listed by vehicle.windrower#fillTypes / #fillTypeCategories) on the work area via the height map (DensityMapHeightUtil.tipToGroundAroundLine with -infinity) and deposits it as a windrow in a drop area (dropWindrowWorkAreaIndex). Same architecture as Tedder. EFFECTS: animationNodes (client, started on switch-on) and a list vehicle.windrower.effects.effect(?) loaded by g_effectManager:loadEffect, each bound to an area (workAreaIndex) and optionally to a drop area (dropAreaIndex), activity window 250 ms; if the effect exposes setWorkAreaIndex, the area is communicated to it. Effect classes absent from the dump: rendering UNVERIFIED. TRIGGER (server): in processWindrowerArea, when the area picked up liters, if the drop actually deposited material (dropped > 0) and the speed (getLastSpeed(true)) exceeds 0.5, the effects of the area whose dropAreaIndex matches are armed (activeTime = time + 250 ms), started if needed and set to the deposited type (setEffectTypeInfo). No density set (unlike Tedder). The type passed is that of the last windrow picked up (lastValidPickupFillType), never a crop stage. Each pickup also calls setTestAreaRequirements(nil, type, nil) with the picked-up type (exact role in rendering UNVERIFIED: function outside this file). CONDITIONS: isWorking = speed > 0.5 when an area is processed; doCheckSpeedLimit applies if on (or without TurnOnVehicle) and the chain is lowered; no switch-on test in the area itself (getIsWorkAreaActive not overridden here: UNVERIFIED). Processing skipped for a distant client (> Windrower.CLIENT_DM_UPDATE_RADIUS, constant not defined here: UNVERIFIED). STOP: onUpdateTick (server side) cuts expired effects and raises effectDirtyFlag; onTurnedOff cuts everything. On a dedicated server, g_effectManager is called without an isClient guard (harmless? not verified). WEATHER/MOISTURE: no data read. NETWORK: fill types per area (fillTypesDirtyFlag) and a boolean per effect (effectDirtyFlag), broadcast in the initial stream and in updates; the client applies type and start/stop. dt: 250 ms of game time; no dt in the drop physics. Note: onPostLoad uses table.insert(spec.effects, i) instead of table.remove for an invalid index (Windrower.lua:171), likely a mistake (not verified in game). particleSystemIndex is read in loadWorkAreaFromXML but never used in this file (leftover of the old particle system; the vehicle.windrowerParticleSystems keys are flagged obsolete). EXTENSION POINTS: functions processWindrowerArea, processDropArea; overrides doCheckSpeedLimit, loadWorkAreaFromXML (WINDROWER type), getDirtMultiplier, getWearMultiplier; events onLoad, onPostLoad, streams, onUpdateTick, onTurnedOn/Off, onStart/EndWorkAreaProcessing, onAIFieldCourseSettingsInitialized. Default speed limit: 15.

- **Windrower** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `Windrower.initSpecialization()` | 17 | ✍ Declares the windrower area type and the XML schema: effects, animationNodes, supported fill types, limitToLineHeight, sounds. Not reread key by key. |
| `Windrower.prerequisitesPresent(specializations: any)` | 46 | ✍ Requires the WorkArea specialization (only). |
| `Windrower.registerFunctions(vehicleType: any)` | 52 | ✍ Registers processWindrowerArea and processDropArea. |
| `Windrower.registerOverwrittenFunctions(vehicleType: any)` | 59 | ✍ Overrides doCheckSpeedLimit, loadWorkAreaFromXML, getDirtMultiplier and getWearMultiplier. |
| `Windrower.registerEventListeners(vehicleType: any)` | 68 | ✍ Subscribes to onLoad, onPostLoad, onDelete, the four stream events, onUpdateTick, onTurnedOn/Off, onStart/EndWorkAreaProcessing and onAIFieldCourseSettingsInitialized (list not reread line by line). |
| `Windrower:onLoad(savegame: any)` | 86 | ✍ Loads animations and effects (client), reads limitToLineHeight and the supported types list, initializes the stone wear multiplier (WINDROWER type) and the network flags, declares to the AI the required height types. |
| `Windrower:onPostLoad(savegame: any)` | 157 | ✍ Binds each effect to its work area and to the area's type index; warns if the index is invalid (with the faulty insertion noted in the module). |
| `Windrower:onDelete()` | 178 | ✍ Releases animations and effects. |
| `Windrower:onReadStream(streamId: any, connection: any)` | 193 | ✍ Reads the fill types per area then the state of each effect; starts or stops the effects with the area's type. |
| `Windrower:onWriteStream(streamId: any, connection: any)` | 217 | ✍ Writes the types per area then the sent state of each effect. |
| `Windrower:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 229 | ✍ Client side: reads effect types and states if present, applies start/stop with setEffectTypeInfo. |
| `Windrower:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 261 | ✍ Server side: writes types (fillTypesDirtyFlag) and states (effectDirtyFlag). |
| `Windrower:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 281 | ✍ Server: cuts the effects whose 250 ms window has expired and raises effectDirtyFlag. |
| `Windrower:onTurnedOn()` | 301 | ✍ Client: starts the work sound and the animationNodes. |
| `Windrower:onTurnedOff()` | 311 | ✍ Cuts all the effects (without a client guard) and stops the animations. |
| `Windrower:doCheckSpeedLimit(superFunc: any)` | 324 | ✍ Applies the speed limit if the implement chain is lowered and the implement is on (or cannot be turned on). |
| `Windrower.getDefaultSpeedLimit()` | 335 | ✍ Default speed limit: 15. |
| `Windrower:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 341 | ✍ Forces the WINDROWER type if DEFAULT; for a WINDROWER area reads particleSystemIndex (unused) and the drop area, initializes liters and type, reserves a slot in windrowerWorkAreaFillTypes. |
| `Windrower:getDirtMultiplier(superFunc: any)` | 370 | ✍ Adds the work dirt weighted by speed/limit when isWorking. |
| `Windrower:getWearMultiplier(superFunc: any)` | 384 | ✍ Adds the work wear weighted by speed/limit and by the stone multiplier. |
| `Windrower:onStartWorkAreaProcessing(dt: any, workAreas: any)` | 403 | ✍ Resets, for each area, the picked-up valid type, picked-up and deposited liters; isWorking = false. |
| `Windrower:onEndWorkAreaProcessing(dt: any, workAreas: any)` | 415 | ✍ Client without TurnOnVehicle: starts/stops the work sound according to isWorking. No visual effect here. |
| `Windrower:onAIFieldCourseSettingsInitialized(fieldCourseSettings: any)` | 435 | ✍ AI course settings: borders first, initial segment worked. |
| `Windrower:processWindrowerArea(workArea: any, dt: any)` | 442 | ✍ Picks up the windrow under the area: looks for a supported type (or reuses the last type, fresh and dry grass being equivalent), remembers lastValidPickupFillType and calls setTestAreaRequirements, accumulates liters to deposit, deposits via processDropArea and, on the server at speed > 0.5 with an actual drop, updates the type per area and arms/starts the effects. Returns deposited liters and area (width * distance traveled). |
| `Windrower:processDropArea(dropArea: any, litersToDrop: any, fillType: any)` | 562 | ✍ Deposits the liters on the line of the drop area (tipToGroundAroundLine), remembers the line offset and returns the liters actually deposited. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `processWindrowerArea` | 53 |
| registerFunction | `processDropArea` | 54 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 60 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 61 |
| registerOverwrittenFunction | `getDirtMultiplier` | 62 |
| registerOverwrittenFunction | `getWearMultiplier` | 63 |
| registerEventListener | `onLoad` | 69 |
| registerEventListener | `onPostLoad` | 70 |
| registerEventListener | `onDelete` | 71 |
| registerEventListener | `onReadStream` | 72 |
| registerEventListener | `onWriteStream` | 73 |
| registerEventListener | `onReadUpdateStream` | 74 |
| registerEventListener | `onWriteUpdateStream` | 75 |
| registerEventListener | `onUpdateTick` | 76 |
| registerEventListener | `onTurnedOn` | 77 |
| registerEventListener | `onTurnedOff` | 78 |
| registerEventListener | `onStartWorkAreaProcessing` | 79 |
| registerEventListener | `onEndWorkAreaProcessing` | 80 |
| registerEventListener | `onAIFieldCourseSettingsInitialized` | 81 |
