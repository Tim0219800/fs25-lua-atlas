# vehicles/specializations/VineDetector.lua

*[Version française](../../../fr/scripts/vehicles/specializations/VineDetector.md)*

Source: `dataS/scripts/vehicles/specializations/VineDetector.lua` — FS25 1.25.1.0

✍ Specialization that detects vine rows in front of a machine by casting an asynchronous downward raycast from a configured node (`vehicle.vineDetector.raycast`). It runs on the server only and uses the static-object collision mask. The detection callbacks and helper getters (raycastCallbackVineDetection, getIsValidVinePlaceable, handleVinePlaceable, hit position getters, and so on) are registered but their bodies are not in this dump (UNVERIFIED); the vine cutter and prepruner specializations override or use them.


## Functions

| Function | Line | Description |
|---|---|---|
| `VineDetector.initSpecialization()` | 15 | ✍ Registers the XML paths `vehicle.vineDetector.raycast#node` and `#maxDistance` (default 1). |
| `VineDetector.prerequisitesPresent(specializations: any)` | 25 | ✍ Always returns true: no prerequisites. |
| `VineDetector.registerFunctions(vehicleType: any)` | 31 | ✍ Registers ten functions on the vehicle type (raycast callback, finish/cancel detection, placeable validation and handling, hit position and distance getters). Their implementations are not in this file (UNVERIFIED). |
| `VineDetector.registerEventListeners(vehicleType: any)` | 46 | ✍ Subscribes to onLoad and onUpdate. |
| `VineDetector:onLoad(savegame: any)` | 54 | ✍ Loads the raycast node (warning if missing) and max distance, and initializes the raycast state table (hit positions, distance, current node) and the detection-active flag. |
| `VineDetector:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 77 | ✍ Server only: while `getCanStartVineDetection` is true, launches one asynchronous raycast at a time from the node along its -Y direction (callback `raycastCallbackVineDetection`, mask STATIC_OBJECT). When detection is no longer allowed, clears the current vine placeable and calls `finishedVineDetection`. A TODO in the source questions whether the mask is sufficient. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `raycastCallbackVineDetection` | 32 |
| registerFunction | `finishedVineDetection` | 33 |
| registerFunction | `clearCurrentVinePlaceable` | 34 |
| registerFunction | `cancelVineDetection` | 35 |
| registerFunction | `getIsValidVinePlaceable` | 36 |
| registerFunction | `handleVinePlaceable` | 37 |
| registerFunction | `getCanStartVineDetection` | 38 |
| registerFunction | `getFirstVineHitPosition` | 39 |
| registerFunction | `getCurrentVineHitPosition` | 40 |
| registerFunction | `getCurrentVineHitDistance` | 41 |
| registerEventListener | `onLoad` | 47 |
| registerEventListener | `onUpdate` | 48 |
