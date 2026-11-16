# vehicles/specializations/AIConveyorBelt.lua

*[Version française](../../../fr/scripts/vehicles/specializations/AIConveyorBelt.md)*

Source: `dataS/scripts/vehicles/specializations/AIConveyorBelt.lua` — FS25 1.25.1.0

✍ Specialization that lets a motorized conveyor belt vehicle be started as an AI job (AIJobType.CONVEYOR): the vehicle swings back and forth around its starting heading within a configurable angle. It requires AIFieldWorker and Motorized, and is only active when the XML contains a vehicle.ai.conveyorBelt node (minAngle, maxAngle, stepSize, speed, direction). The current angle is saved with the vehicle and synced with AIConveyorBeltSetAngleEvent.

- **AIConveyorBelt** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIConveyorBelt.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Returns true only if the vehicle type has both the AIFieldWorker and Motorized specializations. |
| `AIConveyorBelt.initSpecialization()` | 25 | ✍ Registers the XML keys minAngle (default 5), maxAngle (45), stepSize (5), speed (1) and direction (-1) under vehicle.ai.conveyorBelt, plus the savegame attribute currentAngle. |
| `AIConveyorBelt.registerFunctions(vehicleType: any)` | 43 | ✍ Adds setAIConveyorBeltAngle and getDirectionAndSpeedToTargetAngle to the vehicle type. |
| `AIConveyorBelt.registerOverwrittenFunctions(vehicleType: any)` | 50 | ✍ Overrides the AI start checks and job getters, getCanBeSelected and getAINeedsTrafficCollisionBox for conveyor belts. |
| `AIConveyorBelt.registerEventListeners(vehicleType: any)` | 61 | ✍ Subscribes to load, post-load, stream, update, update-tick, onAIFieldWorkerStart and action-event registration callbacks. |
| `AIConveyorBelt:onLoad(savegame: table)` | 75 | ✍ Reads the XML settings, marks the belt as AI-capable only if the vehicle.ai.conveyorBelt node exists, starts at the maximum angle and creates the conveyor job from the AI job type manager. Removes onUpdate on non-servers and onUpdateTick on non-clients. |
| `AIConveyorBelt:onPostLoad(savegame: any)` | 105 | ✍ Restores the saved currentAngle from the savegame unless vehicles are being reset. |
| `AIConveyorBelt:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 114 | ✍ Writes currentAngle to the vehicle's savegame entry. |
| `AIConveyorBelt:onReadStream(streamId: integer, connection: Connection)` | 123 | ✍ Client side on join: reads the angle as an int8 and applies it without sending an event. |
| `AIConveyorBelt:onWriteStream(streamId: integer, connection: Connection)` | 131 | ✍ Server side on join: writes the current angle as an int8 (so the value is truncated to whole degrees in the signed 8-bit range). |
| `AIConveyorBelt:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 140 | ✍ Server only, while the AI is active: computes the sweep direction and speed toward the target heading, limits the motor speed and drives the wheel physics accordingly. |
| `AIConveyorBelt:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 155 | ✍ Client side: enables the IMPLEMENT_EXTRA3 action while the vehicle is input-active and sets its label to show the current angle in degrees. |
| `AIConveyorBelt:setAIConveyorBeltAngle(angle: any, noEventSend: any)` | 168 | ✍ Stores the new sweep angle and, unless noEventSend is true, sends or broadcasts AIConveyorBeltSetAngleEvent so all peers agree. |
| `AIConveyorBelt:getDirectionAndSpeedToTargetAngle(direction: any, minAngle: any, maxAngle: any)` | 182 | ✍ Compares the first component's current Y rotation to the min or max target and returns a direction and a speed: it reverses with speed 0 when the limit is passed, otherwise speed scales with the remaining angle (0.1 to 1). Angles are in radians. |
| `AIConveyorBelt:getCanStartAIVehicle(superFunc: any)` | 208 | ✍ Override: returns the parent result and additionally requires the vehicle.ai.conveyorBelt node to be present in the XML. |
| `AIConveyorBelt:getCanStartFieldWork()` | 218 | ✍ Returns the same value as getCanStartAIVehicle. |
| `AIConveyorBelt:getStartableAIJob(superFunc: any)` | 224 | ✍ Override: if the belt can start, fills the cached conveyor job from the current vehicle state and the local player's farm, and returns it when validation succeeds; otherwise returns nil. |
| `AIConveyorBelt:getHasStartableAIJob(superFunc: any)` | 242 | ✍ Override that always returns true. |
| `AIConveyorBelt:getCanBeSelected(superFunc: any)` | 248 | ✍ Override that always returns true, so the belt can be selected. |
| `AIConveyorBelt:getAINeedsTrafficCollisionBox(superFunc: any)` | 254 | ✍ Override that returns false: the AI does not need a traffic collision box for this vehicle. |
| `AIConveyorBelt:onAIFieldWorkerStart()` | 260 | ✍ When the AI job starts, records the current heading and sets the sweep limits to half the current angle on each side, starting in the positive direction. |
| `AIConveyorBelt:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 273 | ✍ Client side: registers the IMPLEMENT_EXTRA3 action to change the angle, only for an input-active vehicle with AI conveyor settings in its XML. |
| `AIConveyorBelt.actionEventChangeAngle(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 287 | ✍ Input callback that adds one step to the angle and wraps back to the minimum when the maximum is exceeded. |

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
