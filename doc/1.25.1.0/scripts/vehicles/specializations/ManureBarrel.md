# vehicles/specializations/ManureBarrel.lua

Source : `dataS/scripts/vehicles/specializations/ManureBarrel.lua` — FS25 1.25.1.0

- **ManureBarrel** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ManureBarrel.prerequisitesPresent(specializations: any)` | 15 |  |
| `ManureBarrel.initSpecialization()` | 21 |  |
| `ManureBarrel.registerOverwrittenFunctions(vehicleType: any)` | 32 |  |
| `ManureBarrel.registerEventListeners(vehicleType: any)` | 39 |  |
| `ManureBarrel:onLoad(savegame: any)` | 47 |  |
| `ManureBarrel:onPostAttachImplement(attachable: any, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 57 |  |
| `ManureBarrel:onPostDetachImplement(implementIndex: any)` | 66 |  |
| `ManureBarrel:getAreEffectsVisible(superFunc: any)` | 84 |  |
| `ManureBarrel:getIsWorkAreaActive(superFunc: any, workArea: any)` | 96 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `getAreEffectsVisible` | 33 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 34 |
| registerEventListener | `onLoad` | 40 |
| registerEventListener | `onPostAttachImplement` | 41 |
| registerEventListener | `onPostDetachImplement` | 42 |
