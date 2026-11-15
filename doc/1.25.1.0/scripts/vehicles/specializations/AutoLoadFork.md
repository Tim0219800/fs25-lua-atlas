# vehicles/specializations/AutoLoadFork.lua

Source: `dataS/scripts/vehicles/specializations/AutoLoadFork.lua` — FS25 1.25.1.0


## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `AutoLoadFork.prerequisitesPresent(specializations: table) → boolean` | 20 |  |
| `AutoLoadFork.initSpecialization()` | 26 |  |
| `AutoLoadFork.registerFunctions(vehicleType: any)` | 46 |  |
| `AutoLoadFork.registerOverwrittenFunctions(vehicleType: any)` | 57 |  |
| `AutoLoadFork.registerEventListeners(vehicleType: any)` | 64 |  |
| `AutoLoadFork:onLoad(savegame: any)` | 76 |  |
| `AutoLoadFork:onPostLoad(savegame: any)` | 100 |  |
| `AutoLoadFork:onDelete()` | 138 |  |
| `AutoLoadFork:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 185 |  |
| `AutoLoadFork:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 210 |  |
| `AutoLoadFork:onRootVehicleChanged(rootVehicle: table)` | 224 |  |
| `AutoLoadFork.actionControllerEvent(self: any, direction: any)` | 246 |  |
| `AutoLoadFork.onDeleteMountedObject(self: any, object: any)` | 258 |  |
| `AutoLoadFork:onAutoLoadForkTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 272 |  |
| `AutoLoadFork.actionEventUnloadFork(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 360 |  |
| `AutoLoadFork:addToPhysics(superFunc: any)` | 385 |  |
| `AutoLoadFork:removeFromPhysics(superFunc: any)` | 406 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `onAutoLoadForkTriggerCallback` | 47 |
| registerFunction | `getCanUnloadFork` | 48 |
| registerFunction | `getIsForkUnloadingAllowed` | 49 |
| registerFunction | `doUnloadFork` | 50 |
| registerFunction | `onUnmountObject` | 51 |
| registerFunction | `mountObjectToFork` | 52 |
| registerOverwrittenFunction | `addToPhysics` | 58 |
| registerOverwrittenFunction | `removeFromPhysics` | 59 |
| registerEventListener | `onLoad` | 65 |
| registerEventListener | `onPostLoad` | 66 |
| registerEventListener | `onDelete` | 67 |
| registerEventListener | `onUpdate` | 68 |
| registerEventListener | `onDeactivate` | 69 |
| registerEventListener | `onRootVehicleChanged` | 70 |
| registerEventListener | `onRegisterActionEvents` | 71 |
