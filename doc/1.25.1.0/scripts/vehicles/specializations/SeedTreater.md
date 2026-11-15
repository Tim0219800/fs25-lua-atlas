# vehicles/specializations/SeedTreater.lua

Source: `dataS/scripts/vehicles/specializations/SeedTreater.lua` — FS25 1.25.1.0

- **SeedTreater** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `SeedTreater.prerequisitesPresent(specializations: table) → boolean` | 17 |  |
| `SeedTreater.initSpecialization()` | 23 |  |
| `SeedTreater.registerFunctions(vehicleType: any)` | 38 |  |
| `SeedTreater.registerOverwrittenFunctions(vehicleType: any)` | 43 |  |
| `SeedTreater.registerEventListeners(vehicleType: any)` | 51 |  |
| `SeedTreater:onLoad(savegame: any)` | 58 |  |
| `SeedTreater:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 70 |  |
| `SeedTreater:discharge(superFunc: any, dischargeNode: any, emptyLiters: any)` | 95 |  |
| `SeedTreater:getDischargeFillType(superFunc: any, dischargeNode: any)` | 117 |  |
| `SeedTreater:getDischargeNodeEmptyFactor(superFunc: any, dischargeNode: any)` | 128 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `discharge` | 44 |
| registerOverwrittenFunction | `getDischargeFillType` | 45 |
| registerOverwrittenFunction | `getDischargeNodeEmptyFactor` | 46 |
| registerEventListener | `onLoad` | 52 |
| registerEventListener | `onUpdate` | 53 |
