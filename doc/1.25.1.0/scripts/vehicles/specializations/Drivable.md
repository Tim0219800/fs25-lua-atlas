# vehicles/specializations/Drivable.lua

Source : `dataS/scripts/vehicles/specializations/Drivable.lua` — FS25 1.25.1.0

- **Drivable** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Drivable.prerequisitesPresent(specializations: table) → boolean` | 28 |  |
| `Drivable.initSpecialization()` | 34 |  |
| `Drivable.registerFunctions(vehicleType: any)` | 76 |  |
| `Drivable.registerOverwrittenFunctions(vehicleType: any)` | 110 |  |
| `Drivable.registerEvents(vehicleType: any)` | 118 |  |
| `Drivable.registerEventListeners(vehicleType: any)` | 125 |  |
| `Drivable:onLoad(savegame: table)` | 143 |  |
| `Drivable:onRegisterDashboardValueTypes()` | 278 |  |
| `Drivable:onDelete()` | 341 |  |
| `Drivable:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 352 |  |
| `Drivable:onReadStream(streamId: integer, connection: Connection)` | 363 |  |
| `Drivable:onWriteStream(streamId: integer, connection: Connection)` | 382 |  |
| `Drivable:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 399 |  |
| `Drivable:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 423 |  |
| `Drivable:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 440 |  |
| `Drivable:setCruiseControlState(state: integer, noEventSend: boolean)` | 804 |  |
| `Drivable:setCruiseControlMaxSpeed(speed: number, speedReverse: number)` | 835 |  |
| `Drivable:updateSteeringWheel(steeringWheel: any, dt: any, direction: any)` | 874 |  |
| `Drivable:getCruiseControlState()` | 907 |  |
| `Drivable:getCruiseControlSpeed()` | 913 |  |
| `Drivable:getCruiseControlMaxSpeed()` | 924 |  |
| `Drivable:getCruiseControlDisplayInfo() → number, boolean` | 932 |  |
| `Drivable:getAxisForward()` | 962 |  |
| `Drivable:getAccelerationAxis()` | 968 |  |
| `Drivable:getDecelerationAxis()` | 976 |  |
| `Drivable:getCruiseControlAxis()` | 988 |  |
| `Drivable:getAcDecelerationAxis()` | 995 |  |
| `Drivable:getDashboardSteeringAxis()` | 1001 |  |
| `Drivable:getDashboardCombinedPedalLeft()` | 1018 |  |
| `Drivable:getDashboardCombinedPedalRight()` | 1033 |  |
| `Drivable:setReverserDirection(reverserDirection: any)` | 1048 |  |
| `Drivable:getReverserDirection()` | 1054 |  |
| `Drivable:getSteeringDirection()` | 1060 |  |
| `Drivable:getIsDrivingForward()` | 1066 |  |
| `Drivable:getIsDrivingBackward()` | 1072 |  |
| `Drivable:getDrivingDirection()` | 1078 |  |
| `Drivable:getIsVehicleControlledByPlayer()` | 1097 |  |
| `Drivable:getIsPlayerVehicleControlAllowed() → boolean, string` | 1105 |  |
| `Drivable:registerPlayerVehicleControlAllowedFunction(vehicle: table, func: function)` | 1129 |  |
| `Drivable:stopMotor(noEventSend: boolean)` | 1141 |  |
| `Drivable:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1147 |  |
| `Drivable:onLeaveVehicle(wasEntered: any)` | 1188 |  |
| `Drivable:onSetBroken()` | 1208 |  |
| `Drivable:updateVehiclePhysics(axisForward: number, axisSide: number, doHandbrake: boolean, dt: number)` | 1223 |  |
| `Drivable:setAccelerationPedalInput(inputValue: any)` | 1293 |  |
| `Drivable:setBrakePedalInput(inputValue: any)` | 1305 |  |
| `Drivable:setTargetSpeedAndDirection(speed: any, direction: any)` | 1317 |  |
| `Drivable:setSteeringInput(inputValue: any, isAnalog: any, deviceCategory: any)` | 1331 |  |
| `Drivable:brakeToStop()` | 1342 |  |
| `Drivable:updateSteeringAngle(wheel: any, dt: any, steeringAngle: any)` | 1349 |  |
| `Drivable:getIsManualDirectionChangeAllowed(superFunc: any)` | 1370 |  |
| `Drivable:getMapHotspotRotation(superFunc: any, isPlayerHotspot: any)` | 1381 |  |
| `Drivable:setTransmissionDirection(superFunc: integer, direction: integer)` | 1392 |  |
| `Drivable.actionEventAccelerate(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1407 |  |
| `Drivable.actionEventBrake(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1427 |  |
| `Drivable.actionEventSteer(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any, deviceCategory: any, binding: any)` | 1447 |  |
| `Drivable.actionEventCruiseControlState(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1483 |  |
| `Drivable.actionEventCruiseControlValue(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1495 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `updateSteeringWheel` | 77 |
| registerFunction | `setCruiseControlState` | 78 |
| registerFunction | `setCruiseControlMaxSpeed` | 79 |
| registerFunction | `getCruiseControlState` | 80 |
| registerFunction | `getCruiseControlSpeed` | 81 |
| registerFunction | `getCruiseControlMaxSpeed` | 82 |
| registerFunction | `getCruiseControlDisplayInfo` | 83 |
| registerFunction | `getAxisForward` | 84 |
| registerFunction | `getAccelerationAxis` | 85 |
| registerFunction | `getDecelerationAxis` | 86 |
| registerFunction | `getCruiseControlAxis` | 87 |
| registerFunction | `getAcDecelerationAxis` | 88 |
| registerFunction | `getDashboardSteeringAxis` | 89 |
| registerFunction | `setReverserDirection` | 90 |
| registerFunction | `getReverserDirection` | 91 |
| registerFunction | `getSteeringDirection` | 92 |
| registerFunction | `getIsDrivingForward` | 93 |
| registerFunction | `getIsDrivingBackward` | 94 |
| registerFunction | `getDrivingDirection` | 95 |
| registerFunction | `getIsVehicleControlledByPlayer` | 96 |
| registerFunction | `getIsPlayerVehicleControlAllowed` | 97 |
| registerFunction | `registerPlayerVehicleControlAllowedFunction` | 98 |
| registerFunction | `updateVehiclePhysics` | 99 |
| registerFunction | `setAccelerationPedalInput` | 100 |
| registerFunction | `setBrakePedalInput` | 101 |
| registerFunction | `setTargetSpeedAndDirection` | 102 |
| registerFunction | `setSteeringInput` | 103 |
| registerFunction | `brakeToStop` | 104 |
| registerFunction | `updateSteeringAngle` | 105 |
| registerOverwrittenFunction | `getIsManualDirectionChangeAllowed` | 111 |
| registerOverwrittenFunction | `getMapHotspotRotation` | 112 |
| registerOverwrittenFunction | `setTransmissionDirection` | 113 |
| registerEvent | `onVehiclePhysicsUpdate` | 119 |
| registerEvent | `onCruiseControlSpeedChanged` | 120 |
| registerEventListener | `onLoad` | 126 |
| registerEventListener | `onRegisterDashboardValueTypes` | 127 |
| registerEventListener | `onDelete` | 128 |
| registerEventListener | `onReadStream` | 129 |
| registerEventListener | `onWriteStream` | 130 |
| registerEventListener | `onReadUpdateStream` | 131 |
| registerEventListener | `onWriteUpdateStream` | 132 |
| registerEventListener | `onUpdate` | 133 |
| registerEventListener | `onDraw` | 134 |
| registerEventListener | `onRegisterActionEvents` | 135 |
| registerEventListener | `onLeaveVehicle` | 136 |
| registerEventListener | `onSetBroken` | 137 |
