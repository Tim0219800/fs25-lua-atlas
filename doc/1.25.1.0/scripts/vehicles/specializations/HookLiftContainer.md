# vehicles/specializations/HookLiftContainer.lua

Source : `dataS/scripts/vehicles/specializations/HookLiftContainer.lua` — FS25 1.25.1.0

- **HookLiftContainer** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HookLiftContainer.prerequisitesPresent(specializations: table) → boolean` | 17 |  |
| `HookLiftContainer.initSpecialization()` | 23 |  |
| `HookLiftContainer.registerFunctions(vehicleType: any)` | 39 |  |
| `HookLiftContainer.registerOverwrittenFunctions(vehicleType: any)` | 45 |  |
| `HookLiftContainer.registerEventListeners(vehicleType: any)` | 56 |  |
| `HookLiftContainer:onLoad(savegame: table)` | 65 |  |
| `HookLiftContainer:getCanDischargeToObject(superFunc: any, dischargeNode: any)` | 84 |  |
| `HookLiftContainer:getCanDischargeToGround(superFunc: any, dischargeNode: any)` | 97 |  |
| `HookLiftContainer:isDetachAllowed(superFunc: any)` | 110 |  |
| `HookLiftContainer:onStartTipping(tipSideIndex: any)` | 123 |  |
| `HookLiftContainer:onStopTipping()` | 133 |  |
| `HookLiftContainer:onHookLiftContainerLockChanged(state: any)` | 144 |  |
| `HookLiftContainer:addToPhysics(superFunc: any)` | 160 |  |
| `HookLiftContainer:removeFromPhysics(superFunc: any) → boolean` | 176 |  |
| `HookLiftContainer:getBrakeForce(superFunc: any)` | 191 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onHookLiftContainerLockChanged` | 40 |
| registerOverwrittenFunction | `getCanDischargeToObject` | 46 |
| registerOverwrittenFunction | `getCanDischargeToGround` | 47 |
| registerOverwrittenFunction | `isDetachAllowed` | 48 |
| registerOverwrittenFunction | `addToPhysics` | 49 |
| registerOverwrittenFunction | `removeFromPhysics` | 50 |
| registerOverwrittenFunction | `getBrakeForce` | 51 |
| registerEventListener | `onLoad` | 57 |
| registerEventListener | `onStartTipping` | 58 |
| registerEventListener | `onStopTipping` | 59 |
