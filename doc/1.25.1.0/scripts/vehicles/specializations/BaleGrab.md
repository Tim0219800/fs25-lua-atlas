# vehicles/specializations/BaleGrab.lua

Source : `dataS/scripts/vehicles/specializations/BaleGrab.lua` — FS25 1.25.1.0

- **BaleGrab** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BaleGrab.prerequisitesPresent(specializations: any)` | 17 |  |
| `BaleGrab.initSpecialization()` | 23 |  |
| `BaleGrab.registerFunctions(vehicleType: any)` | 58 |  |
| `BaleGrab.registerOverwrittenFunctions(vehicleType: any)` | 69 |  |
| `BaleGrab.registerEventListeners(vehicleType: any)` | 75 |  |
| `BaleGrab:onLoad(savegame: table)` | 85 |  |
| `BaleGrab:onPostLoad(savegame: any)` | 190 |  |
| `BaleGrab:onDelete()` | 206 |  |
| `BaleGrab:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 239 |  |
| `BaleGrab:getMovingToolMoveValue(superFunc: any, movingTool: any)` | 326 |  |
| `BaleGrab:addDynamicMountedObject(object: table)` | 351 |  |
| `BaleGrab:removeDynamicMountedObject(object: table, isDeleting: boolean)` | 360 |  |
| `BaleGrab.onPendingObjectDelete(self: any, object: any)` | 375 |  |
| `BaleGrab.onPendingObjectMountStateChanged(self: any, object: any, mountState: any, mountObject: any)` | 384 |  |
| `BaleGrab:baleGrabTriggerCallback(triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 401 |  |
| `BaleGrab:getIsBaleGrabClosed(grab: any)` | 429 |  |
| `BaleGrab:mountBaleGrabObject(object: table) → boolean` | 478 |  |
| `BaleGrab:unmountBaleGrabObject(object: table) → boolean` | 503 |  |
| `BaleGrab:updateDebugValues(values: any)` | 511 |  |
| `BaleGrab.loadSpecValueMaxSize(xmlFile: any, minKey: any, maxKey: any)` | 572 |  |
| `BaleGrab.loadSpecValueMaxSizeRound(xmlFile: any, customEnvironment: any, baseDir: any)` | 585 |  |
| `BaleGrab.loadSpecValueMaxSizeSquare(xmlFile: any, customEnvironment: any, baseDir: any)` | 591 |  |
| `BaleGrab.getSpecValueMaxSize(specName: any, storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 597 |  |
| `BaleGrab.getSpecValueMaxSizeRound(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 625 |  |
| `BaleGrab.getSpecValueMaxSizeSquare(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 631 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `baleGrabTriggerCallback` | 59 |
| registerFunction | `addDynamicMountedObject` | 60 |
| registerFunction | `removeDynamicMountedObject` | 61 |
| registerFunction | `getIsBaleGrabClosed` | 62 |
| registerFunction | `mountBaleGrabObject` | 63 |
| registerFunction | `unmountBaleGrabObject` | 64 |
| registerOverwrittenFunction | `getMovingToolMoveValue` | 70 |
| registerEventListener | `onLoad` | 76 |
| registerEventListener | `onPostLoad` | 77 |
| registerEventListener | `onDelete` | 78 |
| registerEventListener | `onUpdateTick` | 79 |
