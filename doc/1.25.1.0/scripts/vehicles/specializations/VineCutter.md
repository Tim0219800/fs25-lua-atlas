# vehicles/specializations/VineCutter.lua

Source : `dataS/scripts/vehicles/specializations/VineCutter.lua` — FS25 1.25.1.0

- **VineCutter** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VineCutter.initSpecialization()` | 16 |  |
| `VineCutter.prerequisitesPresent(specializations: any)` | 33 |  |
| `VineCutter.registerFunctions(vehicleType: any)` | 39 |  |
| `VineCutter.registerOverwrittenFunctions(vehicleType: any)` | 46 |  |
| `VineCutter.registerEventListeners(vehicleType: any)` | 57 |  |
| `VineCutter:onLoad(savegame: any)` | 66 |  |
| `VineCutter:onDraw(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 128 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getCombine` | 40 |
| registerFunction | `harvestCallback` | 41 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 47 |
| registerOverwrittenFunction | `getCanStartVineDetection` | 48 |
| registerOverwrittenFunction | `getIsValidVinePlaceable` | 49 |
| registerOverwrittenFunction | `handleVinePlaceable` | 50 |
| registerOverwrittenFunction | `clearCurrentVinePlaceable` | 51 |
| registerOverwrittenFunction | `getAIImplementUseVineSegment` | 52 |
| registerEventListener | `onLoad` | 58 |
| registerEventListener | `onPostLoad` | 59 |
| registerEventListener | `onDraw` | 60 |
| registerEventListener | `onTurnedOff` | 61 |
