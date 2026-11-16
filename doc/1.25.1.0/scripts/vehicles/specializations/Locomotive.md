# vehicles/specializations/Locomotive.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Locomotive.md)*

Source: `dataS/scripts/vehicles/specializations/Locomotive.lua` — FS25 1.25.1.0

✍ Specialization for railroad locomotives running on a spline. Requires SplineVehicle and Drivable. It holds a state machine (automatic travel, manual active/inactive, requested position, braking toward a position), replaces the vehicle physics with a simple 1D speed model (tractive effort, brake force, slope force), fakes engine RPM for the HUD, and can move a power arm toward an electricity spline. Server runs the physics; the state is broadcast with `LocomotiveStateEvent`. The `Locomotive.STATE_*` constants are defined outside this file (UNVERIFIED where).

- **Locomotive** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `Locomotive.prerequisitesPresent(specializations: table) → boolean` | 30 | ✍ Returns true only if both SplineVehicle and Drivable specializations are present. |
| `Locomotive.initSpecialization()` | 36 | ✍ Registers the XML path `vehicle.locomotive.powerArm#node`. |
| `Locomotive.registerEvents(vehicleType: any)` | 47 | ✍ Registers the specialization event `onAutomatedTrainTravelActive`, raised every update during automatic travel on the server. |
| `Locomotive.registerFunctions(vehicleType: any)` | 53 | ✍ Registers the slope force, speed, requested position, state and automated travel functions on the vehicle type. |
| `Locomotive.registerOverwrittenFunctions(vehicleType: any)` | 65 | ✍ Overrides motor state, physics, train system, name, sounds, stats, enterability, map hotspot, reset, stop-on-leave and real RPM functions. |
| `Locomotive.registerEventListeners(vehicleType: any)` | 84 | ✍ Subscribes to onLoad, onDelete, onReadStream, onWriteStream, onUpdate, onLeaveVehicle and onEnterVehicle. |
| `Locomotive:onLoad(savegame: table)` | 98 | ✍ Loads the power arm node, sets `serverMass` to 1 to avoid divisions by zero, initialises speed and RPM state, sets the idle state and subscribes to player farm changed and player created messages. |
| `Locomotive:onDelete()` | 127 | ✍ Unsubscribes from all message center messages. |
| `Locomotive:onReadStream(streamId: integer, connection: Connection)` | 135 | ✍ Client join: reads the locomotive state directly from the stream. |
| `Locomotive:onWriteStream(streamId: integer, connection: Connection)` | 143 | ✍ Server join: writes the locomotive state to the stream. |
| `Locomotive:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 149 | ✍ Once a train system exists, starts automatic travel or manual state (if rented). On the server drives the physics each frame for automatic travel, requested position (with braking-point computation), braking, and inactive manual state; clients only keep the vehicle active. |
| `Locomotive:setTrainSystem(superFunc: any, trainSystem: any)` | 232 | ✍ Override: after the parent, prepares the electricity spline data (length difference and search time) used to position the power arm, if the arm and spline exist. |
| `Locomotive:getFullName(superFunc: any)` | 250 | ✍ Override: returns the store item name for this vehicle's config file (the call is not nil-checked). |
| `Locomotive:getAreSurfaceSoundsActive(superFunc: any)` | 257 | ✍ Override: surface sounds are active when the last speed exceeds 0.1. |
| `Locomotive:getTraveledDistanceStatsActive(superFunc: any)` | 263 | ✍ Override: distance statistics count only in the manual travel active state. |
| `Locomotive:getIsEnterable(superFunc: any)` | 270 | ✍ Override: enterable only if the parent allows it, the train is within driveable range, and the state is manual (active or inactive). |
| `Locomotive:getIsMapHotspotVisible(superFunc: any)` | 285 | ✍ Override: hotspot is visible only if the parent allows it, the train is in driveable range and its position lies inside the terrain bounds. |
| `Locomotive:getMapHotspotPosition(superFunc: any)` | 304 | ✍ Override: returns the train position from the train system, or 0, 0, 0 without one. |
| `Locomotive:getMotorRpmReal(superFunc: any)` | 314 | ✍ Override: returns the simulated (virtual) RPM value instead of a real engine value. |
| `Locomotive:setRequestedSplinePosition(splinePosition: any, noEventSend: any)` | 320 | ✍ Sets a target spline position (0 to 1, wrapped to the nearer lap), switches to the requested position state and starts the motor on the server. `noEventSend` is accepted but unused. |
| `Locomotive:getDistanceToRequestedPosition()` | 340 | ✍ Returns the remaining distance to the requested position in spline length units while moving or braking toward it, 0 otherwise or if the position was overshot. |
| `Locomotive:setLocomotiveState(state: any, noEventSend: any)` | 360 | ✍ Sets the state; entering automatic travel picks a random vehicle character and manual active restores it. On the server it broadcasts `LocomotiveStateEvent` unless `noEventSend` is set. |
| `Locomotive:startAutomatedTrainTravel()` | 381 | ✍ Switches to automatic travel and starts the motor. |
| `Locomotive:notifyPlayerFarmChanged()` | 388 | ✍ Message callback: makes the locomotive tabbable only when the train is rented by the local player's farm. |
| `Locomotive:onLeaveVehicle()` | 396 | ✍ Unless in automatic travel, schedules an automatic-drive start time if ready, sets the manual inactive state and clears any requested position. |
| `Locomotive:onEnterVehicle()` | 412 | ✍ Clears requested position and scheduled start, restarts the motor if automatic motor start is off and the train was moving by itself, then sets manual active state. |
| `Locomotive:getIsReadyForAutomatedTrainTravel(superFunc: any)` | 428 | ✍ Override: not ready while a player controls the locomotive; otherwise defers to the parent. |
| `Locomotive:getIsMotorStarted(superFunc: any)` | 438 | ✍ Override: the motor counts as started also in automatic travel, requested position and requested position braking states. |
| `Locomotive:getDownhillForce()` | 448 | ✍ Returns the force along the track from gravity (server mass times 9.81 times the sine of the slope angle, positive when pointing downhill). |
| `Locomotive:getLocomotiveSpeed()` | 457 | ✍ Returns the simulated locomotive speed (m/s, sign gives direction). |
| `Locomotive.getBrakeAcceleration(self: any)` | 463 | ✍ Helper (called with the vehicle): returns the deceleration with brake force (18 percent of weight, much weaker while driven at speed) plus slope force. Uses 95 percent of the slope force if the sum is near zero. |
| `Locomotive:updateVehiclePhysics(superFunc: any, axisForward: any, axisSide: any, doHandbrake: any, dt: any)` | 494 | ✍ Override: calls the parent, then updates the simulated speed from tractive effort (capped at 300000 and at the brake force), braking, slope and cruise control, clamps it to the motor limits and updates a fake RPM pushed to the motor. |
| `Locomotive:alignToSplineTime(superFunc: any, spline: any, yOffset: any, tFront: any)` | 609 | ✍ Override: after the parent, when the power arm is within 50 m of the active camera, snaps its height to the closest point on the electricity spline. Clients also refresh the map hotspot. |
| `Locomotive:getCanBeReset(superFunc: any)` | 646 | ✍ Override: always false, locomotives cannot be reset. |
| `Locomotive:getStopMotorOnLeave(superFunc: any)` | 652 | ✍ Override: the motor stops on leaving only in the manual states. |

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
