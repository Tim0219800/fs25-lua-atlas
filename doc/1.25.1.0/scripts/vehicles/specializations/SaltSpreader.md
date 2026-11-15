# vehicles/specializations/SaltSpreader.lua

Source : `dataS/scripts/vehicles/specializations/SaltSpreader.lua` — FS25 1.25.1.0

- **SaltSpreader** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SaltSpreader.initSpecialization()` | 15 |  |
| `SaltSpreader.prerequisitesPresent(specializations: table) → boolean` | 35 |  |
| `SaltSpreader.registerFunctions(vehicleType: any)` | 41 |  |
| `SaltSpreader.registerOverwrittenFunctions(vehicleType: any)` | 47 |  |
| `SaltSpreader.registerEventListeners(vehicleType: any)` | 59 |  |
| `SaltSpreader:onLoad(savegame: table)` | 70 |  |
| `SaltSpreader:onDelete()` | 92 |  |
| `SaltSpreader:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 102 |  |
| `SaltSpreader:onTurnedOn()` | 125 |  |
| `SaltSpreader:onTurnedOff()` | 139 |  |
| `SaltSpreader:doCheckSpeedLimit(superFunc: any) → boolean` | 149 |  |
| `SaltSpreader:getDirtMultiplier(superFunc: any)` | 155 |  |
| `SaltSpreader:getWearMultiplier(superFunc: any)` | 165 |  |
| `SaltSpreader:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 177 |  |
| `SaltSpreader:getCanBeTurnedOn(superFunc: any)` | 189 |  |
| `SaltSpreader:getTurnedOnNotAllowedWarning(superFunc: any)` | 200 |  |
| `SaltSpreader:getVariableWorkWidthUsage(superFunc: any) → number` | 212 |  |
| `SaltSpreader.getDefaultSpeedLimit() → number` | 234 |  |
| `SaltSpreader:processSaltSpreaderArea(workArea: any)` | 240 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `processSaltSpreaderArea` | 42 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 48 |
| registerOverwrittenFunction | `getDirtMultiplier` | 49 |
| registerOverwrittenFunction | `getWearMultiplier` | 50 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 51 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 52 |
| registerOverwrittenFunction | `getTurnedOnNotAllowedWarning` | 53 |
| registerOverwrittenFunction | `getVariableWorkWidthUsage` | 54 |
| registerEventListener | `onLoad` | 60 |
| registerEventListener | `onDelete` | 61 |
| registerEventListener | `onUpdateTick` | 62 |
| registerEventListener | `onTurnedOn` | 63 |
| registerEventListener | `onTurnedOff` | 64 |
