# vehicles/specializations/Cutter.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Cutter.md)*

Source: `dataS/scripts/vehicles/specializations/Cutter.lua` — FS25 1.25.1.0

✍ Specialization for cutter bars/headers and pickups (combine, forage harvester, windrow pickup): in the density maps it determines the cut crop (processCutterArea), windrow pickup (processPickupCutterArea) and haulm drop (processHaulmDropArea), then passes litres and areas to the Combine through addCutterArea (called in onEndWorkAreaProcessing, server side). EFFECTS: two groups, loaded client side by g_effectManager:loadEffect: cutterEffects (key vehicle.cutter.effect, crop cutting effect) and fillEffects (vehicle.cutter.fillEffect, material flow) plus animationNodes; since EffectManager is absent from the dump, their rendering is UNVERIFIED. Start conditions in onUpdateTick (client and server): tool turned on, movingDirection equal to the configured one (vehicle.cutter#movingDirection), getLastSpeed() > 0.5, tool lowered (unless allowCuttingWhileRaised) and a valid Combine found (workAreaParameters.combineVehicle). The fillEffect starts if a fill type is known and the tool has cut during the last 300 ms (lastAreaBiggerZeroTime); the cutterEffect starts if a valid input fruit is known and the test area is not reset. The effect receives: fill type, fruit, growth state (setEffectTypeInfo) and the width covered by the test (setMinMaxWidth, min/max bounds and alphas normalised relative to the test area), which lets the effect be limited to the width actually cut. A cutterLoad (smoothed load 0..1, 0.95/0.05 or 0.9 decay) serves as density for the Combine and the HUD. WEATHER/WETNESS DATA: none read (no rain, wind or wetness); rain only acts in Combine.addCutterArea. Crop data used for rendering: growth state (growthState) read from the density map. NETWORK: the effect states (stage, input fruit, fill type, windrow) are sent via effectDirtyFlag (writeCutterToStream / readCutterFromStream, 4 bits for the stage) and lastAreaBiggerZero on every update; the client restores the test areas (setTestAreaRequirements) so it can drive the effect locally. On a client, the three process* functions only work if currentUpdateDistance <= Cutter.CLIENT_DM_UPDATE_RADIUS (a constant not defined in this file: value UNVERIFIED). Extension points: registered functions getCombine, getCutterLoad, getCutterStoneMultiplier, processCutterArea, processPickupCutterArea, processHaulmDropArea, setCutterCutHeight, getCutterTilt*; overrides getIsWorkAreaActive, doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, isAttachAllowed, getConsumingLoad, getIsGroundReferenceNodeThreshold, loadInputAttacherJoint, getFruitExtraObjectTypeData; default speed Cutter.getDefaultSpeedLimit. For a harvest dust mod, onUpdateTick is the only place that knows the cut width, the crop and its stage at the same time.

- **Cutter** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `Cutter.initSpecialization()` | 18 | ✍ Registers in the XML schema the keys vehicle.cutter (fruitTypes, fruitTypeCategories, fruitTypeConverter, fillTypeConverter, supportsPickupAI, cutting effect, fillEffect, allowsForageGrowthState, allowCuttingWhileRaised, movingDirection, strawRatio, haulmDrop, spiked drums, sounds, tilt) and vehicles.vehicle(?).cutter#cutHeight for the savegame. Not re-read key by key. |
| `Cutter.prerequisitesPresent(specializations: any)` | 71 | ✍ Requires WorkArea and TestAreas (the list continues on the same line, not read in full). |
| `Cutter.registerFunctions(vehicleType: any)` | 77 | ✍ Exposes getCombine, getAllowCutterAIFruitRequirements, processCutterArea, processPickupCutterArea, processHaulmDropArea, getCutterLoad, getCutterStoneMultiplier, loadCutterTiltFromXML, getCutterTiltIsAvailable, getCutterTiltIsActive, getCutterTiltDelta, the tilt raycast callbacks, setCutterCutHeight, as well as the loading/state of speed-rotating and randomly moving parts. |
| `Cutter.registerOverwrittenFunctions(vehicleType: any)` | 98 | ✍ Overrides getIsWorkAreaActive, doCheckSpeedLimit, loadWorkAreaFromXML, getDirtMultiplier, getWearMultiplier, isAttachAllowed, getConsumingLoad, getIsGroundReferenceNodeThreshold, getDefaultAllowComponentMassReduction, loadInputAttacherJoint, getFruitExtraObjectTypeData and the rotating/moving part functions. |
| `Cutter.registerEventListeners(vehicleType: any)` | 118 | ✍ Listens to onLoad, onPostLoad, onDelete, the network streams, onUpdate, onUpdateTick, onStart/EndWorkAreaProcessing, onTurnedOn/Off, onAIImplementStart and onAIFieldCourseSettingsInitialized. |
| `Cutter:onLoad(savegame: any)` | 138 | ✍ Loads the supported crops (list, categories), the crop and fill type converters, the output types, the initial cut height, the effects (cutterEffects and fillEffects, client side), the animations and sounds, the automatic tilt, the row of test areas and the internal state (cutterLoad, last fruit, windrow, dirty flag effectDirtyFlag). |
| `Cutter:onPostLoad(savegame: any)` | 397 | ✍ After loading: restores the cut height from the savegame. |
| `Cutter:onDelete()` | 407 | ✍ Deletes the cutter's effects, animations and sounds. |
| `Cutter:onReadStream(streamId: any, connection: any)` | 417 | ✍ Client side on connection: reads the synchronised cutting state (via readCutterFromStream). |
| `Cutter:onWriteStream(streamId: any, connection: any)` | 431 | ✍ Server side on connection: writes the cutting state via writeCutterToStream. |
| `Cutter:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 440 | ✍ Client side: if a flag is true, reads the cutting state; reads lastAreaBiggerZero (updates lastAreaBiggerZeroTime) then restores the test area requirements according to the current fruit. |
| `Cutter:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 459 | ✍ Server side: writes the cutting state if effectDirtyFlag is raised, then lastAreaBiggerZeroSent. |
| `Cutter:readCutterFromStream(streamId: any, connection: any)` | 473 | ✍ Reads growth state (4 bits), input fruit, validity flag, windrow mode and input fill type; recomputes the output type and the conversion factor from the converters. |
| `Cutter:writeCutterToStream(streamId: any, connection: any)` | 501 | ✍ Writes growth state, input fruit, whether this fruit is the last valid one, windrow mode and input fill type (if windrow). |
| `Cutter:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 515 | ✍ Saves the current cut height (#cutHeight). |
| `Cutter:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 522 | ✍ Per frame: applies the table's automatic tilt (rotation of nodes according to the delta computed by raycast) and, client side, repositions the drum teeth (spikedDrums) along their spline according to the drum rotation. |
| `Cutter:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 578 | ✍ Per tick: computes isEffectActive (turned on, travel direction, speed > 0.5, lowered, Combine present). If active: smooths cutterLoad, converts the test area into normalised min/max bounds (inverted according to direction), checks that the input fruit is one the Combine can process (otherwise no effect), and, client side, starts/stops fillEffects and cutterEffects (fill type, fruit, stage, width) and the cutting sound. If inactive: stops effects and sound and decays cutterLoad (x0.9). Also determines, every 500 ms, the priority output type to avoid rapid changes at the field edge, and launches the asynchronous tilt raycasts. No weather data. |
| `Cutter:getCombine(fruitTypeIndex: any, outputFillTypeIndex: any)` | 738 | ✍ Finds the Combine that accepts the fruit/output type: through its own verifyCombine or that of the carrier vehicle. |
| `Cutter:getAllowCutterAIFruitRequirements()` | 759 | ✍ Returns true: the AI applies the cutter's crop requirements. |
| `Cutter:processCutterArea(workArea: any, dt: any)` | 765 | ✍ For each usable crop: reads the area in the density map (harvest, spray factors, plowing, lime, weeds, stubble, roller, bee bonus, growth state), updates the current fruit/output type/stage (server), computes the harvest multiplier (g_currentMission:getHarvestScaleMultiplier), accumulates areas and weighted areas, drops the straw ground or the haulm in the stubble area, reads the stone state and marks isWorking. Skipped on a client that is too far. |
| `Cutter:processPickupCutterArea(workArea: any, dt: any)` | 880 | ✍ Windrow pickup: along a line, takes back the litres of the input type via tipToGroundAroundLine, applies the type conversion and the yield of cut windrows (getCutWindrowHarvestFillLevel), activates useWindrow. Client side, deduces the state from the last known pickup. |
| `Cutter:processHaulmDropArea(workArea: any, dt: any)` | 946 | ✍ Drops haulm on the area while cutting is active (last cut less than 150 ms ago, or valueDelay smoothing), clears tyre tracks. |
| `Cutter:onStartWorkAreaProcessing(dt: any)` | 986 | ✍ Before processing: looks for the Combine, resets the accumulators and picks the list of crops to test, possibly restricted to the type required by the Combine. |
| `Cutter:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 1041 | ✍ Server side: converts areas to litres, applies the type conversion, keeps statistics per output type, calls Combine:addCutterArea, updates the statistics (hectares threshed), the AI crop requirement, the effect dirty flags and lastAreaBiggerZeroTime. |
| `Cutter:getCutterLoad()` | 1141 | ✍ Table load: cutterLoad x (0.25 + 0.75 x speed / speed limit clamped to 0..1). |
| `Cutter:getCutterStoneMultiplier()` | 1148 | ✍ Wear factor due to stones according to the stone state read (1 by default). |
| `Cutter:loadCutterTiltFromXML(xmlFile: table, key: string, target: any) → boolean` | 1163 | ✍ Loads the nodes, limits and raycasts of the table's automatic tilt. |
| `Cutter:getCutterTiltIsAvailable() → boolean` | 1198 | ✍ Tells whether automatic tilt is available. |
| `Cutter:getCutterTiltIsActive(automaticTilt: any) → boolean, boolean` | 1206 | ✍ Tells whether automatic tilt is active (conditions depend on the table state and settings). |
| `Cutter:getCutterTiltDelta() → number, boolean, boolean` | 1223 | ✍ Returns the computed tilt delta, an activity flag and a return-to-neutral flag. |
| `Cutter:tiltRaycastDetectionCallbackLeft(hitObjectId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, hitShapeId: any, isLast: any)` | 1231 | ✍ Left raycast callback: stores the height of the detected ground for the tilt. |
| `Cutter:tiltRaycastDetectionCallbackRight(hitObjectId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, hitShapeId: any, isLast: any)` | 1246 | ✍ Right raycast callback: same for the right side. |
| `Cutter:setCutterCutHeight(cutHeight: any) → number` | 1300 | ✍ Stores the cut height and applies it to the attacher lowering ground distance (lowerDistanceToGround) of the cutter-type joints. |
| `Cutter:loadSpeedRotatingPartFromXML(superFunc: any, speedRotatingPart: any, xmlFile: any, key: any)` | 1329 | ✍ Adds the #rotateIfTurnedOn option (false by default) to speed-rotating parts. |
| `Cutter:getIsSpeedRotatingPartActive(superFunc: any, speedRotatingPart: any)` | 1341 | ✍ With rotateIfTurnedOn, the part is only active if the cutter is turned on. |
| `Cutter:loadRandomlyMovingPartFromXML(superFunc: any, part: any, xmlFile: any, key: any)` | 1351 | ✍ Loads the random movement option conditioned on cutting. |
| `Cutter:getIsRandomlyMovingPartActive(superFunc: any, part: any)` | 1361 | ✍ With moveOnlyIfCut, activates the part only if the cutter has cut during the last 150 ms. |
| `Cutter:getIsWorkAreaActive(superFunc: any, workArea: any)` | 1373 | ✍ A CUTTER-type area is only active if the table is lowered (unless allowCuttingWhileRaised). |
| `Cutter:doCheckSpeedLimit(superFunc: any)` | 1388 | ✍ The speed limit also applies when the cutter is turned on and lowered. |
| `Cutter:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 1394 | ✍ Reads the chopper area index (chopperArea#index) of a work area. |
| `Cutter:getDirtMultiplier(superFunc: any)` | 1404 | ✍ Adds the work dirt multiplier x (speed / limit) while isWorking. |
| `Cutter:getWearMultiplier(superFunc: any)` | 1416 | ✍ Same principle for wear, multiplied by the stone factor. |
| `Cutter:isAttachAllowed(superFunc: integer, farmId: integer, attacherVehicle: table) → boolean, string` | 1437 | ✍ Refuses attachment to a Combine whose fill types are not compatible with the cutter's output. |
| `Cutter:getConsumingLoad(superFunc: any)` | 1451 | ✍ Adds the table load to the engine's consuming load. |
| `Cutter:getIsGroundReferenceNodeThreshold(superFunc: any, groundReferenceNode: any)` | 1461 | ✍ Adds the current cut height to the contact threshold of the ground reference nodes. |
| `Cutter:getDefaultAllowComponentMassReduction()` | 1471 | ✍ Returns true. |
| `Cutter:loadInputAttacherJoint(superFunc: table, xmlFile: any, key: any, inputAttacherJoint: any, i: any)` | 1478 | ✍ Reads the #useFruitCutHeight option (true by default) of the attacher joints. |
| `Cutter:getFruitExtraObjectTypeData(superFunc: any)` | 1490 | ✍ Returns the last valid input fruit for the extra objects that depend on the fruit. |
| `Cutter:onTurnedOn()` | 1496 | ✍ Client side, starts the animationNodes. |
| `Cutter:onTurnedOff()` | 1505 | ✍ Client side, stops the animationNodes; in all cases resets the current fruits and fill types (input, output, AI). |
| `Cutter:onAIImplementStart()` | 1520 | ✍ When the AI starts, resets the crop requirements then requires the supported crops the Combine can receive. |
| `Cutter:onAIFieldCourseSettingsInitialized(fieldCourseSettings: any)` | 1547 | ✍ Forces for the AI: borders first, working the initial segment and corner cutting supported. |
| `Cutter.getDefaultSpeedLimit()` | 1555 | ✍ Default speed limit: 10. |
| `Cutter:updateDebugValues(values: any)` | 1561 | ✍ Adds to the debug display the priority output type, the cut height and the buffer distribution per fill type. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `readCutterFromStream` | 78 |
| registerFunction | `writeCutterToStream` | 79 |
| registerFunction | `getCombine` | 80 |
| registerFunction | `getAllowCutterAIFruitRequirements` | 81 |
| registerFunction | `processCutterArea` | 82 |
| registerFunction | `processPickupCutterArea` | 83 |
| registerFunction | `processHaulmDropArea` | 84 |
| registerFunction | `getCutterLoad` | 85 |
| registerFunction | `getCutterStoneMultiplier` | 86 |
| registerFunction | `loadCutterTiltFromXML` | 87 |
| registerFunction | `getCutterTiltIsAvailable` | 88 |
| registerFunction | `getCutterTiltIsActive` | 89 |
| registerFunction | `getCutterTiltDelta` | 90 |
| registerFunction | `tiltRaycastDetectionCallbackLeft` | 91 |
| registerFunction | `tiltRaycastDetectionCallbackRight` | 92 |
| registerFunction | `setCutterCutHeight` | 93 |
| registerOverwrittenFunction | `loadSpeedRotatingPartFromXML` | 99 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 100 |
| registerOverwrittenFunction | `loadRandomlyMovingPartFromXML` | 101 |
| registerOverwrittenFunction | `getIsRandomlyMovingPartActive` | 102 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 103 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 104 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 105 |
| registerOverwrittenFunction | `getDirtMultiplier` | 106 |
| registerOverwrittenFunction | `getWearMultiplier` | 107 |
| registerOverwrittenFunction | `isAttachAllowed` | 108 |
| registerOverwrittenFunction | `getConsumingLoad` | 109 |
| registerOverwrittenFunction | `getIsGroundReferenceNodeThreshold` | 110 |
| registerOverwrittenFunction | `getDefaultAllowComponentMassReduction` | 111 |
| registerOverwrittenFunction | `loadInputAttacherJoint` | 112 |
| registerOverwrittenFunction | `getFruitExtraObjectTypeData` | 113 |
| registerEventListener | `onLoad` | 119 |
| registerEventListener | `onPostLoad` | 120 |
| registerEventListener | `onDelete` | 121 |
| registerEventListener | `onReadStream` | 122 |
| registerEventListener | `onWriteStream` | 123 |
| registerEventListener | `onReadUpdateStream` | 124 |
| registerEventListener | `onWriteUpdateStream` | 125 |
| registerEventListener | `onUpdate` | 126 |
| registerEventListener | `onUpdateTick` | 127 |
| registerEventListener | `onStartWorkAreaProcessing` | 128 |
| registerEventListener | `onEndWorkAreaProcessing` | 129 |
| registerEventListener | `onTurnedOn` | 130 |
| registerEventListener | `onTurnedOff` | 131 |
| registerEventListener | `onAIImplementStart` | 132 |
| registerEventListener | `onAIFieldCourseSettingsInitialized` | 133 |
