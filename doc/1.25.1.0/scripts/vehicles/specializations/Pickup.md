# vehicles/specializations/Pickup.lua

Source : `dataS/scripts/vehicles/specializations/Pickup.lua` — FS25 1.25.1.0

- **Pickup** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Pickup.prerequisitesPresent(specializations: any)` | 19 |  |
| `Pickup.initSpecialization()` | 25 |  |
| `Pickup.registerFunctions(vehicleType: any)` | 39 |  |
| `Pickup.registerOverwrittenFunctions(vehicleType: any)` | 48 |  |
| `Pickup.registerEventListeners(vehicleType: any)` | 60 |  |
| `Pickup:onLoad(savegame: any)` | 72 |  |
| `Pickup:onPostLoad(savegame: any)` | 78 |  |
| `Pickup:onReadStream(streamId: any, connection: any)` | 94 |  |
| `Pickup:onWriteStream(streamId: any, connection: any)` | 101 |  |
| `Pickup:onSetLoweredAll(doLowering: any, jointDescIndex: any)` | 108 |  |
| `Pickup:onRootVehicleChanged(rootVehicle: table)` | 115 |  |
| `Pickup:onFoldTimeChanged(foldAnimTime: number)` | 145 |  |
| `Pickup:actionControllerLowerPickupEvent(direction: any)` | 151 |  |
| `Pickup:setPickupState(isPickupLowered: any, noEventSend: any)` | 158 |  |
| `Pickup:allowPickingUp()` | 184 |  |
| `Pickup:getIsLowered(superFunc: any, default: any)` | 191 |  |
| `Pickup:loadPickupFromXML(xmlFile: any, key: any, spec: any)` | 198 |  |
| `Pickup:getCanChangePickupState(spec: any, newState: any)` | 217 |  |
| `Pickup:getDirtMultiplier(superFunc: any)` | 223 |  |
| `Pickup:getWearMultiplier(superFunc: any)` | 235 |  |
| `Pickup:registerLoweringActionEvent(superFunc: any, actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any)` | 247 |  |
| `Pickup:registerSelfLoweringActionEvent(superFunc: any, actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any, ignoreCollisions: any)` | 265 |  |
| `Pickup:getCanDischargeToGround(superFunc: any, dischargeNode: any)` | 271 |  |
| `Pickup:getCanDischargeToObject(superFunc: any, dischargeNode: any)` | 283 |  |
| `Pickup.updateActionEvents(self: any)` | 295 |  |
| `Pickup.actionEventTogglePickup(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 314 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `allowPickingUp` | 40 |
| registerFunction | `setPickupState` | 41 |
| registerFunction | `loadPickupFromXML` | 42 |
| registerFunction | `getCanChangePickupState` | 43 |
| registerOverwrittenFunction | `getIsLowered` | 49 |
| registerOverwrittenFunction | `getDirtMultiplier` | 50 |
| registerOverwrittenFunction | `getWearMultiplier` | 51 |
| registerOverwrittenFunction | `registerLoweringActionEvent` | 52 |
| registerOverwrittenFunction | `registerSelfLoweringActionEvent` | 53 |
| registerOverwrittenFunction | `getCanDischargeToGround` | 54 |
| registerOverwrittenFunction | `getCanDischargeToObject` | 55 |
| registerEventListener | `onLoad` | 61 |
| registerEventListener | `onPostLoad` | 62 |
| registerEventListener | `onReadStream` | 63 |
| registerEventListener | `onWriteStream` | 64 |
| registerEventListener | `onSetLoweredAll` | 65 |
| registerEventListener | `onRootVehicleChanged` | 66 |
| registerEventListener | `onFoldTimeChanged` | 67 |
