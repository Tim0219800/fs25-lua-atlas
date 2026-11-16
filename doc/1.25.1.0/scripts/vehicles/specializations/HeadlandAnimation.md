# vehicles/specializations/HeadlandAnimation.lua

*[Version française](../../../fr/scripts/vehicles/specializations/HeadlandAnimation.md)*

Source: `dataS/scripts/vehicles/specializations/HeadlandAnimation.lua` — FS25 1.25.1.0

✍ Vehicle specialization that plays configured animations when the vehicle turns on the headland, detected from the steering amount with activation and deactivation delays and thresholds. Optionally the vehicle must be above specific field ground types. It is configured under vehicle.headlandAnimation and relies on the animation system of the vehicle (playAnimation, getAnimationTime). It has no prerequisite and no network code of its own.

- **HeadlandAnimation** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `HeadlandAnimation.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Always returns true: no prerequisite on other specializations. |
| `HeadlandAnimation.initSpecialization()` | 23 | ✍ Registers the XML schema under vehicle.headlandAnimation: activation and deactivation delays (time), steering thresholds (0 to 1), required ground types and the list of animations with name and speed. |
| `HeadlandAnimation.registerFunctions(vehicleType: any)` | 41 | ✍ Empty: the specialization adds no vehicle functions. |
| `HeadlandAnimation.registerOverwrittenFunctions(vehicleType: any)` | 46 | ✍ Empty: nothing is overridden. |
| `HeadlandAnimation.registerEventListeners(vehicleType: any)` | 51 | ✍ Subscribes the specialization to onLoad and onUpdate. |
| `HeadlandAnimation:onLoad(savegame: table)` | 59 | ✍ If a headlandAnimation node exists, loads delays, angles, the required FieldGroundType names (warning on unknown names) and the animation list. Otherwise removes the onUpdate listener. Note: the ground type attribute is split without a nil check, so omitting it would raise an error. |
| `HeadlandAnimation:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 117 | ✍ Each frame, runs a timer from the steering amount (rotatedTime) and the ground type below the vehicle to decide the headland state, then plays all animations forward or in reverse when that state changes. Note: it tests spec.headlandRequiredDensityBits, which is never assigned in this file. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEventListener | `onLoad` | 52 |
| registerEventListener | `onUpdate` | 53 |
