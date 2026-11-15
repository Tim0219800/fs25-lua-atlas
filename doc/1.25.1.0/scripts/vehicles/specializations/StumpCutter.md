# vehicles/specializations/StumpCutter.lua

Source: `dataS/scripts/vehicles/specializations/StumpCutter.lua` — FS25 1.25.1.0

- **StumpCutter** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `StumpCutter.prerequisitesPresent(specializations: table) → boolean` | 19 |  |
| `StumpCutter.initSpecialization()` | 25 |  |
| `StumpCutter.registerFunctions(vehicleType: any)` | 60 |  |
| `StumpCutter.registerOverwrittenFunctions(vehicleType: any)` | 68 |  |
| `StumpCutter.registerEventListeners(vehicleType: any)` | 79 |  |
| `StumpCutter:onLoad(savegame: table)` | 91 |  |
| `StumpCutter:onDelete()` | 170 |  |
| `StumpCutter:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 188 |  |
| `StumpCutter:onDeactivate()` | 311 |  |
| `StumpCutter:onTurnedOn()` | 324 |  |
| `StumpCutter:onTurnedOff()` | 337 |  |
| `StumpCutter:crushSplitShape(shape: integer)` | 355 |  |
| `StumpCutter:stumpCutterSplitShapeCallback(shape: integer, isBelow: boolean, isAbove: boolean, minY: number, maxY: number, minZ: number, maxZ: number)` | 375 |  |
| `StumpCutter:processStumpCutterArea(workArea: any, dt: any)` | 402 |  |
| `StumpCutter:getDirtMultiplier(superFunc: any) → number` | 432 |  |
| `StumpCutter:getWearMultiplier(superFunc: any) → number` | 446 |  |
| `StumpCutter:getCultivatorLimitToField(superFunc: any) → boolean` | 460 |  |
| `StumpCutter:getPlowLimitToField() → boolean` | 467 |  |
| `StumpCutter:getPlowForceLimitToField() → boolean` | 474 |  |
| `StumpCutter:getConsumingLoad(superFunc: any)` | 480 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `crushSplitShape` | 61 |
| registerFunction | `stumpCutterSplitShapeCallback` | 62 |
| registerFunction | `processStumpCutterArea` | 63 |
| registerOverwrittenFunction | `getDirtMultiplier` | 69 |
| registerOverwrittenFunction | `getWearMultiplier` | 70 |
| registerOverwrittenFunction | `getCultivatorLimitToField` | 71 |
| registerOverwrittenFunction | `getPlowLimitToField` | 72 |
| registerOverwrittenFunction | `getPlowForceLimitToField` | 73 |
| registerOverwrittenFunction | `getConsumingLoad` | 74 |
| registerEventListener | `onLoad` | 80 |
| registerEventListener | `onDelete` | 81 |
| registerEventListener | `onUpdateTick` | 82 |
| registerEventListener | `onDeactivate` | 83 |
| registerEventListener | `onTurnedOn` | 84 |
| registerEventListener | `onTurnedOff` | 85 |
