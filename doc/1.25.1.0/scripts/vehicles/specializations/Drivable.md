# vehicles/specializations/Drivable.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Drivable.md)*

Source: `dataS/scripts/vehicles/specializations/Drivable.lua` — FS25 1.25.1.0

✍ Specialization that turns player input into vehicle driving: pedals, steering, handbrake, cruise control, idle (on the spot) turning, force feedback and the odometer. It requires Enterable and Motorized. The client computes the axes and sends them through the update stream; the server applies them to the motor and wheel physics. It also exposes dashboard value types and raises onVehiclePhysicsUpdate and onCruiseControlSpeedChanged.

- **Drivable** (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `Drivable.prerequisitesPresent(specializations: table) → boolean` | 28 | ✍ Returns true only if the vehicle type has both Enterable and Motorized. |
| `Drivable.initSpecialization()` | 34 | ✍ Registers the XML schema for vehicle.drivable (directions, speedRotScale, cruise control, steering wheel, idle turning, dashboards, waterSplash sound) and the savegame attributes cruiseControl, cruiseControlReverse and odometerMilage. |
| `Drivable.registerFunctions(vehicleType: any)` | 76 | ✍ Registers the specialization's vehicle functions: cruise control, axes, reverser and steering direction, input setters, player control checks and updateVehiclePhysics. |
| `Drivable.registerOverwrittenFunctions(vehicleType: any)` | 110 | ✍ Overrides getIsManualDirectionChangeAllowed, getMapHotspotRotation and setTransmissionDirection of other specializations. |
| `Drivable.registerEvents(vehicleType: any)` | 118 | ✍ Declares the events onVehiclePhysicsUpdate and onCruiseControlSpeedChanged. |
| `Drivable.registerEventListeners(vehicleType: any)` | 125 | ✍ Subscribes to load, delete, dashboard value type registration, stream read/write, update, draw, action event registration, leave vehicle and set broken events. |
| `Drivable:onLoad(savegame: table)` | 143 | ✍ Reads XML settings and initialises input, cruise control (max speeds default to the motor's maximum in km/h), steering wheel, idle turning wheels, force feedback state and the waterSplash sample. Restores cruise speeds and odometer from the savegame and creates the cruise control HUD extension. |
| `Drivable:onRegisterDashboardValueTypes()` | 278 | ✍ Registers the dashboard value types of the 'drivable' group: cruiseControl, cruiseControlReverse, cruiseControlActive, directionForward/Backward, movingDirection, acceleration and deceleration axes, steeringAngle, combined pedals and odometerMilage. |
| `Drivable:onDelete()` | 341 | ✍ Deletes the sound samples and the cruise control HUD extension. |
| `Drivable:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 352 | ✍ Saves the cruise control speed, the reverse cruise speed and the odometer value into the vehicle's savegame entry. |
| `Drivable:onReadStream(streamId: integer, connection: Connection)` | 363 | ✍ Client join sync: if cruise control is enabled for the vehicle, reads its state (2 bits), forward and reverse speeds (8 bits each) and the odometer (float32). |
| `Drivable:onWriteStream(streamId: integer, connection: Connection)` | 382 | ✍ Server join sync: writes the same cruise control state, speeds and odometer that onReadStream reads, when cruise control is enabled. |
| `Drivable:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 399 | ✍ Reads the networked forward and side axes (10 bits each, rescaled to -1..1 with tiny values zeroed), the handbrake flag and the idle turning flag. |
| `Drivable:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 423 | ✍ When the drivable dirty flag is set, writes the quantised forward and side axes, the handbrake flag and the idle turning flag. |
| `Drivable:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 440 | ✍ Main per-frame logic. Client: turns pedal, steering and cruise inputs into axisForward/axisSide (target speed, brakeToStop, idle turning, force feedback, gyroscope steering) and raises the dirty flag on change. Server: sets the motor speed limit from speed limit, cruise and idle turning, then calls updateVehiclePhysics. Also updates the steering wheel and odometer. |
| `Drivable:setCruiseControlState(state: integer, noEventSend: boolean)` | 804 | ✍ Sets the cruise control state (off, active or full). Unless noEventSend is true it sends SetCruiseControlStateEvent to the server, or to the owner connection when called on the server. Updates the toggle action text. |
| `Drivable:setCruiseControlMaxSpeed(speed: number, speedReverse: number)` | 835 | ✍ Clamps and stores the cruise speed and optional reverse speed (km/h), drops FULL state back to ACTIVE if the speed changed, adjusts the motor speed limit and raises onCruiseControlSpeedChanged. Does nothing when speed is nil. |
| `Drivable:updateSteeringWheel(steeringWheel: any, dt: any, direction: any)` | 874 | ✍ Rotates the steering wheel node from rotatedTime, using the indoor rotation range when the local player is in an inside non-passenger camera, else the outdoor one. Marks the vehicle character dirty on change. Does nothing if the wheel is nil. |
| `Drivable:getCruiseControlState()` | 907 | ✍ Returns the current cruise control state constant. |
| `Drivable:getCruiseControlSpeed()` | 913 | ✍ Returns the cruise control speed in km/h, or the maximum speed when the state is FULL. |
| `Drivable:getCruiseControlMaxSpeed()` | 924 | ✍ Returns the maximum selectable forward cruise control speed. |
| `Drivable:getCruiseControlDisplayInfo() → number, boolean` | 932 | ✍ Returns the cruise speed to show on the speedometer HUD (forward or reverse according to direction and reverser, max speed in FULL state) and whether cruise control is on. |
| `Drivable:getAxisForward()` | 962 | ✍ Returns the current forward axis value (-1 to 1). |
| `Drivable:getAccelerationAxis()` | 968 | ✍ Returns the accelerator pedal position (0 to 1), taking the moving direction and reverser into account. |
| `Drivable:getDecelerationAxis()` | 976 | ✍ Returns the brake pedal position (0 to 1) shown by dashboards; it is zero when the vehicle is almost stopped or moving opposite to the input below a speed threshold. |
| `Drivable:getCruiseControlAxis()` | 988 | ✍ Returns 1 if cruise control is not off, otherwise 0. |
| `Drivable:getAcDecelerationAxis()` | 995 | ✍ Returns the forward axis multiplied by the reverser direction, as a signed pedal value. |
| `Drivable:getDashboardSteeringAxis()` | 1001 | ✍ Returns the steering position normalised by maxRotTime (and by the reverser direction), with special handling during idle turning. Used for the steeringAngle dashboard. |
| `Drivable:getDashboardCombinedPedalLeft()` | 1018 | ✍ Dashboard value for a combined left pedal: pedal axis minus the steering value, clamped to -1..1, or a signed pedal value while idle turning. |
| `Drivable:getDashboardCombinedPedalRight()` | 1033 | ✍ Dashboard value for a combined right pedal: pedal axis plus the steering value, clamped to -1..1, or the opposite signed value while idle turning. |
| `Drivable:setReverserDirection(reverserDirection: any)` | 1048 | ✍ Stores the reverser direction (1 or -1) without any network event. |
| `Drivable:getReverserDirection()` | 1054 | ✍ Returns the reverser direction (1 forward, -1 inverted). |
| `Drivable:getSteeringDirection()` | 1060 | ✍ Returns the steering direction factor (-1 inverts steering). |
| `Drivable:getIsDrivingForward()` | 1066 | ✍ Returns true when getDrivingDirection is zero or positive (so also true when standing still). |
| `Drivable:getIsDrivingBackward()` | 1072 | ✍ Returns true when getDrivingDirection is negative. |
| `Drivable:getDrivingDirection()` | 1078 | ✍ Returns 0 when nearly stopped (or slow with no input), otherwise movingDirection times the reverser direction (+1 forward, -1 backward). |
| `Drivable:getIsVehicleControlledByPlayer()` | 1097 | ✍ Always returns true in this specialization; other specializations may override it. |
| `Drivable:getIsPlayerVehicleControlAllowed() → boolean, string` | 1105 | ✍ Runs the registered check functions of attached vehicles (dropping stale ones) and returns false plus a warning text from the first that refuses, else true. |
| `Drivable:registerPlayerVehicleControlAllowedFunction(vehicle: table, func: function)` | 1129 | ✍ Registers a check function for a given vehicle, keyed by its network object id, to be consulted before the player can control this root vehicle. |
| `Drivable:stopMotor(noEventSend: boolean)` | 1141 | ✍ Turns cruise control off without sending an event. It is not registered with registerFunctions in this file, so it is presumably called as a motor-stop hook from elsewhere: UNVERIFIED. |
| `Drivable:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1147 | ✍ Client only: registers accelerate, brake, steer, cruise toggle and cruise level actions when the vehicle is entered and active (the first four skipped while an AI drives). |
| `Drivable:onLeaveVehicle(wasEntered: any)` | 1188 | ✍ Turns cruise control off, applies the brake if the vehicle has one, and releases force feedback when the player had entered it. |
| `Drivable:onSetBroken()` | 1208 | ✍ Client only: plays the waterSplash sound sample when the vehicle becomes broken. |
| `Drivable:updateVehiclePhysics(axisForward: number, axisSide: number, doHandbrake: boolean, dt: number)` | 1223 | ✍ Server-side step: derives acceleration from the forward axis (engine on or off, cruise control forces 1), stops the motor if it cannot run, sets rotatedTime from the side axis when occupied and calls WheelsUtil.updateWheelsPhysics. Returns the acceleration. |
| `Drivable:setAccelerationPedalInput(inputValue: any)` | 1293 | ✍ Stores the accelerator input clamped to 0..1 and cancels any target speed. |
| `Drivable:setBrakePedalInput(inputValue: any)` | 1305 | ✍ Stores the brake input clamped to 0..1 and cancels any target speed. |
| `Drivable:setTargetSpeedAndDirection(speed: any, direction: any)` | 1317 | ✍ Sets a target speed and direction; speed is treated as a fraction of the motor's max forward or backward speed and converted to km/h. onUpdate then regulates the forward axis towards it. |
| `Drivable:setSteeringInput(inputValue: any, isAnalog: any, deviceCategory: any)` | 1331 | ✍ Stores the steering input for this frame; analog flag and device category are kept only when the input is non-zero. |
| `Drivable:brakeToStop()` | 1342 | ✍ Requests automatic braking down to about 1 km/h, handled by onUpdate. |
| `Drivable:updateSteeringAngle(wheel: any, dt: any, steeringAngle: any)` | 1349 | ✍ Returns the steering angle for a wheel, replaced by the configured idle turning angle (plus pi if inverted) while idle turning is active and the wheel matches. |
| `Drivable:getIsManualDirectionChangeAllowed(superFunc: any)` | 1370 | ✍ Override: returns false while idle turning is active, otherwise defers to the parent implementation. |
| `Drivable:getMapHotspotRotation(superFunc: any, isPlayerHotspot: any)` | 1381 | ✍ Override: adds 180 degrees (pi) to the map hotspot rotation when the reverser direction is inverted. |
| `Drivable:setTransmissionDirection(superFunc: integer, direction: integer)` | 1392 | ✍ Override: after the parent call, if the direction changed it swaps the forward and reverse max cruise speeds and applies the swapped cruise speeds. |
| `Drivable.actionEventAccelerate(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1407 | ✍ Input callback for the accelerate axis: warns if unpowered, checks player control is allowed, then calls setAccelerationPedalInput. |
| `Drivable.actionEventBrake(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1427 | ✍ Input callback for the brake axis: warns if unpowered, checks player control is allowed, then calls setBrakePedalInput. |
| `Drivable.actionEventSteer(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any, deviceCategory: any, binding: any)` | 1447 | ✍ Input callback for the steering axis: detects force feedback support on the binding and tracks the active device, then forwards non-zero input to setSteeringInput if control is allowed. |
| `Drivable.actionEventCruiseControlState(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1483 | ✍ Input callback for the cruise toggle: when control is allowed, flags the toggle for onUpdate, otherwise shows the warning. |
| `Drivable.actionEventCruiseControlValue(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1495 | ✍ Input callback for the cruise level axis: stores the raw input value for onUpdate. |

## Specialization

| Type | Name | Line |
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
