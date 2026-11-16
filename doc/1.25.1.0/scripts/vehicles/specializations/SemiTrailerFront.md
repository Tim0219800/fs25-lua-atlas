# vehicles/specializations/SemiTrailerFront.lua

*[Version française](../../../fr/scripts/vehicles/specializations/SemiTrailerFront.md)*

Source: `dataS/scripts/vehicles/specializations/SemiTrailerFront.lua` — FS25 1.25.1.0

✍ Specialization for the detachable front part of a separable semi trailer. It needs AttacherJoints and works on the first input attacher joint of Attachable: when no rear semi trailer is attached, the joint rotation limits are faded down to zero over about one second so the front part can be handled, and they are restored when a rear part is attached. Detaching from the tractor is only allowed while a rear semi trailer is attached. Joint changes happen on the server.

- **SemiTrailerFront** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `SemiTrailerFront.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Returns true only if the vehicle type has AttacherJoints. |
| `SemiTrailerFront.registerOverwrittenFunctions(vehicleType: any)` | 23 | ✍ Overrides `isDetachAllowed`. |
| `SemiTrailerFront.registerEventListeners(vehicleType: any)` | 29 | ✍ Subscribes to onLoad, onUpdate, onPostAttachImplement, onPreDetachImplement, onPreDetach and onPostAttach. |
| `SemiTrailerFront:onLoad(savegame: table)` | 41 | ✍ Initialises the fade state (value 1, direction 1, duration 1000 ms), grabs the first Attachable input attacher joint and backs up its `lowerRotLimitScale`. It will error if the vehicle has no input attacher joint. |
| `SemiTrailerFront:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 60 | ✍ On the first update, if no rear trailer is attached, sets the fade direction to closing. On the server, while attached to a tractor and the fade is not finished, moves the fade value with dt, scales the joint rotation limits and applies them on the physics joint with `setJointRotationLimit`. |
| `SemiTrailerFront:isDetachAllowed(superFunc: any) → boolean` | 100 | ✍ Returns false (with the parent's warning) if the parent forbids detaching; otherwise returns true only when a rear semi trailer is attached, with no warning. |
| `SemiTrailerFront:onPostAttachImplement(attachable: table, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 113 | ✍ Remembers the attached rear trailer and sets the fade direction to 1000 so the rotation limits are restored. |
| `SemiTrailerFront:onPreDetachImplement(implement: integer)` | 122 | ✍ Forgets the rear trailer and sets the fade direction to -1 so the rotation limits fade out. |
| `SemiTrailerFront:onPreDetach(attacherVehicle: table, implement: table)` | 132 | ✍ Clears the stored tractor implement reference when this front part is detached. |
| `SemiTrailerFront:onPostAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer)` | 142 | ✍ After being attached to a tractor, stores the matching implement entry from the attacher vehicle. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `isDetachAllowed` | 24 |
| registerEventListener | `onLoad` | 30 |
| registerEventListener | `onUpdate` | 31 |
| registerEventListener | `onPostAttachImplement` | 32 |
| registerEventListener | `onPreDetachImplement` | 33 |
| registerEventListener | `onPreDetach` | 34 |
| registerEventListener | `onPostAttach` | 35 |
