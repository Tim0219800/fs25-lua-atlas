# vehicles/specializations/ConveyorBelt.lua

Source: `dataS/scripts/vehicles/specializations/ConveyorBelt.lua` — FS25 1.25.1.0

- **ConveyorBelt** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `ConveyorBelt.prerequisitesPresent(specializations: table) → boolean` | 17 |  |
| `ConveyorBelt.initSpecialization()` | 23 |  |
| `ConveyorBelt.registerFunctions(vehicleType: any)` | 46 |  |
| `ConveyorBelt.registerOverwrittenFunctions(vehicleType: any)` | 54 |  |
| `ConveyorBelt.registerEventListeners(vehicleType: any)` | 65 |  |
| `ConveyorBelt:onLoad(savegame: table)` | 79 |  |
| `ConveyorBelt:onPostLoad(savegame: any)` | 176 |  |
| `ConveyorBelt:onDelete()` | 209 |  |
| `ConveyorBelt:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 221 |  |
| `ConveyorBelt:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 236 |  |
| `ConveyorBelt:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 251 |  |
| `ConveyorBelt:getConveyorBeltFillLevel()` | 343 |  |
| `ConveyorBelt:getConveyorBeltTargetObject()` | 359 |  |
| `ConveyorBelt:getLoadTriggerMaxFillSpeed()` | 377 |  |
| `ConveyorBelt:getDischargeNodeEmptyFactor(superFunc: any, dischargeNode: any)` | 395 |  |
| `ConveyorBelt:handleDischargeOnEmpty(superFunc: any, dischargeNode: any)` | 412 |  |
| `ConveyorBelt:handleDischarge(superFunc: any, dischargeNode: any, dischargedLiters: any, minDropReached: any, hasMinDropFillLevel: any)` | 422 |  |
| `ConveyorBelt:getIsEnterable(superFunc: any)` | 432 |  |
| `ConveyorBelt.getHasConveyorBeltLoop(rootVehicle: any, vehicle: any, fillUnitIndex: any)` | 438 |  |
| `ConveyorBelt:getFillUnitAllowsFillType(superFunc: any, fillUnitIndex: any, fillType: any)` | 458 |  |
| `ConveyorBelt:getFillUnitFreeCapacity(superFunc: any, fillUnitIndex: any, fillTypeIndex: any, farmId: any)` | 489 |  |
| `ConveyorBelt:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 509 |  |
| `ConveyorBelt:onMovingToolChanged(movingTool: any, speed: any, dt: any)` | 551 |  |
| `ConveyorBelt:updateDebugValues(values: any)` | 589 |  |

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
