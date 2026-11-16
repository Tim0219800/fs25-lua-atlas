# vehicles/specializations/SeedTreater.lua

*[Version française](../../../fr/scripts/vehicles/specializations/SeedTreater.md)*

Source: `dataS/scripts/vehicles/specializations/SeedTreater.lua` — FS25 1.25.1.0

✍ Specialization for seed treatment machines. It requires Dischargeable and FillUnit: a dedicated fill unit holds the treatment liquid (LIQUIDSEEDTREATMENT), which is consumed in proportion to the seed discharged through one chosen discharge node, and the discharge speed is slowed while treatment is active. On the server it also starts filling from nearby triggers when the liquid tank has room.

- **SeedTreater** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `SeedTreater.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Returns true only if the vehicle type has Dischargeable and FillUnit. |
| `SeedTreater.initSpecialization()` | 23 | ✍ Declares the `vehicle.seedTreater` XML attributes: liquid fill unit index, discharge node index, usage per liter (default 0.1), fill-from-trigger threshold (default 5) and treatment speed factor (default 0.1). |
| `SeedTreater.registerFunctions(vehicleType: any)` | 38 | ✍ Registers no new function (empty body). |
| `SeedTreater.registerOverwrittenFunctions(vehicleType: any)` | 43 | ✍ Overrides `discharge`, `getDischargeFillType` and `getDischargeNodeEmptyFactor`. |
| `SeedTreater.registerEventListeners(vehicleType: any)` | 51 | ✍ Subscribes to onLoad and onUpdate. |
| `SeedTreater:onLoad(savegame: any)` | 58 | ✍ Reads the seedTreater XML values into the spec: fill unit index, discharge node index, usage per liter, trigger threshold and treatment speed factor. |
| `SeedTreater:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 70 | ✍ Server only: if the liquid fill unit has more than 5 liters of free capacity and a nearby fill trigger offers LIQUIDSEEDTREATMENT and is activatable, starts filling; stops filling once it is nearly full while discharging. Note: the 5 is hardcoded, `fillFromTriggerThreshold` is read but not used here. |
| `SeedTreater:discharge(superFunc: any, dischargeNode: any, emptyLiters: any)` | 95 | ✍ Calls the parent discharge, then, for the configured discharge node and only if its fillTypeConverter converts the current fill type, removes treatment liquid (discharged liters times usagePerLiter) from the liquid fill unit. Returns the parent's three values unchanged. |
| `SeedTreater:getDischargeFillType(superFunc: any, dischargeNode: any)` | 117 | ✍ When the liquid fill unit is empty, returns the discharge node's own fill unit type and a second value of 1, bypassing the parent; otherwise defers to the parent. |
| `SeedTreater:getDischargeNodeEmptyFactor(superFunc: any, dischargeNode: any)` | 128 | ✍ Returns the parent's empty factor multiplied by `treatmentSpeedFactor` when treatment liquid is available and the current fill type is convertible; otherwise returns the parent's value unchanged. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `discharge` | 44 |
| registerOverwrittenFunction | `getDischargeFillType` | 45 |
| registerOverwrittenFunction | `getDischargeNodeEmptyFactor` | 46 |
| registerEventListener | `onLoad` | 52 |
| registerEventListener | `onUpdate` | 53 |
