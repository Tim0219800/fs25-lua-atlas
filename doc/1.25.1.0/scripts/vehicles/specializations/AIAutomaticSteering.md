# vehicles/specializations/AIAutomaticSteering.lua

Source: `dataS/scripts/vehicles/specializations/AIAutomaticSteering.lua` — FS25 1.25.1.0

- **AIAutomaticSteering** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `AIAutomaticSteering.prerequisitesPresent(specializations: table) → boolean` | 43 |  |
| `AIAutomaticSteering.initSpecialization()` | 49 |  |
| `AIAutomaticSteering.registerEvents(vehicleType: any)` | 72 |  |
| `AIAutomaticSteering.registerFunctions(vehicleType: table)` | 80 |  |
| `AIAutomaticSteering.registerOverwrittenFunctions(vehicleType: table)` | 95 |  |
| `AIAutomaticSteering.registerEventListeners(vehicleType: table)` | 103 |  |
| `AIAutomaticSteering:onLoad(savegame: table)` | 126 |  |
| `AIAutomaticSteering:onPostLoad(savegame: any)` | 164 |  |
| `AIAutomaticSteering:onRegisterDashboardValueTypes()` | 192 |  |
| `AIAutomaticSteering:onDelete()` | 251 |  |
| `AIAutomaticSteering:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 260 |  |
| `AIAutomaticSteering:onReadStream(streamId: integer, connection: Connection)` | 279 |  |
| `AIAutomaticSteering:onWriteStream(streamId: integer, connection: Connection)` | 293 |  |
| `AIAutomaticSteering:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 302 |  |
| `AIAutomaticSteering:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 312 |  |
| `AIAutomaticSteering:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 326 |  |
| `AIAutomaticSteering:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 437 |  |
| `AIAutomaticSteering:onStateChange(state: any, data: any)` | 532 |  |
| `AIAutomaticSteering:onAIModeChanged(aiMode: any)` | 548 |  |
| `AIAutomaticSteering:onAIModeSettingsChanged(aiMode: any)` | 560 |  |
| `AIAutomaticSteering:onAIAutomaticSteeringLineEnd()` | 572 |  |
| `AIAutomaticSteering:onActivate()` | 579 |  |
| `AIAutomaticSteering:onLeaveVehicle(wasEntered: any)` | 592 |  |
| `AIAutomaticSteering:getAttacherToolWorkingWidth()` | 607 |  |
| `AIAutomaticSteering:getIsAutomaticSteeringAllowed()` | 629 |  |
| `AIAutomaticSteering:setAIAutomaticSteeringEnabled(isEnabled: any, segmentIndex: any, segmentIsLeft: any, noEventSend: any)` | 649 |  |
| `AIAutomaticSteering:setAIAutomaticSteeringCourse(steeringFieldCourse: any, noEventSend: any)` | 705 |  |
| `AIAutomaticSteering:generateSteeringFieldCourse(x: any, z: any, fieldCourseSettings: any)` | 738 |  |
| `AIAutomaticSteering:getIsAIAutomaticSteeringAllowed()` | 781 |  |
| `AIAutomaticSteering:getAIAutomaticSteeringState()` | 796 |  |
| `AIAutomaticSteering:getAIAutomaticSteeringLookAheadDistance()` | 811 |  |
| `AIAutomaticSteering:getIsSideOffsetReversed()` | 822 |  |
| `AIAutomaticSteering:setSteeringInput(superFunc: any, inputValue: any, isAnalog: any, deviceCategory: any)` | 834 |  |
| `AIAutomaticSteering:updateVehiclePhysics(superFunc: any, axisForward: any, axisSide: any, doHandbrake: any, dt: any)` | 860 |  |
| `AIAutomaticSteering:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 881 |  |
| `AIAutomaticSteering.actionEventSteering(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 905 |  |
| `AIAutomaticSteering.updateActionEvents(self: any)` | 911 |  |
| `AIAutomaticSteering.actionEventSteeringLines(self: any)` | 922 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onAIAutomaticSteeringLineEnd` | 73 |
| registerFunction | `getAttacherToolWorkingWidth` | 81 |
| registerFunction | `getIsAutomaticSteeringAllowed` | 82 |
| registerFunction | `setAIAutomaticSteeringEnabled` | 83 |
| registerFunction | `setAIAutomaticSteeringCourse` | 84 |
| registerFunction | `generateSteeringFieldCourse` | 85 |
| registerFunction | `getIsAIAutomaticSteeringAllowed` | 86 |
| registerFunction | `getAIAutomaticSteeringState` | 87 |
| registerFunction | `getAIAutomaticSteeringLookAheadDistance` | 88 |
| registerFunction | `getIsSideOffsetReversed` | 89 |
| registerOverwrittenFunction | `setSteeringInput` | 96 |
| registerOverwrittenFunction | `updateVehiclePhysics` | 97 |
| registerEventListener | `onLoad` | 104 |
| registerEventListener | `onPostLoad` | 105 |
| registerEventListener | `onRegisterDashboardValueTypes` | 106 |
| registerEventListener | `onDelete` | 107 |
| registerEventListener | `onReadStream` | 108 |
| registerEventListener | `onWriteStream` | 109 |
| registerEventListener | `onReadUpdateStream` | 110 |
| registerEventListener | `onWriteUpdateStream` | 111 |
| registerEventListener | `onUpdate` | 112 |
| registerEventListener | `onUpdateTick` | 113 |
| registerEventListener | `onStateChange` | 114 |
| registerEventListener | `onAIModeChanged` | 115 |
| registerEventListener | `onAIModeSettingsChanged` | 116 |
| registerEventListener | `onAIAutomaticSteeringLineEnd` | 117 |
| registerEventListener | `onActivate` | 118 |
| registerEventListener | `onLeaveVehicle` | 119 |
| registerEventListener | `onRegisterActionEvents` | 120 |
