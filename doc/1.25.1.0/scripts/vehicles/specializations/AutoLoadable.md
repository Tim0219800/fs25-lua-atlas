# vehicles/specializations/AutoLoadable.lua

Source : `dataS/scripts/vehicles/specializations/AutoLoadable.lua` — FS25 1.25.1.0

- **AutoLoadable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AutoLoadable.prerequisitesPresent(specializations: any)` | 15 |  |
| `AutoLoadable.registerFunctions(vehicleType: any)` | 21 |  |
| `AutoLoadable.registerEventListeners(vehicleType: any)` | 31 |  |
| `AutoLoadable:onLoad(savegame: any)` | 37 |  |
| `AutoLoadable:getAutoLoadIsSupported()` | 47 |  |
| `AutoLoadable:getAutoLoadIsAllowed()` | 54 |  |
| `AutoLoadable:getAutoLoadSize()` | 60 |  |
| `AutoLoadable:getAutoLoadBoundingBox()` | 71 |  |
| `AutoLoadable:autoLoad(autoLoader: any, node: any, posX: any, posZ: any, sizeX: any, sizeZ: any)` | 85 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getAutoLoadIsSupported` | 22 |
| registerFunction | `getAutoLoadIsAllowed` | 23 |
| registerFunction | `getAutoLoadBoundingBox` | 24 |
| registerFunction | `getAutoLoadSize` | 25 |
| registerFunction | `autoLoad` | 26 |
| registerEventListener | `onLoad` | 32 |
