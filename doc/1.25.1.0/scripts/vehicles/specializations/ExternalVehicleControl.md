# vehicles/specializations/ExternalVehicleControl.lua

Source: `dataS/scripts/vehicles/specializations/ExternalVehicleControl.lua` — FS25 1.25.1.0

- **ExternalVehicleControlActivatable** (l.174)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `ExternalVehicleControl.prerequisitesPresent(specializations: table) → boolean` | 20 |  |
| `ExternalVehicleControl.initSpecialization()` | 26 |  |
| `ExternalVehicleControl.registerEvents(vehicleType: table)` | 41 |  |
| `ExternalVehicleControl.registerFunctions(vehicleType: table)` | 48 |  |
| `ExternalVehicleControl.registerOverwrittenFunctions(vehicleType: table)` | 55 |  |
| `ExternalVehicleControl.registerEventListeners(vehicleType: table)` | 61 |  |
| `ExternalVehicleControl:onLoadFinished(savegame: table)` | 70 |  |
| `ExternalVehicleControl:onDelete()` | 110 |  |
| `ExternalVehicleControl:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 128 |  |
| `ExternalVehicleControl:registerExternalActionEvent(trigger: any, name: any, registerFunc: any, updateFunc: any)` | 140 |  |
| `ExternalVehicleControl.onExternalVehicleControlTriggerCallback(trigger: integer, triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 157 |  |
| `ExternalVehicleControlActivatable.new(vehicle: any, trigger: any)` | 178 |  |
| `ExternalVehicleControlActivatable:registerCustomInput(inputContext: any)` | 191 |  |
| `ExternalVehicleControlActivatable:removeCustomInput(inputContext: any)` | 209 |  |
| `ExternalVehicleControlActivatable:getIsActivatable()` | 217 |  |
| `ExternalVehicleControlActivatable:run()` | 227 |  |
| `ExternalVehicleControlActivatable:getDistance(x: any, y: any, z: any)` | 232 |  |
| `ExternalVehicleControlActivatable:updateText()` | 239 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onRegisterExternalActionEvents` | 42 |
| registerFunction | `registerExternalActionEvent` | 49 |
| registerEventListener | `onLoadFinished` | 62 |
| registerEventListener | `onDelete` | 63 |
| registerEventListener | `onUpdateTick` | 64 |
