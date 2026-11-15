# vehicles/specializations/StrawBlower.lua

Source: `dataS/scripts/vehicles/specializations/StrawBlower.lua` — FS25 1.25.1.0

- **StrawBlower** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `StrawBlower.prerequisitesPresent(specializations: table) → boolean` | 17 |  |
| `StrawBlower.initSpecialization()` | 24 |  |
| `StrawBlower.registerFunctions(vehicleType: any)` | 43 |  |
| `StrawBlower.registerOverwrittenFunctions(vehicleType: any)` | 50 |  |
| `StrawBlower.registerEventListeners(vehicleType: any)` | 58 |  |
| `StrawBlower:onLoad(savegame: table)` | 69 |  |
| `StrawBlower:onDelete()` | 112 |  |
| `StrawBlower:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 141 |  |
| `StrawBlower:addFillUnitFillLevel(superFunc: any, farmId: any, fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any)` | 156 |  |
| `StrawBlower:strawBlowerBaleTriggerCallback(triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 173 |  |
| `StrawBlower:onDeleteStrawBlowerObject(object: any)` | 223 |  |
| `StrawBlower:getDrawFirstFillText(superFunc: any)` | 238 |  |
| `StrawBlower:getAllowDynamicMountFillLevelInfo(superFunc: any)` | 245 |  |
| `StrawBlower:onFillUnitFillLevelChanged(fillUnitIndex: integer, fillLevelDelta: number, fillTypeIndex: integer, toolType: boolean, fillPositionData: table, appliedDelta: any)` | 256 |  |
| `StrawBlower:onDischargeStateChanged(state: any)` | 291 |  |

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
