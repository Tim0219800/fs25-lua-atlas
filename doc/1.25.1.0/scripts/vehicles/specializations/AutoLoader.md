# vehicles/specializations/AutoLoader.lua

Source : `dataS/scripts/vehicles/specializations/AutoLoader.lua` — FS25 1.25.1.0

- **AutoLoader** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AutoLoader.prerequisitesPresent(specializations: any)` | 15 |  |
| `AutoLoader.initSpecialization()` | 21 |  |
| `AutoLoader.registerFunctions(vehicleType: any)` | 47 |  |
| `AutoLoader.registerOverwrittenFunctions(vehicleType: any)` | 57 |  |
| `AutoLoader.registerEventListeners(vehicleType: any)` | 65 |  |
| `AutoLoader:onLoad(savegame: any)` | 76 |  |
| `AutoLoader:onDelete()` | 186 |  |
| `AutoLoader:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 218 |  |
| `AutoLoader:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 243 |  |
| `AutoLoader:onDraw()` | 362 |  |
| `AutoLoader:addToPhysics(superFunc: any)` | 373 |  |
| `AutoLoader:removeFromPhysics(superFunc: any)` | 392 |  |
| `AutoLoader:getIsValidAutoLoaderObject(object: any)` | 417 |  |
| `AutoLoader:autoLoaderPickupTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 448 |  |
| `AutoLoader:autoLoaderOverlapCallback(transformId: any)` | 474 |  |
| `AutoLoader:getIsAutoLoadingAllowed()` | 490 |  |
| `AutoLoader:getDynamicMountTimeToMount(superFunc: any)` | 503 |  |
| `AutoLoader:onRootVehicleChanged(rootVehicle: table)` | 510 |  |
| `AutoLoader.actionControllerEvent(self: any, direction: any)` | 535 |  |
| `AutoLoader.onDeletePendingObject(self: any, object: any)` | 548 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `autoLoaderPickupTriggerCallback` | 48 |
| registerFunction | `autoLoaderOverlapCallback` | 49 |
| registerFunction | `getIsValidAutoLoaderObject` | 50 |
| registerFunction | `getIsAutoLoadingAllowed` | 51 |
| registerFunction | `onUnmountObject` | 52 |
| registerOverwrittenFunction | `getDynamicMountTimeToMount` | 58 |
| registerOverwrittenFunction | `addToPhysics` | 59 |
| registerOverwrittenFunction | `removeFromPhysics` | 60 |
| registerEventListener | `onLoad` | 66 |
| registerEventListener | `onPostLoad` | 67 |
| registerEventListener | `onDelete` | 68 |
| registerEventListener | `onUpdate` | 69 |
| registerEventListener | `onRootVehicleChanged` | 70 |
