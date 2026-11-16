# vehicles/specializations/FruitPreparer.lua

*[Version française](../../../fr/scripts/vehicles/specializations/FruitPreparer.md)*

Source: `dataS/scripts/vehicles/specializations/FruitPreparer.lua` — FS25 1.25.1.0

✍ Specialization for tools that prepare crops before harvest, such as potato haulm toppers and beet defoliators. It adds a fruitPreparer work area type that calls FSDensityMapUtil.updateFruitPreparerArea for the configured fruit types, tracks a server-side isWorking flag synced to clients, and drives sounds and animations. Also adjusts dirt/wear, speed limit checks and AI settings. Requires WorkArea and TurnOnVehicle.

- **FruitPreparer** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `FruitPreparer.initSpecialization()` | 17 | ✍ Registers the "fruitPreparer" work area type and the XML keys: fruit type(s), aiUsePreparedState, drop work area index, animation nodes, work sounds and the moveOnlyIfPreparerCut option of randomly moving parts. |
| `FruitPreparer.prerequisitesPresent(specializations: table) → boolean` | 42 | ✍ Requires the WorkArea and TurnOnVehicle specializations. |
| `FruitPreparer.registerFunctions(vehicleType: any)` | 48 | ✍ Registers processFruitPreparerArea on the vehicle type. |
| `FruitPreparer.registerOverwrittenFunctions(vehicleType: any)` | 54 | ✍ Registers overrides for work area loading, ground manipulation, speed limit check, AI fruit requirements, dirt and wear multipliers and randomly moving part loading/activity. |
| `FruitPreparer.registerEventListeners(vehicleType: any)` | 67 | ✍ Subscribes to load, delete, update stream, turn on/off, end of work area processing and AI field course settings events. |
| `FruitPreparer:onLoad(savegame: table)` | 81 | ✍ Loads sounds and animation nodes on the client and the list of fruit types to prepare (fruitType and fruitTypes). For each, registers AI fruit requirements from the fruit type's preparing growth states, or its harvesting states when it has none. Warns on unknown or missing fruit types. |
| `FruitPreparer:onDelete()` | 142 | ✍ Deletes the work sound samples and the animation nodes. |
| `FruitPreparer:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 153 | ✍ Client: reads the isWorking flag sent by the server. |
| `FruitPreparer:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 165 | ✍ Server: writes the isWorking flag to clients. |
| `FruitPreparer:onTurnedOn()` | 175 | ✍ Client: starts the work sound and the animation nodes. |
| `FruitPreparer:onTurnedOff()` | 186 | ✍ Client: stops the sounds and the animation nodes. |
| `FruitPreparer:loadWorkAreaFromXML(superFunc: table, workArea: table, xmlFile: XMLFile, key: string) → boolean` | 200 | ✍ Override that calls the parent and, for work areas of type FRUITPREPARER, reads fruitPreparer#dropWorkAreaIndex (with deprecation checks of older attributes). Returns the parent's result. |
| `FruitPreparer:getDoGroundManipulation(superFunc: any) → boolean` | 217 | ✍ Override returning the parent result only while the preparer is actually working (isWorking). |
| `FruitPreparer:doCheckSpeedLimit(superFunc: any) → boolean` | 225 | ✍ Override that also enforces the speed limit when the tool is turned on and lowered (implement chain lowered or tool lowered); otherwise uses the parent result. |
| `FruitPreparer:getAllowCutterAIFruitRequirements(superFunc: any)` | 243 | ✍ Override always returning false: cutter AI fruit requirements are not used for this tool. |
| `FruitPreparer:getDirtMultiplier(superFunc: any)` | 249 | ✍ Override that adds the work dirt multiplier scaled by speed over the speed limit while the preparer is working. |
| `FruitPreparer:getWearMultiplier(superFunc: any)` | 261 | ✍ Override that adds the work wear multiplier scaled by speed over the speed limit while the preparer is working. |
| `FruitPreparer:loadRandomlyMovingPartFromXML(superFunc: any, part: any, xmlFile: any, key: any)` | 273 | ✍ Override that reads the moveOnlyIfPreparerCut flag of a randomly moving part after the parent loader. |
| `FruitPreparer:getIsRandomlyMovingPartActive(superFunc: any, part: any)` | 283 | ✍ Override that, for parts flagged moveOnlyIfPreparerCut, requires the preparer to be working in addition to the parent's condition. |
| `FruitPreparer.getDefaultSpeedLimit() → number` | 296 | ✍ Returns the default speed limit of this tool type, 15 (unit not stated here, presumably km/h: UNVERIFIED). |
| `FruitPreparer:onEndWorkAreaProcessing(dt: any)` | 302 | ✍ Server: sets isWorking to true if the tool prepared something in the last 500 ms and raises the dirty flag when this changes, so clients get the update. |
| `FruitPreparer:onAIFieldCourseSettingsInitialized(fieldCourseSettings: any)` | 315 | ✍ Sets the AI field course so headlands are worked first and the initial segment is worked. |
| `FruitPreparer:processFruitPreparerArea(workArea: any)` | 322 | ✍ Applies FSDensityMapUtil.updateFruitPreparerArea for each configured fruit type on the work area (optionally over a separate drop area), records the last work time and returns 0 and the worked area. Clients beyond CLIENT_DM_UPDATE_RADIUS return 0, 0. Note: the worked area is overwritten per fruit type, not summed. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `processFruitPreparerArea` | 49 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 55 |
| registerOverwrittenFunction | `getDoGroundManipulation` | 56 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 57 |
| registerOverwrittenFunction | `getAllowCutterAIFruitRequirements` | 58 |
| registerOverwrittenFunction | `getDirtMultiplier` | 59 |
| registerOverwrittenFunction | `getWearMultiplier` | 60 |
| registerOverwrittenFunction | `loadRandomlyMovingPartFromXML` | 61 |
| registerOverwrittenFunction | `getIsRandomlyMovingPartActive` | 62 |
| registerEventListener | `onLoad` | 68 |
| registerEventListener | `onDelete` | 69 |
| registerEventListener | `onReadUpdateStream` | 70 |
| registerEventListener | `onWriteUpdateStream` | 71 |
| registerEventListener | `onTurnedOn` | 72 |
| registerEventListener | `onTurnedOff` | 73 |
| registerEventListener | `onEndWorkAreaProcessing` | 74 |
| registerEventListener | `onAIFieldCourseSettingsInitialized` | 75 |
