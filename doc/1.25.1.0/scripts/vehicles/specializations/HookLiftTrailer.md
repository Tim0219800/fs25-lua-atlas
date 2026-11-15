# vehicles/specializations/HookLiftTrailer.lua

Source : `dataS/scripts/vehicles/specializations/HookLiftTrailer.lua` — FS25 1.25.1.0

- **HookLiftTrailer** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HookLiftTrailer.prerequisitesPresent(specializations: table) → boolean` | 17 |  |
| `HookLiftTrailer.initSpecialization()` | 23 |  |
| `HookLiftTrailer.registerFunctions(vehicleType: any)` | 76 |  |
| `HookLiftTrailer.registerOverwrittenFunctions(vehicleType: any)` | 88 |  |
| `HookLiftTrailer.registerEventListeners(vehicleType: any)` | 99 |  |
| `HookLiftTrailer:onLoad(savegame: table)` | 111 |  |
| `HookLiftTrailer:onPostLoad(savegame: table)` | 202 |  |
| `HookLiftTrailer:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 214 |  |
| `HookLiftTrailer:onPostAttachImplement(attachable: table, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 279 |  |
| `HookLiftTrailer:onPreDetachImplement(implement: integer)` | 305 |  |
| `HookLiftTrailer:onUpdateAnimation(name: any)` | 334 |  |
| `HookLiftTrailer:startTipping()` | 398 |  |
| `HookLiftTrailer:stopTipping()` | 405 |  |
| `HookLiftTrailer:getIsTippingAllowed() → boolean` | 413 |  |
| `HookLiftTrailer:getCanDetachContainer()` | 420 |  |
| `HookLiftTrailer:updateHookLiftContainerLockState()` | 427 |  |
| `HookLiftTrailer:updateAdditionalHookLiftContainerJoint()` | 453 |  |
| `HookLiftTrailer:setHookLiftContainerPhysicsState(container: any, state: any)` | 511 |  |
| `HookLiftTrailer:addToPhysics(superFunc: any) → boolean` | 532 |  |
| `HookLiftTrailer:removeFromPhysics(superFunc: any)` | 547 |  |
| `HookLiftTrailer:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any) → boolean` | 564 |  |
| `HookLiftTrailer:isDetachAllowed(superFunc: any) → boolean` | 576 |  |
| `HookLiftTrailer:getDoConsumePtoPower(superFunc: any) → boolean` | 587 |  |
| `HookLiftTrailer:getPtoRpm(superFunc: any) → number` | 597 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `startTipping` | 77 |
| registerFunction | `stopTipping` | 78 |
| registerFunction | `getIsTippingAllowed` | 79 |
| registerFunction | `getCanDetachContainer` | 80 |
| registerFunction | `updateHookLiftContainerLockState` | 81 |
| registerFunction | `updateAdditionalHookLiftContainerJoint` | 82 |
| registerFunction | `setHookLiftContainerPhysicsState` | 83 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 89 |
| registerOverwrittenFunction | `isDetachAllowed` | 90 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 91 |
| registerOverwrittenFunction | `getPtoRpm` | 92 |
| registerOverwrittenFunction | `addToPhysics` | 93 |
| registerOverwrittenFunction | `removeFromPhysics` | 94 |
| registerEventListener | `onLoad` | 100 |
| registerEventListener | `onPostLoad` | 101 |
| registerEventListener | `onUpdateTick` | 102 |
| registerEventListener | `onPostAttachImplement` | 103 |
| registerEventListener | `onPreDetachImplement` | 104 |
| registerEventListener | `onUpdateAnimation` | 105 |
