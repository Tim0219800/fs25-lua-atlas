# vehicles/specializations/Ropes.lua

Source : `dataS/scripts/vehicles/specializations/Ropes.lua` — FS25 1.25.1.0

- **Ropes** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Ropes.prerequisitesPresent(specializations: table) → boolean` | 17 |  |
| `Ropes.initSpecialization()` | 23 |  |
| `Ropes.registerFunctions(vehicleType: any)` | 53 |  |
| `Ropes.registerEventListeners(vehicleType: any)` | 61 |  |
| `Ropes:onLoad(savegame: table)` | 70 |  |
| `Ropes:onLoadFinished(savegame: table)` | 127 |  |
| `Ropes:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 136 |  |
| `Ropes:onPostUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 146 |  |
| `Ropes:loadAdjusterNode(adjusterNode: any, xmlFile: any, key: any)` | 152 |  |
| `Ropes:updateRopes(dt: any)` | 187 |  |
| `Ropes:updateAdjusterNodes(adjusterNodes: any)` | 205 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadAdjusterNode` | 54 |
| registerFunction | `updateRopes` | 55 |
| registerFunction | `updateAdjusterNodes` | 56 |
| registerEventListener | `onLoad` | 62 |
| registerEventListener | `onLoadFinished` | 63 |
| registerEventListener | `onPostUpdate` | 64 |
