# vehicles/specializations/ChainRollers.lua

Source : `dataS/scripts/vehicles/specializations/ChainRollers.lua` — FS25 1.25.1.0

- **ChainRollers** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ChainRollers.prerequisitesPresent(specializations: any)` | 15 |  |
| `ChainRollers.initSpecialization()` | 21 |  |
| `ChainRollers.registerFunctions(vehicleType: any)` | 44 |  |
| `ChainRollers.registerOverwrittenFunctions(vehicleType: any)` | 51 |  |
| `ChainRollers.registerEventListeners(vehicleType: any)` | 58 |  |
| `ChainRollers:onLoad(savegame: any)` | 66 |  |
| `ChainRollers:onLoadFinished(savegame: any)` | 94 |  |
| `ChainRollers:onPostUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 100 |  |
| `ChainRollers:loadChainRollerFromXML(xmlFile: any, key: any, chainRoller: any)` | 143 |  |
| `ChainRollers:updateChainRoller(chainRoller: any, dt: any)` | 204 |  |
| `ChainRollers:loadExtraDependentParts(superFunc: any, xmlFile: any, baseName: any, entry: any)` | 237 |  |
| `ChainRollers:updateExtraDependentParts(superFunc: any, part: any, dt: any)` | 252 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadChainRollerFromXML` | 45 |
| registerFunction | `updateChainRoller` | 46 |
| registerOverwrittenFunction | `loadExtraDependentParts` | 52 |
| registerOverwrittenFunction | `updateExtraDependentParts` | 53 |
| registerEventListener | `onLoad` | 59 |
| registerEventListener | `onLoadFinished` | 60 |
| registerEventListener | `onPostUpdate` | 61 |
