# placeables/specializations/PlaceableWeighingStation.lua

Source : `dataS/scripts/placeables/specializations/PlaceableWeighingStation.lua` — FS25 1.25.1.0

- **PlaceableWeighingStation** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableWeighingStation.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableWeighingStation.registerFunctions(placeableType: any)` | 24 |  |
| `PlaceableWeighingStation.registerEventListeners(placeableType: any)` | 32 |  |
| `PlaceableWeighingStation.registerXMLPaths(schema: any, basePath: any)` | 39 |  |
| `PlaceableWeighingStation:onLoad(savegame: table)` | 61 |  |
| `PlaceableWeighingStation:onDelete()` | 115 |  |
| `PlaceableWeighingStation:updateWeightDisplay()` | 126 |  |
| `PlaceableWeighingStation:setWeightDisplay(mass: any)` | 153 |  |
| `PlaceableWeighingStation:onWeighingTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 170 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onWeighingTriggerCallback` | 25 |
| registerFunction | `updateWeightDisplay` | 26 |
| registerFunction | `setWeightDisplay` | 27 |
| registerEventListener | `onLoad` | 33 |
| registerEventListener | `onDelete` | 34 |
