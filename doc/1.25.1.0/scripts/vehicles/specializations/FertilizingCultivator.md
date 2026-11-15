# vehicles/specializations/FertilizingCultivator.lua

Source : `dataS/scripts/vehicles/specializations/FertilizingCultivator.lua` — FS25 1.25.1.0

- **FertilizingCultivator** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FertilizingCultivator.prerequisitesPresent(specializations: table) → boolean` | 19 |  |
| `FertilizingCultivator.initSpecialization()` | 25 |  |
| `FertilizingCultivator.registerOverwrittenFunctions(vehicleType: any)` | 36 |  |
| `FertilizingCultivator.registerEventListeners(vehicleType: any)` | 43 |  |
| `FertilizingCultivator:onLoad(savegame: any)` | 49 |  |
| `FertilizingCultivator:processCultivatorArea(superFunc: any, workArea: any, dt: any)` | 60 |  |
| `FertilizingCultivator:setSprayerAITerrainDetailProhibitedRange(superFunc: any, fillType: any)` | 139 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `processCultivatorArea` | 37 |
| registerOverwrittenFunction | `setSprayerAITerrainDetailProhibitedRange` | 38 |
| registerEventListener | `onLoad` | 44 |
