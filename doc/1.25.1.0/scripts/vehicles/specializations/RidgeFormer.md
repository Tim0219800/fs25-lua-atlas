# vehicles/specializations/RidgeFormer.lua

Source : `dataS/scripts/vehicles/specializations/RidgeFormer.lua` — FS25 1.25.1.0


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `RidgeFormer.prerequisitesPresent(specializations: table) → boolean` | 26 |  |
| `RidgeFormer.initSpecialization()` | 32 |  |
| `RidgeFormer.registerFunctions(vehicleType: any)` | 45 |  |
| `RidgeFormer.registerOverwrittenFunctions(vehicleType: any)` | 51 |  |
| `RidgeFormer.registerEventListeners(vehicleType: any)` | 59 |  |
| `RidgeFormer:onLoad(savegame: any)` | 69 |  |
| `RidgeFormer:onDelete()` | 88 |  |
| `RidgeFormer:onDeactivate()` | 95 |  |
| `RidgeFormer:onStartWorkAreaProcessing(dt: any)` | 105 |  |
| `RidgeFormer:onEndWorkAreaProcessing(dt: any)` | 112 |  |
| `RidgeFormer:processRidgeFormerArea(workArea: any, dt: any)` | 132 |  |
| `RidgeFormer:doCheckSpeedLimit(superFunc: any)` | 169 |  |
| `RidgeFormer:getDirtMultiplier(superFunc: any)` | 176 |  |
| `RidgeFormer:getWearMultiplier(superFunc: any) → number` | 190 |  |

## Spécialisation

| Type | Nom | Ligne |
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
