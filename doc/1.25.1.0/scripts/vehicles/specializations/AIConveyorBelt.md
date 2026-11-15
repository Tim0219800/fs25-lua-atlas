# vehicles/specializations/AIConveyorBelt.lua

Source: `dataS/scripts/vehicles/specializations/AIConveyorBelt.lua` — FS25 1.25.1.0

- **AIConveyorBelt** (l.13)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `AIConveyorBelt.prerequisitesPresent(specializations: table) → boolean` | 19 |  |
| `AIConveyorBelt.initSpecialization()` | 25 |  |
| `AIConveyorBelt.registerFunctions(vehicleType: any)` | 43 |  |
| `AIConveyorBelt.registerOverwrittenFunctions(vehicleType: any)` | 50 |  |
| `AIConveyorBelt.registerEventListeners(vehicleType: any)` | 61 |  |
| `AIConveyorBelt:onLoad(savegame: table)` | 75 |  |
| `AIConveyorBelt:onPostLoad(savegame: any)` | 105 |  |
| `AIConveyorBelt:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 114 |  |
| `AIConveyorBelt:onReadStream(streamId: integer, connection: Connection)` | 123 |  |
| `AIConveyorBelt:onWriteStream(streamId: integer, connection: Connection)` | 131 |  |
| `AIConveyorBelt:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 140 |  |
| `AIConveyorBelt:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 155 |  |
| `AIConveyorBelt:setAIConveyorBeltAngle(angle: any, noEventSend: any)` | 168 |  |
| `AIConveyorBelt:getDirectionAndSpeedToTargetAngle(direction: any, minAngle: any, maxAngle: any)` | 182 |  |
| `AIConveyorBelt:getCanStartAIVehicle(superFunc: any)` | 208 |  |
| `AIConveyorBelt:getCanStartFieldWork()` | 218 |  |
| `AIConveyorBelt:getStartableAIJob(superFunc: any)` | 224 |  |
| `AIConveyorBelt:getHasStartableAIJob(superFunc: any)` | 242 |  |
| `AIConveyorBelt:getCanBeSelected(superFunc: any)` | 248 |  |
| `AIConveyorBelt:getAINeedsTrafficCollisionBox(superFunc: any)` | 254 |  |
| `AIConveyorBelt:onAIFieldWorkerStart()` | 260 |  |
| `AIConveyorBelt:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 273 |  |
| `AIConveyorBelt.actionEventChangeAngle(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 287 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `setAIConveyorBeltAngle` | 44 |
| registerFunction | `getDirectionAndSpeedToTargetAngle` | 45 |
| registerOverwrittenFunction | `getStartableAIJob` | 51 |
| registerOverwrittenFunction | `getHasStartableAIJob` | 52 |
| registerOverwrittenFunction | `getCanStartFieldWork` | 53 |
| registerOverwrittenFunction | `getCanStartAIVehicle` | 54 |
| registerOverwrittenFunction | `getCanBeSelected` | 55 |
| registerOverwrittenFunction | `getAINeedsTrafficCollisionBox` | 56 |
| registerEventListener | `onLoad` | 62 |
| registerEventListener | `onPostLoad` | 63 |
| registerEventListener | `onReadStream` | 64 |
| registerEventListener | `onWriteStream` | 65 |
| registerEventListener | `onUpdate` | 66 |
| registerEventListener | `onUpdateTick` | 67 |
| registerEventListener | `onAIFieldWorkerStart` | 68 |
| registerEventListener | `onRegisterActionEvents` | 69 |
