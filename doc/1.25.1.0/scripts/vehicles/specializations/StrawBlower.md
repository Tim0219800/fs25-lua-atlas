# vehicles/specializations/StrawBlower.lua

*[Version française](../../../fr/scripts/vehicles/specializations/StrawBlower.md)*

Source: `dataS/scripts/vehicles/specializations/StrawBlower.lua` — FS25 1.25.1.0

✍ Specialization for straw blowers that shred a bale by treating it as a temporary fill level. It requires FillUnit and Trailer. A server-side trigger detects bales; the fill unit capacity is resized to the bale content and the bale is deleted once emptied. Client side it plays start/work/stop sounds and animation nodes depending on the discharge state.

- **StrawBlower** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `StrawBlower.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Returns true only if the vehicle type also has the FillUnit and Trailer specializations. |
| `StrawBlower.initSpecialization()` | 24 | ✍ Registers the XML schema paths: bale trigger node, fill unit index (default 1), animation nodes and the start, stop and work sound samples under vehicle.strawBlower. |
| `StrawBlower.registerFunctions(vehicleType: any)` | 43 | ✍ Registers the vehicle functions strawBlowerBaleTriggerCallback and onDeleteStrawBlowerObject. |
| `StrawBlower.registerOverwrittenFunctions(vehicleType: any)` | 50 | ✍ Overrides getDrawFirstFillText, getAllowDynamicMountFillLevelInfo and addFillUnitFillLevel on the vehicle type. |
| `StrawBlower.registerEventListeners(vehicleType: any)` | 58 | ✍ Subscribes to onLoad, onDelete, onUpdateTick, onFillUnitFillLevelChanged and onDischargeStateChanged. |
| `StrawBlower:onLoad(savegame: table)` | 69 | ✍ Server: creates the bale trigger from XML. Client: loads animations and sounds. Marks the fill unit as fully synchronized and unsaved, resets its level on savegame load, and drops the update listener on clients. |
| `StrawBlower:onDelete()` | 112 | ✍ Removes the trigger, releases every tracked bale (wakes its physics, allows pickup again, removes the delete listener), clears the table and deletes sounds and animations. |
| `StrawBlower:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 141 | ✍ Server only. If no bale is current and the fill unit accepts the BALE tool type, takes the first triggered bale, sets the capacity to its fill level and fills the unit with its content. |
| `StrawBlower:addFillUnitFillLevel(superFunc: any, farmId: any, fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any)` | 156 | ✍ Override that grows the capacity of the straw fill unit when needed so the requested change fits, then calls the parent implementation. |
| `StrawBlower:strawBlowerBaleTriggerCallback(triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 173 | ✍ Trigger callback. On enter, accepts a Bale the active farm can access, pickable and of a supported fill type: counts it and blocks pickup. On leave, decrements the count and, at zero, releases the bale and empties the fill unit if it was current. |
| `StrawBlower:onDeleteStrawBlowerObject(object: any)` | 223 | ✍ Delete listener for a tracked bale: forgets it and, if it was the current bale, clears the current bale and empties the fill unit. |
| `StrawBlower:getDrawFirstFillText(superFunc: any)` | 238 | ✍ Override: also returns true when the straw fill unit is empty, in addition to the parent result. |
| `StrawBlower:getAllowDynamicMountFillLevelInfo(superFunc: any)` | 245 | ✍ Override that always returns false. |
| `StrawBlower:onFillUnitFillLevelChanged(fillUnitIndex: integer, fillLevelDelta: number, fillTypeIndex: integer, toolType: boolean, fillPositionData: table, appliedDelta: any)` | 256 | ✍ Server: when the unit reaches about zero, unmounts and deletes the current bale and resets capacity to 1; otherwise shrinks the bale fill level to follow the unit. Client: resets capacity to 1 when emptied. |
| `StrawBlower:onDischargeStateChanged(state: any)` | 291 | ✍ Client only. When discharge starts it plays the start then work sounds and starts the animations; when it stops it stops them and plays the stop sound. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `strawBlowerBaleTriggerCallback` | 44 |
| registerFunction | `onDeleteStrawBlowerObject` | 45 |
| registerOverwrittenFunction | `getDrawFirstFillText` | 51 |
| registerOverwrittenFunction | `getAllowDynamicMountFillLevelInfo` | 52 |
| registerOverwrittenFunction | `addFillUnitFillLevel` | 53 |
| registerEventListener | `onLoad` | 59 |
| registerEventListener | `onDelete` | 60 |
| registerEventListener | `onUpdateTick` | 61 |
| registerEventListener | `onFillUnitFillLevelChanged` | 62 |
| registerEventListener | `onDischargeStateChanged` | 63 |
