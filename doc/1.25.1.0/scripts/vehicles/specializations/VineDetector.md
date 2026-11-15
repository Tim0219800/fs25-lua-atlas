# vehicles/specializations/VineDetector.lua

Source: `dataS/scripts/vehicles/specializations/VineDetector.lua` — FS25 1.25.1.0


## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `VineDetector.initSpecialization()` | 15 |  |
| `VineDetector.prerequisitesPresent(specializations: any)` | 25 |  |
| `VineDetector.registerFunctions(vehicleType: any)` | 31 |  |
| `VineDetector.registerEventListeners(vehicleType: any)` | 46 |  |
| `VineDetector:onLoad(savegame: any)` | 54 |  |
| `VineDetector:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 77 |  |

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
