# vehicles/specializations/BigBag.lua

*[Version française](../../../fr/scripts/vehicles/specializations/BigBag.md)*

Source: `dataS/scripts/vehicles/specializations/BigBag.lua` — FS25 1.25.1.0

✍ Specialization for big bags (bulk sacks): it scales a size animation with the fill level and adjusts the limits of a component joint so the bag stretches when lifted and full. Configured under vehicle.bigBag (fillUnitIndex, sizeAnimation, componentJoint). Joint limits are changed on the server only; the animation runs on every machine. It also overrides the info box title with the big bag shop text.

- **BigBag** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `BigBag.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Always returns true: no other specialization is required. |
| `BigBag.initSpecialization()` | 23 | ✍ Registers the vehicle.bigBag XML keys: fill unit index, size animation name with min/max/lift-shrink times, and component joint index, rotation and translation limits plus angular damping. |
| `BigBag.registerFunctions(vehicleType: any)` | 48 | ✍ Empty hook, registers no new vehicle functions. |
| `BigBag.registerOverwrittenFunctions(vehicleType: any)` | 53 | ✍ Overrides getInfoBoxTitle on the vehicle type. |
| `BigBag.registerEventListeners(vehicleType: any)` | 59 | ✍ Registers onLoad, onUpdate and onFillUnitFillLevelChanged. |
| `BigBag:onLoad(savegame: table)` | 68 | ✍ Reads the bigBag XML values. If the referenced component joint exists, creates a reference transform group on the second component, stores the joint limits and sets angular damping on both components; initialises animation state. |
| `BigBag:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 116 | ✍ Measures how far the joint has moved from its reference to derive a lift alpha and a shrink time for the size animation. On the server it re-interpolates the joint rotation limits when alpha changes by more than 0.05. |
| `BigBag:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 149 | ✍ When the tracked fill unit changes, recomputes the size animation time from the fill percentage and sets the animation. On the server it also interpolates the joint translation limits between the empty and full values. |
| `BigBag:getInfoBoxTitle(superFunc: any)` | 172 | ✍ Returns the localized text shopItem_bigBag as the info box title, ignoring the parent implementation. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `getInfoBoxTitle` | 54 |
| registerEventListener | `onLoad` | 60 |
| registerEventListener | `onUpdate` | 61 |
| registerEventListener | `onFillUnitFillLevelChanged` | 62 |
