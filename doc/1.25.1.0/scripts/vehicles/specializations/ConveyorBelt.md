# vehicles/specializations/ConveyorBelt.lua

*[Version française](../../../fr/scripts/vehicles/specializations/ConveyorBelt.md)*

Source: `dataS/scripts/vehicles/specializations/ConveyorBelt.lua` — FS25 1.25.1.0

✍ Vehicle specialization for conveyor belts that carry material from a discharge node to another object. It requires `Dischargeable`, delays the actual discharge until a visual morph effect has travelled along the belt, and drives belt animations, sounds and effects. The server computes the filling and scrolling state and syncs it to clients through the update stream. Optional offsets bound to `Cylindered` moving tools change the belt effect length. EffectManager, AnimationManager and SoundManager internals are UNVERIFIED (not in the dump).

- **ConveyorBelt** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `ConveyorBelt.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Returns true only if the vehicle type has the `Dischargeable` specialization. |
| `ConveyorBelt.initSpecialization()` | 23 | ✍ Registers the XML schema entries under `vehicle.conveyorBelt`: discharge node index, start percentage (default 0.9), offsets with moving tool node and effect ranges, animation nodes, effects and belt sounds. |
| `ConveyorBelt.registerFunctions(vehicleType: any)` | 46 | ✍ Registers the vehicle functions `getConveyorBeltFillLevel`, `getConveyorBeltTargetObject` and `getLoadTriggerMaxFillSpeed`. |
| `ConveyorBelt.registerOverwrittenFunctions(vehicleType: any)` | 54 | ✍ Overrides six existing vehicle functions: discharge empty factor, discharge on empty, discharge handling, enterable check, fill type acceptance and free capacity of a fill unit. |
| `ConveyorBelt.registerEventListeners(vehicleType: any)` | 65 | ✍ Subscribes to onLoad, onPostLoad, onDelete, the two update stream events, onUpdateTick, onFillUnitFillLevelChanged and onMovingToolChanged. |
| `ConveyorBelt:onLoad(savegame: table)` | 79 | ✍ Loads effects (sorted by start delay), plus animations and the belt sound on clients. It selects the discharge node, computes the start fill level from the capacity and reads the moving tool offsets, warning about invalid effect indices. |
| `ConveyorBelt:onPostLoad(savegame: any)` | 176 | ✍ Resolves each offset's moving tool once all specializations are loaded and applies its initial state. Offsets with no matching tool are removed with a warning. Without `Cylindered`, offsets are disabled and an XML error is logged. |
| `ConveyorBelt:onDelete()` | 209 | ✍ Deletes the effects, animation nodes and sound samples owned by the belt. |
| `ConveyorBelt:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 221 | ✍ Client side only: when the dirty bit is set, reads the `isFilling` and `isScrolling` booleans sent by the server. |
| `ConveyorBelt:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 236 | ✍ Server side only: writes a dirty-flag bool, then `isFilling` and `isScrolling` when the belt's dirty flag is set. |
| `ConveyorBelt:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 251 | ✍ Main per-tick logic. Clients derive morph and scrolling from synced flags. While discharging, it advances the morph start and end positions by `dt`/delay and updates the empty factor. It starts or stops animations, sound and effect scrolling, and pushes the morph values to the effects. |
| `ConveyorBelt:getConveyorBeltFillLevel()` | 343 | ✍ Returns the fill level of the belt's fill unit plus, recursively, the level of the next belt in the chain it is discharging onto. |
| `ConveyorBelt:getConveyorBeltTargetObject()` | 359 | ✍ Follows the chain of belts from the current discharge node and returns the final target object and its fill unit index, or nil if nothing is hit. |
| `ConveyorBelt:getLoadTriggerMaxFillSpeed()` | 377 | ✍ Returns the maximum fill speed allowed by the chain: the minimum of this node's empty speed and that of downstream objects, or infinity without a discharge node. |
| `ConveyorBelt:getDischargeNodeEmptyFactor(superFunc: any, dischargeNode: any)` | 395 | ✍ Override. For the belt's discharge node, returns 0 until the morph end reaches 1, then the computed empty factor, which delays real discharge. Other nodes use the parent value. |
| `ConveyorBelt:handleDischargeOnEmpty(superFunc: any, dischargeNode: any)` | 412 | ✍ Override. Calls the parent behaviour only for discharge nodes other than the belt's own, which is therefore ignored. |
| `ConveyorBelt:handleDischarge(superFunc: any, dischargeNode: any, dischargedLiters: any, minDropReached: any, hasMinDropFillLevel: any)` | 422 | ✍ Override. Skips discharge handling for the belt's own discharge node and delegates to the parent for all others. |
| `ConveyorBelt:getIsEnterable(superFunc: any)` | 432 | ✍ Override. The vehicle can be entered only if it is not attached to another vehicle and the parent check also passes. |
| `ConveyorBelt.getHasConveyorBeltLoop(rootVehicle: any, vehicle: any, fillUnitIndex: any)` | 438 | ✍ Walks the belt chain from a vehicle and returns true if it leads back to the root vehicle, meaning a loop. Used to avoid endless recursion in fill type and capacity queries. |
| `ConveyorBelt:getFillUnitAllowsFillType(superFunc: any, fillUnitIndex: any, fillType: any)` | 458 | ✍ Override. After the parent check, if there is no loop, it also asks the target object whether it accepts the fill type, including through the node's fill type converter. |
| `ConveyorBelt:getFillUnitFreeCapacity(superFunc: any, fillUnitIndex: any, fillTypeIndex: any, farmId: any)` | 489 | ✍ Override. Without a loop, adds the free capacity of the downstream target object to the parent value, so the belt reports the combined room of the chain. |
| `ConveyorBelt:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 509 | ✍ On the belt's fill unit: the server updates morph positions and the filling and scrolling flags, raising a dirty flag on change. At empty it stops effects and resets the morph; otherwise it sets the fill type info and starts effects. |
| `ConveyorBelt:onMovingToolChanged(movingTool: any, speed: any, dt: any)` | 551 | ✍ When a linked moving tool changes state, sets the offsets of its effects by interpolation, honouring inversion, then recomputes the total belt delay. |
| `ConveyorBelt:updateDebugValues(values: any)` | 589 | ✍ Adds debug entries to the given list: fill factor, visual factor, current delay, offset and the morph start and end positions. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getConveyorBeltFillLevel` | 47 |
| registerFunction | `getConveyorBeltTargetObject` | 48 |
| registerFunction | `getLoadTriggerMaxFillSpeed` | 49 |
| registerOverwrittenFunction | `getDischargeNodeEmptyFactor` | 55 |
| registerOverwrittenFunction | `handleDischargeOnEmpty` | 56 |
| registerOverwrittenFunction | `handleDischarge` | 57 |
| registerOverwrittenFunction | `getIsEnterable` | 58 |
| registerOverwrittenFunction | `getFillUnitAllowsFillType` | 59 |
| registerOverwrittenFunction | `getFillUnitFreeCapacity` | 60 |
| registerEventListener | `onLoad` | 66 |
| registerEventListener | `onPostLoad` | 67 |
| registerEventListener | `onDelete` | 68 |
| registerEventListener | `onReadUpdateStream` | 69 |
| registerEventListener | `onWriteUpdateStream` | 70 |
| registerEventListener | `onUpdateTick` | 71 |
| registerEventListener | `onFillUnitFillLevelChanged` | 72 |
| registerEventListener | `onMovingToolChanged` | 73 |
