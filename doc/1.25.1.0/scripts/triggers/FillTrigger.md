# triggers/FillTrigger.lua

*[Version française](../../fr/scripts/triggers/FillTrigger.md)*

Source: `dataS/scripts/triggers/FillTrigger.lua` — FS25 1.25.1.0

✍ Fuel-station style fill trigger: when a vehicle's fill unit node enters the trigger, the vehicle registers it as a fill unit trigger and can then be filled, either from a source object's fill unit or, with no source, by paying the economy price per liter. The default fill type is diesel. Methods such as getCurrentFillType and setMoneyChangeType are called but not defined in this file (UNVERIFIED, likely in elided code).

- **FillTrigger** (l.8)

## Functions

| Function | Line | Description |
|---|---|---|
| `FillTrigger:onCreate(id: integer)` | 13 | ✍ Map-load entry point for a trigger node placed in the i3d: builds a FillTrigger, registers a new "other" money type labelled finance_purchaseFuel, assigns it, and adds the trigger to the mission's non-updateables. |
| `FillTrigger.new(id: integer, sourceObject: table, fillUnitIndex: integer, fillLitersPerSecond: table?, defaultFillType: any, customMt: table?) → table` | 28 | ✍ Creates the trigger on the given node, adds the physics trigger callback `fillTriggerCallback`, and creates a sound node at the trigger position. Stores the optional source object, fill unit index and liters-per-second cap; fill type starts as diesel and the trigger is enabled. |
| `FillTrigger:delete()` | 67 | ✍ Removes this trigger from every vehicle still inside it, deletes the sound sample and removes the physics trigger. Note: `self.sample` is never assigned in this file, so the sample deletion relies on code outside it. |
| `FillTrigger:onVehicleDeleted(vehicle: table)` | 85 | ✍ Forgets a vehicle that was deleted while in the trigger and flushes the pending money change display for its active farm, if a money type is set. |
| `FillTrigger:fillVehicle(vehicle: table, delta: number, dt: any) → number` | 98 | ✍ Transfers up to delta liters into the vehicle, capped by liters-per-second times dt (ms) and by the source's level and farm access. Takes from the source fill unit, or without a source charges the farm at the fill type's price per liter. Returns the amount actually added. |
| `FillTrigger:getIsActivatable(vehicle: table) → boolean` | 156 | ✍ Returns true only when a source object exists, its fill unit is not empty and the vehicle's active farm may access it; a trigger without source is never activatable here. |
| `FillTrigger:fillTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 173 | ✍ Physics callback that handles enter and leave events only. On enter it finds the vehicle's fill unit for the node and, if it accepts the current fill type, counts the node and calls addFillUnitTrigger on first entry. On the last leave it calls removeFillUnitTrigger and flushes money display. |
