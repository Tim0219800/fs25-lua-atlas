# vehicles/specializations/AutoLoadForwarder.lua

Source: `dataS/scripts/vehicles/specializations/AutoLoadForwarder.lua` — FS25 1.25.1.0


## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `AutoLoadForwarder.prerequisitesPresent(specializations: table) → boolean` | 19 |  |
| `AutoLoadForwarder.initSpecialization()` | 25 |  |
| `AutoLoadForwarder.registerEvents(vehicleType: any)` | 48 |  |
| `AutoLoadForwarder.registerFunctions(vehicleType: any)` | 54 |  |
| `AutoLoadForwarder.registerOverwrittenFunctions(vehicleType: any)` | 63 |  |
| `AutoLoadForwarder.registerEventListeners(vehicleType: any)` | 70 |  |
| `AutoLoadForwarder:onLoad(savegame: any)` | 80 |  |
| `AutoLoadForwarder:onPostLoad(savegame: any)` | 114 |  |
| `AutoLoadForwarder:onDelete()` | 146 |  |
| `AutoLoadForwarder:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 159 |  |
| `AutoLoadForwarder:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 175 |  |
| `AutoLoadForwarder:onRootVehicleChanged(rootVehicle: table)` | 277 |  |
| `AutoLoadForwarder.actionControllerEvent(self: any, direction: any)` | 302 |  |
| `AutoLoadForwarder:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 323 |  |
| `AutoLoadForwarder:addToPhysics(superFunc: any) → boolean` | 337 |  |
| `AutoLoadForwarder:mountTreeToCrane(treeId: any)` | 359 |  |
| `AutoLoadForwarder:addTreeToLoadPlaces(treeObject: any)` | 381 |  |
| `AutoLoadForwarder:removeMountedObject(object: integer, isDeleting: boolean)` | 412 |  |
| `AutoLoadForwarder:sortLoadedTreeObjects()` | 428 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onAutoLoadForwaderMountedTree` | 49 |
| registerFunction | `mountTreeToCrane` | 55 |
| registerFunction | `addTreeToLoadPlaces` | 56 |
| registerFunction | `removeMountedObject` | 57 |
| registerFunction | `sortLoadedTreeObjects` | 58 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 64 |
| registerOverwrittenFunction | `addToPhysics` | 65 |
| registerEventListener | `onLoad` | 71 |
| registerEventListener | `onPostLoad` | 72 |
| registerEventListener | `onDelete` | 73 |
| registerEventListener | `onUpdate` | 74 |
| registerEventListener | `onRootVehicleChanged` | 75 |
