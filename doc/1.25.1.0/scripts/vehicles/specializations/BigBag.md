# vehicles/specializations/BigBag.lua

Source: `dataS/scripts/vehicles/specializations/BigBag.lua` — FS25 1.25.1.0

- **BigBag** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `BigBag.prerequisitesPresent(specializations: table) → boolean` | 17 |  |
| `BigBag.initSpecialization()` | 23 |  |
| `BigBag.registerFunctions(vehicleType: any)` | 48 |  |
| `BigBag.registerOverwrittenFunctions(vehicleType: any)` | 53 |  |
| `BigBag.registerEventListeners(vehicleType: any)` | 59 |  |
| `BigBag:onLoad(savegame: table)` | 68 |  |
| `BigBag:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 116 |  |
| `BigBag:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 149 |  |
| `BigBag:getInfoBoxTitle(superFunc: any)` | 172 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `getInfoBoxTitle` | 54 |
| registerEventListener | `onLoad` | 60 |
| registerEventListener | `onUpdate` | 61 |
| registerEventListener | `onFillUnitFillLevelChanged` | 62 |
