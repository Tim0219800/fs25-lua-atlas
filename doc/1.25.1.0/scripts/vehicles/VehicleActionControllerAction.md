# vehicles/VehicleActionControllerAction.lua

Source: `dataS/scripts/vehicles/VehicleActionControllerAction.lua` — FS25 1.25.1.0

- **VehicleActionControllerAction** (l.8)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `VehicleActionControllerAction.new(parent: any, name: any, inputAction: any, priority: any, customMt: any)` | 12 |  |
| `VehicleActionControllerAction:remove()` | 32 |  |
| `VehicleActionControllerAction:updateParent(parent: any)` | 38 |  |
| `VehicleActionControllerAction:setCallback(callbackTarget: any, inputCallback: any, inputCallbackRev: any)` | 49 |  |
| `VehicleActionControllerAction:setFinishedFunctions(finishedFunctionTarget: any, finishedFunc: any, finishedResult: any, finishedResultRev: any, finishedFuncRev: any)` | 59 |  |
| `VehicleActionControllerAction:setDeactivateFunction(deactivateFunctionTarget: any, deactivateFunc: any, inverseDeactivateFunc: any)` | 69 |  |
| `VehicleActionControllerAction:setIsAvailableFunction(availableFunc: any)` | 77 |  |
| `VehicleActionControllerAction:setIsAccessibleFunction(accessibleFunc: any)` | 83 |  |
| `VehicleActionControllerAction:setActionIcons(iconPos: any, iconNeg: any, changeColor: any)` | 89 |  |
| `VehicleActionControllerAction:setResetOnDeactivation(resetOnDeactivation: any)` | 97 |  |
| `VehicleActionControllerAction:setIsSaved(isSaved: any)` | 103 |  |
| `VehicleActionControllerAction:getIsSaved()` | 109 |  |
| `VehicleActionControllerAction:isAvailable()` | 115 |  |
| `VehicleActionControllerAction:getControlledActionIcons()` | 133 |  |
| `VehicleActionControllerAction:getLastDirection()` | 139 |  |
| `VehicleActionControllerAction:getDoResetOnDeactivation()` | 145 |  |
| `VehicleActionControllerAction:addAIEventListener(sourceVehicle: any, eventName: any, direction: any, forceUntilFinished: any)` | 151 |  |
| `VehicleActionControllerAction:registerActionEvents(target: any, vehicle: any, actionEvents: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 165 |  |
| `VehicleActionControllerAction:actionEvent(actionName: any, inputValue: any, actionIndex: any, isAnalog: any)` | 172 |  |
| `VehicleActionControllerAction:doAction(direction: any, isAIEvent: any)` | 178 |  |
| `VehicleActionControllerAction:getIsFinished(direction: any)` | 194 |  |
| `VehicleActionControllerAction:getSourceVehicle()` | 208 |  |
| `VehicleActionControllerAction:onAIEvent(eventName: any)` | 214 |  |
| `VehicleActionControllerAction:update(dt: any)` | 234 |  |
| `VehicleActionControllerAction:updateForAI(dt: any)` | 248 |  |
| `VehicleActionControllerAction:getDebugText()` | 259 |  |
