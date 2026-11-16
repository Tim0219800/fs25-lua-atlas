# vehicles/specializations/ForageWagon.lua

*[Version française](../../../fr/scripts/vehicles/specializations/ForageWagon.md)*

Source: `dataS/scripts/vehicles/specializations/ForageWagon.lua` — FS25 1.25.1.0

✍ Specialization of the forage wagon (picking up grass/hay/silage windrows from the height map, DensityMapHeightUtil). Prerequisites: FillUnit, TurnOnVehicle, Pickup, WorkArea. EFFECTS (client): fillEffects (vehicle.forageWagon.fillEffect, material flow) and startFillEffect (vehicle.forageWagon.startFillEffect, fill start effect with delay and fade) loaded by g_effectManager:loadEffect; effect classes are absent from the dump: rendering UNVERIFIED. TRIGGER: the server arms spec.fillTimer = 500 ms as soon as litres have been picked up during the pass (onEndWorkAreaProcessing); onUpdateTick counts this time down with dt and isFilling stays true while it is positive; any change of isFilling raises dirtyFlag and calls setFillEffectActive. The client receives isFilling and the fill type (FillTypeManager.SEND_NUM_BITS bits) through the initial and update streams and itself calls setFillEffectActive. The effect receives spec.lastFillType (the last material type picked up) as its type, no growth stage, no width; the density of startFillEffect is modulated by the fill level (onFillUnitFillLevelChanged: 1 - level/fillStartFadeOff). CONDITIONS: the area is active if the tool is turned on and if Pickup allows picking up (allowPickingUp, Pickup specialization not re-read: the lowered/ground contact criterion there is therefore UNVERIFIED here). The other sources only show doCheckSpeedLimit tied to turned on AND lowered. PICKUP: processForageWagonArea draws, along the area line (radius 0.5), the litres of each supported type (tipToGroundAroundLine with -infinity = suction), remembers the first type found (forcedFillType), treats wet/dry grass/hay windrows as interchangeable, applies additives on the server side (+5 % weighted by the available additive level) and accumulates the litres; workArea.pickupParticlesActive is set according to pickupLiters > 0 (field probably read by Pickup: UNVERIFIED). The returned area = line width * lastMovedDistance, only when driving forward. This script reads no weather or wetness data, and does not modify any terrain density map other than the height map (no crop map). Remark: processForageWagonArea has no client distance guard (unlike ground tools), but only the server fills the vehicle. dt: fillTimer in ms of game time. EXTENSION POINTS: functions processForageWagonArea, setFillEffectActive, fillForageWagon; overrides loadSpeedRotatingPartFromXML, getIsSpeedRotatingPartActive, getFillVolumeUVScrollSpeed, getIsWorkAreaActive, doCheckSpeedLimit, getConsumingLoad; stream events, onUpdateTick, onStart/EndWorkAreaProcessing, onTurnedOff, onDeactivate, onFillUnitFillLevelChanged. Default speed limit: 20.

- **ForageWagon** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `ForageWagon.initSpecialization()` | 15 | ✍ Declares the forageWagon area type and the XML schema: area/unit/load info indices, additives (unit, usage, types), volume UV scrolling, maxPickupLitersPerSecond, fillEffect and startFillEffect. Not re-read key by key. |
| `ForageWagon.prerequisitesPresent(specializations: any)` | 46 | ✍ Requires FillUnit, TurnOnVehicle, Pickup and WorkArea. |
| `ForageWagon.registerFunctions(vehicleType: any)` | 55 | ✍ Registers processForageWagonArea, setFillEffectActive and fillForageWagon. |
| `ForageWagon.registerOverwrittenFunctions(vehicleType: any)` | 63 | ✍ Overrides loadSpeedRotatingPartFromXML, getIsSpeedRotatingPartActive, getFillVolumeUVScrollSpeed, getIsWorkAreaActive, doCheckSpeedLimit and getConsumingLoad. |
| `ForageWagon.registerEventListeners(vehicleType: any)` | 74 | ✍ Subscribes to the stream events, onLoad, onDelete, onUpdateTick, onStart/EndWorkAreaProcessing, onTurnedOff, onDeactivate and onFillUnitFillLevelChanged (exact list not re-read). |
| `ForageWagon:onLoad(savegame: any)` | 92 | ✍ Initializes the filling state, reads area/unit/load indices, additives (default usage 0.0000275 per litre, type GRASS_WINDROW), UV scroll speeds, maximum flow (500 l/s), loads the effects (client) and a litres buffer over 750 ms; removes the onFillUnitFillLevelChanged listener if there is no startFillEffect. |
| `ForageWagon:onDelete()` | 145 | ✍ Frees the two effect groups. |
| `ForageWagon:onReadStream(streamId: any, connection: any)` | 153 | ✍ Reads isFilling and the fill type on connection and applies setFillEffectActive. |
| `ForageWagon:onWriteStream(streamId: any, connection: any)` | 162 | ✍ Writes isFillingSent and lastFillType. |
| `ForageWagon:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 170 | ✍ Client side: if the flag is raised, reads isFilling and the type, applies setFillEffectActive. |
| `ForageWagon:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 183 | ✍ Server side: writes isFillingSent and lastFillType when dirtyFlag is raised. |
| `ForageWagon:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 195 | ✍ Server: counts down fillTimer (dt), derives isFilling, broadcasts the change and triggers setFillEffectActive; feeds the buffer of picked-up litres (engine load). |
| `ForageWagon:processForageWagonArea(workArea: any)` | 218 | ✍ Picks up the windrow under the area line (forced type if already loaded, otherwise first supported type that yields litres), handles the additive on the server side, sets pickupParticlesActive and lastPickUpLiters on the area, remembers lastFillType (with network flag) and computes the area when driving forward. |
| `ForageWagon:setFillEffectActive(isActive: any)` | 299 | ✍ Applies the current fill type to the two effect groups then starts or stops them. Single entry point of the visual effects; called on server and client. |
| `ForageWagon:fillForageWagon()` | 314 | ✍ Server: pours the accumulated litres into the fill unit; if not everything fits, turns the tool off and raises the pickup. |
| `ForageWagon:loadSpeedRotatingPartFromXML(superFunc: any, speedRotatingPart: any, xmlFile: any, key: any)` | 333 | ✍ Reads the rotateOnlyIfFillLevelIncreased option of a rotating part. |
| `ForageWagon:getIsSpeedRotatingPartActive(superFunc: any, speedRotatingPart: any)` | 345 | ✍ Makes a part marked rotateOnlyIfFillLevelIncreased rotate only while isFilling. |
| `ForageWagon:getFillVolumeUVScrollSpeed(superFunc: any, fillVolumeIndex: any)` | 359 | ✍ UV scroll speed of the volume: loading value if isFilling, unloading value if unloading is in progress, otherwise the parent value. |
| `ForageWagon:getIsWorkAreaActive(superFunc: any, workArea: any)` | 375 | ✍ For the pickup area: inactive if the tool is not turned on or if allowPickingUp is false. |
| `ForageWagon:doCheckSpeedLimit(superFunc: any)` | 390 | ✍ Applies the speed limit if the tool is turned on and lowered. |
| `ForageWagon:getConsumingLoad(superFunc: any)` | 396 | ✍ Adds the pickup load (litres over 1 s / maximum flow) to the consumed load. |
| `ForageWagon:onStartWorkAreaProcessing(dt: any)` | 407 | ✍ Before the pass: forces the loaded type if there is more than the type change threshold, possibly arms the start effect delay and resets lastPickupLiters to zero. |
| `ForageWagon:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 425 | ✍ Server: if litres were picked up, lets the start effect run (delay), calls fillForageWagon and arms fillTimer = 500 ms. |
| `ForageWagon:onTurnedOff()` | 449 | ✍ Client: resets fillTimer to zero and stops the effects. |
| `ForageWagon:onDeactivate()` | 460 | ✍ Client: resets fillTimer to zero and stops the effects. |
| `ForageWagon:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 470 | ✍ Client: sets the startFillEffect density according to the fill level (fade). |
| `ForageWagon.getDefaultSpeedLimit()` | 483 | ✍ Default speed limit: 20. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `processForageWagonArea` | 56 |
| registerFunction | `setFillEffectActive` | 57 |
| registerFunction | `fillForageWagon` | 58 |
| registerOverwrittenFunction | `loadSpeedRotatingPartFromXML` | 64 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 65 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 66 |
| registerOverwrittenFunction | `getConsumingLoad` | 67 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 68 |
| registerOverwrittenFunction | `getFillVolumeUVScrollSpeed` | 69 |
| registerEventListener | `onLoad` | 75 |
| registerEventListener | `onDelete` | 76 |
| registerEventListener | `onReadStream` | 77 |
| registerEventListener | `onWriteStream` | 78 |
| registerEventListener | `onReadUpdateStream` | 79 |
| registerEventListener | `onWriteUpdateStream` | 80 |
| registerEventListener | `onUpdateTick` | 81 |
| registerEventListener | `onStartWorkAreaProcessing` | 82 |
| registerEventListener | `onEndWorkAreaProcessing` | 83 |
| registerEventListener | `onTurnedOff` | 84 |
| registerEventListener | `onDeactivate` | 85 |
| registerEventListener | `onFillUnitFillLevelChanged` | 86 |
