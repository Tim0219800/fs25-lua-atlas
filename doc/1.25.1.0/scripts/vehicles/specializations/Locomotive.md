# vehicles/specializations/Locomotive.lua

Source: `dataS/scripts/vehicles/specializations/Locomotive.lua` — FS25 1.25.1.0

- **Locomotive** (l.13)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `Locomotive.prerequisitesPresent(specializations: table) → boolean` | 30 |  |
| `Locomotive.initSpecialization()` | 36 |  |
| `Locomotive.registerEvents(vehicleType: any)` | 47 |  |
| `Locomotive.registerFunctions(vehicleType: any)` | 53 |  |
| `Locomotive.registerOverwrittenFunctions(vehicleType: any)` | 65 |  |
| `Locomotive.registerEventListeners(vehicleType: any)` | 84 |  |
| `Locomotive:onLoad(savegame: table)` | 98 |  |
| `Locomotive:onDelete()` | 127 |  |
| `Locomotive:onReadStream(streamId: integer, connection: Connection)` | 135 |  |
| `Locomotive:onWriteStream(streamId: integer, connection: Connection)` | 143 |  |
| `Locomotive:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 149 |  |
| `Locomotive:setTrainSystem(superFunc: any, trainSystem: any)` | 232 |  |
| `Locomotive:getFullName(superFunc: any)` | 250 |  |
| `Locomotive:getAreSurfaceSoundsActive(superFunc: any)` | 257 |  |
| `Locomotive:getTraveledDistanceStatsActive(superFunc: any)` | 263 |  |
| `Locomotive:getIsEnterable(superFunc: any)` | 270 |  |
| `Locomotive:getIsMapHotspotVisible(superFunc: any)` | 285 |  |
| `Locomotive:getMapHotspotPosition(superFunc: any)` | 304 |  |
| `Locomotive:getMotorRpmReal(superFunc: any)` | 314 |  |
| `Locomotive:setRequestedSplinePosition(splinePosition: any, noEventSend: any)` | 320 |  |
| `Locomotive:getDistanceToRequestedPosition()` | 340 |  |
| `Locomotive:setLocomotiveState(state: any, noEventSend: any)` | 360 |  |
| `Locomotive:startAutomatedTrainTravel()` | 381 |  |
| `Locomotive:notifyPlayerFarmChanged()` | 388 |  |
| `Locomotive:onLeaveVehicle()` | 396 |  |
| `Locomotive:onEnterVehicle()` | 412 |  |
| `Locomotive:getIsReadyForAutomatedTrainTravel(superFunc: any)` | 428 |  |
| `Locomotive:getIsMotorStarted(superFunc: any)` | 438 |  |
| `Locomotive:getDownhillForce()` | 448 |  |
| `Locomotive:getLocomotiveSpeed()` | 457 |  |
| `Locomotive.getBrakeAcceleration(self: any)` | 463 |  |
| `Locomotive:updateVehiclePhysics(superFunc: any, axisForward: any, axisSide: any, doHandbrake: any, dt: any)` | 494 |  |
| `Locomotive:alignToSplineTime(superFunc: any, spline: any, yOffset: any, tFront: any)` | 609 |  |
| `Locomotive:getCanBeReset(superFunc: any)` | 646 |  |
| `Locomotive:getStopMotorOnLeave(superFunc: any)` | 652 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onAutomatedTrainTravelActive` | 48 |
| registerFunction | `getDownhillForce` | 54 |
| registerFunction | `getLocomotiveSpeed` | 55 |
| registerFunction | `setRequestedSplinePosition` | 56 |
| registerFunction | `getDistanceToRequestedPosition` | 57 |
| registerFunction | `setLocomotiveState` | 58 |
| registerFunction | `startAutomatedTrainTravel` | 59 |
| registerFunction | `notifyPlayerFarmChanged` | 60 |
| registerOverwrittenFunction | `getIsMotorStarted` | 66 |
| registerOverwrittenFunction | `updateVehiclePhysics` | 67 |
| registerOverwrittenFunction | `getIsReadyForAutomatedTrainTravel` | 68 |
| registerOverwrittenFunction | `alignToSplineTime` | 69 |
| registerOverwrittenFunction | `setTrainSystem` | 70 |
| registerOverwrittenFunction | `getFullName` | 71 |
| registerOverwrittenFunction | `getAreSurfaceSoundsActive` | 72 |
| registerOverwrittenFunction | `getTraveledDistanceStatsActive` | 73 |
| registerOverwrittenFunction | `getIsEnterable` | 74 |
| registerOverwrittenFunction | `getIsMapHotspotVisible` | 75 |
| registerOverwrittenFunction | `getCanBeReset` | 76 |
| registerOverwrittenFunction | `getStopMotorOnLeave` | 77 |
| registerOverwrittenFunction | `getMapHotspotPosition` | 78 |
| registerOverwrittenFunction | `getMotorRpmReal` | 79 |
| registerEventListener | `onLoad` | 85 |
| registerEventListener | `onDelete` | 86 |
| registerEventListener | `onReadStream` | 87 |
| registerEventListener | `onWriteStream` | 88 |
| registerEventListener | `onUpdate` | 89 |
| registerEventListener | `onLeaveVehicle` | 90 |
| registerEventListener | `onEnterVehicle` | 91 |

## Messages

- subscribes `MessageType.PLAYER_FARM_CHANGED` (l.121)
- subscribes `MessageType.PLAYER_CREATED` (l.122)
