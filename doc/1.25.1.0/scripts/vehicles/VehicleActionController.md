# vehicles/VehicleActionController.lua

Source : `dataS/scripts/vehicles/VehicleActionController.lua` — FS25 1.25.1.0

- **VehicleActionController** (l.8)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleActionController.new(vehicle: any, customMt: any)` | 14 |  |
| `VehicleActionController:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 35 |  |
| `VehicleActionController:load(savegame: any)` | 55 |  |
| `VehicleActionController:registerAction(name: any, inputAction: any, prio: any)` | 92 |  |
| `VehicleActionController:addAction(action: any)` | 101 |  |
| `VehicleActionController:removeAction(action: any)` | 113 |  |
| `VehicleActionController:updateSortedActions()` | 139 |  |
| `VehicleActionController:activate()` | 165 |  |
| `VehicleActionController:deactivate()` | 182 |  |
| `VehicleActionController:registerActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 192 |  |
| `VehicleActionController:actionEvent(actionName: any, inputValue: any, actionIndex: any, isAnalog: any)` | 210 |  |
| `VehicleActionController:doAction(actionIndex: any, customTable: any, direction: any)` | 216 |  |
| `VehicleActionController:actionSequenceEvent()` | 234 |  |
| `VehicleActionController:startActionSequence(force: any)` | 265 |  |
| `VehicleActionController:continueActionSequence()` | 311 |  |
| `VehicleActionController:stopActionSequence()` | 326 |  |
| `VehicleActionController:getActionsByIndex(actionIndex: any, customTable: any)` | 334 |  |
| `VehicleActionController:getAreControlledActionsAvailable()` | 344 |  |
| `VehicleActionController:getAreControlledActionsAccessible()` | 356 |  |
| `VehicleActionController:getControlledActionIcons()` | 368 |  |
| `VehicleActionController:playControlledActions()` | 381 |  |
| `VehicleActionController:resetCurrentState()` | 389 |  |
| `VehicleActionController:getActionControllerDirection()` | 395 |  |
| `VehicleActionController:update(dt: any)` | 401 |  |
| `VehicleActionController:updateForAI(dt: any)` | 468 |  |
| `VehicleActionController:onAIEvent(sourceVehicle: any, eventName: any)` | 476 |  |
| `VehicleActionController:drawDebugRendering()` | 486 |  |
| `VehicleActionController.registerXMLPaths(schema: any, basePath: any)` | 542 |  |
