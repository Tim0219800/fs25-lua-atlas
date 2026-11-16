# vehicles/specializations/SmartAttach.lua

*[Version française](../../../fr/scripts/vehicles/specializations/SmartAttach.md)*

Source: `dataS/scripts/vehicles/specializations/SmartAttach.lua` — FS25 1.25.1.0

✍ Specialization that lets a vehicle be attached to a nearby target vehicle with one button press, without manual attacher joint selection. A trigger node detects vehicles with a free attacher joint of the configured joint type; an activatable (`SmartAttachActivatable`) then appears when the two joints are close and aligned. The file also defines `SmartAttachActivatable` and `SmartAttachEvent`, which sends the request to the server and rebroadcasts it. It reads `vehicle.smartAttach#jointType` and `#trigger`.

- **SmartAttachActivatable** (l.225)
- **SmartAttachEvent** inherits from `Event` (l.257)

## Functions

| Function | Line | Description |
|---|---|---|
| `SmartAttach.prerequisitesPresent(specializations: any)` | 17 | ✍ Always returns true: no other specialization is required. |
| `SmartAttach.initSpecialization()` | 23 | ✍ Declares the XML schema entries `vehicle.smartAttach#jointType` (joint type name) and `#trigger` (trigger node). |
| `SmartAttach.registerFunctions(vehicleType: any)` | 35 | ✍ Registers `smartAttachCallback`, `getCanBeSmartAttached` and `doSmartAttach` on the vehicle type. |
| `SmartAttach.registerEventListeners(vehicleType: any)` | 43 | ✍ Subscribes to onLoad, onDelete and onPreAttach. |
| `SmartAttach:onLoad(savegame: any)` | 51 | ✍ Looks up the input attacher joint matching the configured joint type (warns if invalid or missing), registers the trigger node with `smartAttachCallback`, resets the target state and creates the activatable. |
| `SmartAttach:onDelete()` | 89 | ✍ Removes the activatable from the activatable objects system and removes the trigger. |
| `SmartAttach:doSmartAttach(targetVehicle: any, inputJointDescIndex: any, jointDescIndex: any, noEventSend: any)` | 105 | ✍ Sends a SmartAttachEvent, then on the server detaches this vehicle from its current attacher vehicle (if any) and attaches it to the target vehicle with the given joint indices. |
| `SmartAttach:getCanBeSmartAttached()` | 120 | ✍ Returns true if a target vehicle is known, one of the two vehicles is active for input, and the horizontal distance between the two joints is under SmartAttach.DISTANCE_THRESHOLD with a Y rotation difference under SmartAttach.ABS_ANGLE_THRESHOLD (constants defined outside the dump excerpt, values UNVERIFIED). |
| `SmartAttach:onPreAttach()` | 146 | ✍ Clears the stored target vehicle and its counter before an attach takes place. |
| `SmartAttach:smartAttachCallback(triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 161 | ✍ Trigger callback: on enter, picks the first vehicle with a free attacher joint of the right type as target, builds the action text (ground attach or transform attach) and adds the activatable; counts shapes of the target inside the trigger. On leave, decrements the count and clears the target and activatable at zero. |
| `SmartAttachActivatable.new(smartAttachVehicle: table) → table` | 231 | ✍ Creates the activatable object for a smart-attach vehicle, with an empty activation text. |
| `SmartAttachActivatable:getIsActivatable() → boolean` | 243 | ✍ Returns whether the vehicle can currently be smart attached (delegates to `getCanBeSmartAttached`). |
| `SmartAttachActivatable:run()` | 249 | ✍ Called when the player activates it: runs `doSmartAttach` with the stored target vehicle and joint indices. |
| `SmartAttachEvent.emptyNew()` | 263 | ✍ Creates an empty SmartAttachEvent, used when reading from the network. |
| `SmartAttachEvent.new(vehicle: any, targetVehicle: any, inputJointDescIndex: any, jointDescIndex: any)` | 270 | ✍ Creates a SmartAttachEvent holding the vehicle, target vehicle and the two joint indices. |
| `SmartAttachEvent:readStream(streamId: any, connection: any)` | 281 | ✍ Reads the two vehicle objects and the two 7-bit joint indices from the stream, then runs the event. |
| `SmartAttachEvent:writeStream(streamId: any, connection: any)` | 291 | ✍ Writes the two vehicle objects and the two 7-bit joint indices to the stream. |
| `SmartAttachEvent:run(connection: any)` | 300 | ✍ Calls `doSmartAttach` without re-sending the event; when received by the server, rebroadcasts it to the other clients. |
| `SmartAttachEvent.sendEvent(vehicle: any, targetVehicle: any, inputJointDescIndex: any, jointDescIndex: any, noEventSend: any)` | 310 | ✍ Sends the event unless `noEventSend` is true: the server broadcasts it, a client sends it to the server connection. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `smartAttachCallback` | 36 |
| registerFunction | `getCanBeSmartAttached` | 37 |
| registerFunction | `doSmartAttach` | 38 |
| registerEventListener | `onLoad` | 44 |
| registerEventListener | `onDelete` | 45 |
| registerEventListener | `onPreAttach` | 46 |
