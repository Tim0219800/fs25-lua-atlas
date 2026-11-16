# vehicles/specializations/MixerWagon.lua

*[Version française](../../../fr/scripts/vehicles/specializations/MixerWagon.md)*

Source: `dataS/scripts/vehicles/specializations/MixerWagon.lua` — FS25 1.25.1.0

✍ Specialization for feed mixer wagons that absorb bales (and shovel loads) and blend them into forage. It requires the Trailer and TurnOnVehicle specializations. When a recipe fill type is set in XML, it tracks one fill level per recipe ingredient and decides whether the mix is FORAGE or FORAGE_MIXING; the server picks up bales through triggers and the client plays animations and effects.

- **MixerWagon** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `MixerWagon.prerequisitesPresent(specializations: table) → boolean` | 22 | ✍ Returns true only if the vehicle type also has the Trailer and TurnOnVehicle specializations. |
| `MixerWagon.initSpecialization()` | 28 | ✍ Registers the XML schema paths under vehicle.mixerWagon (animation nodes, bale triggers, mixingTime, fillUnitIndex, recipe, fill effect) and the savegame fill level per fill type. |
| `MixerWagon.registerFunctions(vehicleType: any)` | 54 | ✍ Adds the bale trigger callback and the bale-deleted callback as vehicle functions. |
| `MixerWagon.registerOverwrittenFunctions(vehicleType: any)` | 61 | ✍ Overrides fill level handling, fill type acceptance, discharge fill type, bale auto-load, PTO power consumption, consuming load and PTO active state. |
| `MixerWagon.registerEventListeners(vehicleType: any)` | 73 | ✍ Subscribes to load, post-load, delete, stream read/write, update, draw, turn on/off and fill level changed events. |
| `MixerWagon:onLoad(savegame: table)` | 91 | ✍ Reads the XML: loads animations and fill effect on the client, bale triggers on the server, mixing time, fill unit and recipe ingredients from the animal food system. With a recipe it disables the fill unit's own saving and sync, and creates the HUD extension. |
| `MixerWagon:onPostLoad(savegame: table)` | 191 | ✍ Restores per-ingredient fill levels from the savegame and logs a developer warning if no hudInfoTrigger is present. |
| `MixerWagon:onDelete()` | 211 | ✍ Removes bale triggers and bale delete listeners, deletes animations and effects, and removes and deletes the HUD extension. |
| `MixerWagon:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 239 | ✍ Writes the fill level of each recipe ingredient to the savegame. |
| `MixerWagon:onReadStream(streamId: integer, connection: Connection)` | 252 | ✍ Client side, on join: reads each ingredient's fill level and adds it to the fill unit, then reads the current effect fill type. |
| `MixerWagon:onWriteStream(streamId: integer, connection: Connection)` | 268 | ✍ Server side, on join: writes each ingredient's fill level and the current effect fill type. |
| `MixerWagon:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 282 | ✍ Client only: applies ingredient fill level differences received from the server and updates the effect fill type when flagged. |
| `MixerWagon:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 306 | ✍ Server only: sends ingredient fill levels when the dirty flag is set, and the effect fill type when the effect dirty flag is set. |
| `MixerWagon:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 326 | ✍ Runs the mixing animations while powered and active, decrements the mix timer, and on the server drains bales in the triggers into the fill unit at pickupSpeed. It also chooses the effect fill type; the client starts or stops the fill effect. |
| `MixerWagon:mixerWagonBaleTriggerCallback(triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 413 | ✍ Trigger callback: tracks accepted bales entering or leaving a bale trigger (with delete listener). If the fill unit rejects the bale type, it broadcasts a bale-not-accepted event to the farm. |
| `MixerWagon:onMixerWagonBaleDeleted(bale: any)` | 451 | ✍ Removes a deleted bale from all bale triggers' tracking tables. |
| `MixerWagon:addFillUnitFillLevel(superFunc: any, farmId: any, fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any)` | 461 | ✍ Overrides fill handling for the mixer fill unit. With a recipe it tracks levels per ingredient, splits returned forage by ratio, scales all ingredients on discharge, then sets the fill type to a single ingredient, FORAGE (ratios within min/max) or FORAGE_MIXING. Other units use the parent. |
| `MixerWagon:getFillUnitAllowsFillType(superFunc: any, fillUnitIndex: any, fillTypeIndex: any)` | 574 | ✍ Accepts any fill type that belongs to a recipe ingredient on the mixer unit; otherwise defers to the parent. |
| `MixerWagon:getDischargeFillType(superFunc: any, dischargeNode: any)` | 589 | ✍ For the mixer unit returns the current fill type with ratio 1; while the content is FORAGE_MIXING it reports the first ingredient that still has a level instead. |
| `MixerWagon:getIsBaleAutoLoadable(superFunc: any, bale: any)` | 614 | ✍ Allows auto-loading a bale only if the mixer is turned on, no bale is currently in a trigger, the bale type matches the content, and there is free capacity; then defers to the parent. |
| `MixerWagon:getDoConsumePtoPower(superFunc: any) → boolean` | 643 | ✍ Returns true while the mix timer is running, otherwise defers to the parent. |
| `MixerWagon:getConsumingLoad(superFunc: any)` | 653 | ✍ Adds one load entry to the parent's result, with value 1 while the mix timer is running and 0 otherwise. |
| `MixerWagon:getIsPowerTakeOffActive(superFunc: any)` | 666 | ✍ Reports the PTO as active while the mix timer is running, or if the parent says so. |
| `MixerWagon:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 672 | ✍ When the mixer fill unit becomes empty, resets every ingredient level to zero. |
| `MixerWagon:onTurnedOn()` | 687 | ✍ Client only: starts the pickup animation nodes. |
| `MixerWagon:onTurnedOff()` | 696 | ✍ Client only: stops the pickup animation nodes. |
| `MixerWagon:updateDebugValues(values: any)` | 705 | ✍ Appends debug rows: whether the content is valid FORAGE and the fill level of each ingredient. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `mixerWagonBaleTriggerCallback` | 55 |
| registerFunction | `onMixerWagonBaleDeleted` | 56 |
| registerOverwrittenFunction | `addFillUnitFillLevel` | 62 |
| registerOverwrittenFunction | `getFillUnitAllowsFillType` | 63 |
| registerOverwrittenFunction | `getDischargeFillType` | 64 |
| registerOverwrittenFunction | `getIsBaleAutoLoadable` | 65 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 66 |
| registerOverwrittenFunction | `getConsumingLoad` | 67 |
| registerOverwrittenFunction | `getIsPowerTakeOffActive` | 68 |
| registerEventListener | `onLoad` | 74 |
| registerEventListener | `onPostLoad` | 75 |
| registerEventListener | `onDelete` | 76 |
| registerEventListener | `onReadStream` | 77 |
| registerEventListener | `onWriteStream` | 78 |
| registerEventListener | `onReadUpdateStream` | 79 |
| registerEventListener | `onWriteUpdateStream` | 80 |
| registerEventListener | `onUpdate` | 81 |
| registerEventListener | `onDraw` | 82 |
| registerEventListener | `onTurnedOn` | 83 |
| registerEventListener | `onTurnedOff` | 84 |
| registerEventListener | `onFillUnitFillLevelChanged` | 85 |
