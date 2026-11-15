# vehicles/specializations/BunkerSiloCompacter.lua

Source : `dataS/scripts/vehicles/specializations/BunkerSiloCompacter.lua` — FS25 1.25.1.0

- **BunkerSiloCompacter** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BunkerSiloCompacter.prerequisitesPresent(specializations: any)` | 17 |  |
| `BunkerSiloCompacter.initSpecialization()` | 23 |  |
| `BunkerSiloCompacter.registerFunctions(vehicleType: any)` | 38 |  |
| `BunkerSiloCompacter.registerOverwrittenFunctions(vehicleType: any)` | 45 |  |
| `BunkerSiloCompacter.registerEventListeners(vehicleType: any)` | 51 |  |
| `BunkerSiloCompacter:onLoad(savegame: any)` | 59 |  |
| `BunkerSiloCompacter:onDelete()` | 79 |  |
| `BunkerSiloCompacter:loadBunkerSiloCompactorFromXML(xmlFile: any, key: any)` | 86 |  |
| `BunkerSiloCompacter:getBunkerSiloCompacterScale()` | 94 |  |
| `BunkerSiloCompacter:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 104 |  |
| `BunkerSiloCompacter:doCheckSpeedLimit(superFunc: any) → boolean` | 153 |  |
| `BunkerSiloCompacter.getDefaultSpeedLimit() → number` | 165 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadBunkerSiloCompactorFromXML` | 39 |
| registerFunction | `getBunkerSiloCompacterScale` | 40 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 46 |
| registerEventListener | `onLoad` | 52 |
| registerEventListener | `onUpdate` | 53 |
| registerEventListener | `onDelete` | 54 |
