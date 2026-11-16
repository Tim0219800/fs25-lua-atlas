# vehicles/specializations/CrabSteering.lua

*[Version française](../../../fr/scripts/vehicles/specializations/CrabSteering.md)*

Source: `dataS/scripts/vehicles/specializations/CrabSteering.lua` — FS25 1.25.1.0

✍ Specialization for vehicles with several selectable steering modes (all-wheel, crab, rear-wheel, etc.). Each mode, loaded from 'vehicle.crabSteering', can offset or lock wheels and steering nodes, move nodes, play animations, change the steering center and the articulated axis; the active mode index is saved and synchronized, and a HUD extension is created. Requires Drivable, Wheels and AnimatedVehicle. Several functions registered here (getCrabSteeringModeAvailable, getNumCrabSteeringModesAvailable, getCrabSteeringMode, setNextCrabSteeringMode, onDelete, onDraw) have no body in the SDK dump: UNVERIFIED.

- **CrabSteering** (l.10)

## Functions

| Function | Line | Description |
|---|---|---|
| `CrabSteering.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Returns true only if the vehicle type has Drivable, Wheels and AnimatedVehicle. |
| `CrabSteering.initSpecialization()` | 28 | ✍ Registers the XML schema for crab steering (rear wheel distance, AI mode index, toggle speed, steering modes, per-configuration modes, dashboards with a 'states' list), the wheel configuration 'crabSteeringIndex' and the savegame state key. |
| `CrabSteering.registerSteeringModeXMLPaths(schema: any, basePath: any)` | 55 | ✍ Registers the XML paths of one steering mode under a base path: name, input action, wheels, steering center, AI look-ahead, steering nodes, nodes, articulated axis, animations and steering wheel. |
| `CrabSteering.registerFunctions(vehicleType: any)` | 94 | ✍ Registers the crab steering functions on the vehicle type (mode loading, toggle permission, availability, current mode, next mode, articulated axis update). Some have no body in the dump. |
| `CrabSteering.registerOverwrittenFunctions(vehicleType: any)` | 107 | ✍ Registers overrides for wheel loading, steering angle, selection, steering wheel update, AI field worker start and AI look-ahead distance. |
| `CrabSteering.registerEventListeners(vehicleType: any)` | 119 | ✍ Subscribes to load, post-load, delete, dashboard registration, stream read/write, update stream read/write, update tick, draw and action event registration. |
| `CrabSteering:onLoad(savegame: table)` | 136 | ✍ Reads crab steering settings and the steering modes of the active configuration, warns if there are more modes than the network bits allow, creates the HUD extension and applies mode 1. Without modes, removes its network, tick, draw and input listeners. |
| `CrabSteering:onPostLoad(savegame: any)` | 195 | ✍ Restores the saved steering mode from the savegame (clamped to the valid range) unless vehicles are reset, then fast-forwards animations and wheel physics. |
| `CrabSteering:onRegisterDashboardValueTypes()` | 220 | ✍ Registers the 'crabSteering.state' dashboard value: the current mode index, or a boolean telling whether the mode is in the dashboard's configured 'states' list. |
| `CrabSteering:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 249 | ✍ Writes the current steering mode index to the savegame if the vehicle has steering modes. |
| `CrabSteering:onReadStream(streamId: integer, connection: Connection)` | 261 | ✍ Client on join: reads the mode index, applies it without sending an event and fast-forwards animations and wheel physics. |
| `CrabSteering:onWriteStream(streamId: integer, connection: Connection)` | 273 | ✍ Server on join: writes the current mode index into the stream. |
| `CrabSteering:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 283 | ✍ Reads the articulated axis current rotation (float) from the update stream when an articulated axis with a component joint exists. |
| `CrabSteering:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 295 | ✍ Writes the articulated axis current rotation into the update stream when an articulated axis with a component joint exists. |
| `CrabSteering:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 307 | ✍ Server only: if the current mode is no longer available according to getCrabSteeringModeAvailable (body not in dump), switches to the next mode. |
| `CrabSteering:loadCrabSteeringModeFromXML(xmlFile: any, key: any, mode: any)` | 326 | ✍ Loads one steering mode into the given table: name, input action, steering center and radius, AI look-ahead, wheel entries, steering node entries, node pose changes, articulated axis data, animations and steering wheel. Invalid references are logged and skipped; always returns true. |
| `CrabSteering:getCanToggleCrabSteering() → boolean, string` | 451 | ✍ Returns whether toggling is allowed plus an optional warning text; by default returns true, nil. Override point for other specializations. |
| `CrabSteering:setCrabSteering(state: integer, noEventSend: boolean)` | 480 | ✍ Switches to the given mode. Sends SetCrabSteeringEvent (broadcast on server, sent to server on client) unless noEventSend, plays or reverses mode animations, sets the target offsets and rotation scales of steering nodes and wheels, applies node poses and refreshes the dashboard on clients. |
| `CrabSteering:loadWheelFromXML(superFunc: any, wheel: any)` | 616 | ✍ After the parent loads a wheel, initializes its steering offset to 0 and forces a steering angle update. Returns false if the parent fails. |
| `CrabSteering:updateSteeringAngle(superFunc: table, wheel: table, dt: number, steeringAngle: number) → number` | 633 | ✍ Overrides the wheel steering angle for wheels listed in the current mode: smoothly moves the steering offset, scales the rotation, gradually changes the wheel rotation speed and clamps to the wheel limits; locked wheels converge to their offset. Other wheels keep the given angle. |
| `CrabSteering:updateArticulatedAxisRotation(steeringAngle: number, dt: number) → number` | 719 | ✍ Computes the articulated axis steering angle for the current mode (offset, lock, speed blending). On clients returns the synchronized rotation; on the server, with configured wheels and rear distance, derives the angle from wheel speed and slip, otherwise blends smoothly over 2.5 s. |
| `CrabSteering:getCanBeSelected(superFunc: any)` | 838 | ✍ Returns true if the vehicle has steering modes, otherwise defers to the parent. |
| `CrabSteering:loadWheelsFromXML(superFunc: any, xmlFile: any, key: any, wheelConfigurationI: any)` | 844 | ✍ After the parent loads the wheels, stores the 'crabSteeringIndex' of the active wheel configuration as the crab steering configuration index. |
| `CrabSteering:updateSteeringWheel(superFunc: any, steeringWheel: any, dt: any, direction: any)` | 852 | ✍ If the current mode defines its own steering wheel, uses it instead of the given one, then calls the parent. |
| `CrabSteering:startFieldWorker(superFunc: any)` | 866 | ✍ Switches to the configured AI steering mode (aiSteeringModeIndex), sending the event, before starting the AI field worker via the parent. |
| `CrabSteering:getAIAutomaticSteeringLookAheadDistance(superFunc: any)` | 875 | ✍ Returns the look-ahead distance defined by the current mode if present; otherwise the parent's value. |
| `CrabSteering:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 889 | ✍ Client only: registers the next/previous mode toggle inputs and one direct input per mode that defines an input action, when the vehicle has modes and is active for input. |
| `CrabSteering.actionEventToggleCrabSteeringModes(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 916 | ✍ Input callback: if getCanToggleCrabSteering allows it, moves to the next or previous mode (callbackState gives the direction); otherwise shows the warning for 2 s. |
| `CrabSteering.actionEventSetCrabSteeringMode(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 927 | ✍ Input callback: selects the mode bound to the pressed action if toggling is allowed and the mode is available; otherwise shows the warning for 2 s. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadCrabSteeringModeFromXML` | 95 |
| registerFunction | `getCanToggleCrabSteering` | 96 |
| registerFunction | `getCrabSteeringModeAvailable` | 97 |
| registerFunction | `getNumCrabSteeringModesAvailable` | 98 |
| registerFunction | `setCrabSteering` | 99 |
| registerFunction | `getCrabSteeringMode` | 100 |
| registerFunction | `setNextCrabSteeringMode` | 101 |
| registerFunction | `updateArticulatedAxisRotation` | 102 |
| registerOverwrittenFunction | `loadWheelFromXML` | 108 |
| registerOverwrittenFunction | `updateSteeringAngle` | 109 |
| registerOverwrittenFunction | `getCanBeSelected` | 110 |
| registerOverwrittenFunction | `loadWheelsFromXML` | 111 |
| registerOverwrittenFunction | `updateSteeringWheel` | 112 |
| registerOverwrittenFunction | `startFieldWorker` | 113 |
| registerOverwrittenFunction | `getAIAutomaticSteeringLookAheadDistance` | 114 |
| registerEventListener | `onLoad` | 120 |
| registerEventListener | `onPostLoad` | 121 |
| registerEventListener | `onDelete` | 122 |
| registerEventListener | `onRegisterDashboardValueTypes` | 123 |
| registerEventListener | `onReadStream` | 124 |
| registerEventListener | `onWriteStream` | 125 |
| registerEventListener | `onReadUpdateStream` | 126 |
| registerEventListener | `onWriteUpdateStream` | 127 |
| registerEventListener | `onUpdateTick` | 128 |
| registerEventListener | `onDraw` | 129 |
| registerEventListener | `onRegisterActionEvents` | 130 |
