# vehicles/specializations/SemiTrailerFront.lua

Source : `dataS/scripts/vehicles/specializations/SemiTrailerFront.lua` — FS25 1.25.1.0

- **SemiTrailerFront** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SemiTrailerFront.prerequisitesPresent(specializations: table) → boolean` | 17 |  |
| `SemiTrailerFront.registerOverwrittenFunctions(vehicleType: any)` | 23 |  |
| `SemiTrailerFront.registerEventListeners(vehicleType: any)` | 29 |  |
| `SemiTrailerFront:onLoad(savegame: table)` | 41 |  |
| `SemiTrailerFront:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 60 |  |
| `SemiTrailerFront:isDetachAllowed(superFunc: any) → boolean` | 100 |  |
| `SemiTrailerFront:onPostAttachImplement(attachable: table, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 113 |  |
| `SemiTrailerFront:onPreDetachImplement(implement: integer)` | 122 |  |
| `SemiTrailerFront:onPreDetach(attacherVehicle: table, implement: table)` | 132 |  |
| `SemiTrailerFront:onPostAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer)` | 142 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `isDetachAllowed` | 24 |
| registerEventListener | `onLoad` | 30 |
| registerEventListener | `onUpdate` | 31 |
| registerEventListener | `onPostAttachImplement` | 32 |
| registerEventListener | `onPreDetachImplement` | 33 |
| registerEventListener | `onPreDetach` | 34 |
| registerEventListener | `onPostAttach` | 35 |
