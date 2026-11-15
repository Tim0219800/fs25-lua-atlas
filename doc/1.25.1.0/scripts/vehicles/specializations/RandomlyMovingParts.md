# vehicles/specializations/RandomlyMovingParts.lua

Source : `dataS/scripts/vehicles/specializations/RandomlyMovingParts.lua` — FS25 1.25.1.0

- **RandomlyMovingParts** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `RandomlyMovingParts.prerequisitesPresent(specializations: table) → boolean` | 34 |  |
| `RandomlyMovingParts.initSpecialization()` | 40 |  |
| `RandomlyMovingParts.registerFunctions(vehicleType: any)` | 97 |  |
| `RandomlyMovingParts.registerEventListeners(vehicleType: any)` | 105 |  |
| `RandomlyMovingParts:onLoad(savegame: table)` | 113 |  |
| `RandomlyMovingParts:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 137 |  |
| `RandomlyMovingParts:loadRandomlyMovingPartFromXML(part: table, xmlFile: XMLFile, key: string) → boolean` | 154 |  |
| `RandomlyMovingParts:updateRandomlyMovingPart(part: table, dt: number) → boolean` | 328 |  |
| `RandomlyMovingParts:getIsRandomlyMovingPartActive(part: table) → boolean` | 386 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadRandomlyMovingPartFromXML` | 98 |
| registerFunction | `updateRandomlyMovingPart` | 99 |
| registerFunction | `getIsRandomlyMovingPartActive` | 100 |
| registerEventListener | `onLoad` | 106 |
| registerEventListener | `onUpdate` | 107 |
