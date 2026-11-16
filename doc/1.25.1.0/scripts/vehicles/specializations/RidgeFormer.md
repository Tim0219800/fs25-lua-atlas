# vehicles/specializations/RidgeFormer.lua

*[Version française](../../../fr/scripts/vehicles/specializations/RidgeFormer.md)*

Source: `dataS/scripts/vehicles/specializations/RidgeFormer.lua` — FS25 1.25.1.0

✍ Vehicle specialization for ridge forming implements (work area type ridgeFormer). While moving it erases tire tracks and raises ridges in the density map, aligned to the nearest 90 degrees of heading, and plays a work sound. It adjusts dirt and wear (with a stone-dependent factor) and keeps the speed limit active while working. Prerequisites are none; it also calls AI ground type requirements when available.


## Functions

| Function | Line | Description |
|---|---|---|
| `RidgeFormer.prerequisitesPresent(specializations: table) → boolean` | 26 | ✍ Always returns true: no prerequisite specialization. |
| `RidgeFormer.initSpecialization()` | 32 | ✍ Registers the work area type ridgeFormer with the work area type manager and declares the XML paths of the work sound under vehicle.ridgeFormer.sounds. |
| `RidgeFormer.registerFunctions(vehicleType: any)` | 45 | ✍ Registers processRidgeFormerArea on the vehicle type. |
| `RidgeFormer.registerOverwrittenFunctions(vehicleType: any)` | 51 | ✍ Overrides doCheckSpeedLimit, getDirtMultiplier and getWearMultiplier on the vehicle type. |
| `RidgeFormer.registerEventListeners(vehicleType: any)` | 59 | ✍ Subscribes to onLoad, onDelete, onDeactivate, onStartWorkAreaProcessing and onEndWorkAreaProcessing. |
| `RidgeFormer:onLoad(savegame: any)` | 69 | ✍ Initialises the stone state and fetches the stone wear multipliers for the SOWINGMACHINE type from the stone system. Adds AI ground type requirements if supported and, on clients, loads the work sound. |
| `RidgeFormer:onDelete()` | 88 | ✍ Deletes the loaded sound samples. |
| `RidgeFormer:onDeactivate()` | 95 | ✍ On clients, stops the sound samples and resets the work sample playing flag. |
| `RidgeFormer:onStartWorkAreaProcessing(dt: any)` | 105 | ✍ Resets the isWorking flag before the work areas are processed for this frame. |
| `RidgeFormer:onEndWorkAreaProcessing(dt: any)` | 112 | ✍ On clients, starts the work sound when isWorking became true and stops it when it is false, tracking the playing state. |
| `RidgeFormer:processRidgeFormerArea(workArea: any, dt: any)` | 132 | ✍ Work area callback. Working means last speed above 0.5. Erases tire tracks in the area, then (on server, or client near enough) forms ridges in the density map with heading snapped to 90 degrees, stores the stone state, and returns changed and total area. |
| `RidgeFormer:doCheckSpeedLimit(superFunc: any)` | 169 | ✍ Returns the parent result, or true when the implement chain is lowered and the ridge former is working. |
| `RidgeFormer:getDirtMultiplier(superFunc: any)` | 176 | ✍ Adds work dirt scaled by speed over speed limit to the parent multiplier, only when moving forward and working. |
| `RidgeFormer:getWearMultiplier(superFunc: any) → number` | 190 | ✍ Adds work wear scaled by speed over speed limit and by the stone multiplier for the last stone state, to the parent multiplier, only when moving forward and working. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `processRidgeFormerArea` | 46 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 52 |
| registerOverwrittenFunction | `getDirtMultiplier` | 53 |
| registerOverwrittenFunction | `getWearMultiplier` | 54 |
| registerEventListener | `onLoad` | 60 |
| registerEventListener | `onDelete` | 61 |
| registerEventListener | `onDeactivate` | 62 |
| registerEventListener | `onStartWorkAreaProcessing` | 63 |
| registerEventListener | `onEndWorkAreaProcessing` | 64 |
