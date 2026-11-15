# vehicles/specializations/ReceivingHopper.lua

Source: `dataS/scripts/vehicles/specializations/ReceivingHopper.lua` — FS25 1.25.1.0

- **ReceivingHopper** (l.13)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `ReceivingHopper.prerequisitesPresent(specializations: table) → boolean` | 21 |  |
| `ReceivingHopper.initSpecialization()` | 27 |  |
| `ReceivingHopper.registerFunctions(vehicleType: any)` | 44 |  |
| `ReceivingHopper.registerOverwrittenFunctions(vehicleType: any)` | 54 |  |
| `ReceivingHopper.registerEventListeners(vehicleType: any)` | 61 |  |
| `ReceivingHopper:onLoad(savegame: table)` | 71 |  |
| `ReceivingHopper:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 127 |  |
| `ReceivingHopper:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 138 |  |
| `ReceivingHopper:setCreateBoxes(state: boolean, noEventSend: boolean)` | 153 |  |
| `ReceivingHopper:getCanSpawnNextBox()` | 167 |  |
| `ReceivingHopper:collisionTestCallback(transformId: any)` | 199 |  |
| `ReceivingHopper:createBox()` | 210 |  |
| `ReceivingHopper:onCreateBoxFinished(vehicles: any, vehicleLoadState: any, arguments: any)` | 237 |  |
| `ReceivingHopper:handleDischargeRaycast(superFunc: any, dischargeNode: any, hitObject: any, hitShape: any, hitDistance: any, hitFillUnitIndex: any, hitTerrain: any)` | 248 |  |
| `ReceivingHopper:getCanBeSelected(superFunc: any)` | 269 |  |
| `ReceivingHopper:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 275 |  |
| `ReceivingHopper:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 289 |  |
| `ReceivingHopper.actionEventToggleBoxCreation(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 297 |  |
| `ReceivingHopper.updateActionEvents(self: any)` | 304 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `setCreateBoxes` | 45 |
| registerFunction | `getCanSpawnNextBox` | 46 |
| registerFunction | `collisionTestCallback` | 47 |
| registerFunction | `createBox` | 48 |
| registerFunction | `onCreateBoxFinished` | 49 |
| registerOverwrittenFunction | `handleDischargeRaycast` | 55 |
| registerOverwrittenFunction | `getCanBeSelected` | 56 |
| registerEventListener | `onLoad` | 62 |
| registerEventListener | `onUpdateTick` | 63 |
| registerEventListener | `onRegisterActionEvents` | 64 |
| registerEventListener | `onFillUnitFillLevelChanged` | 65 |
