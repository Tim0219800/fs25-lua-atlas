# vehicles/specializations/Shovel.lua

Source: `dataS/scripts/vehicles/specializations/Shovel.lua` — FS25 1.25.1.0

- **Shovel** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `Shovel.prerequisitesPresent(specializations: any)` | 17 |  |
| `Shovel.initSpecialization()` | 23 |  |
| `Shovel.registerFunctions(vehicleType: any)` | 61 |  |
| `Shovel.registerOverwrittenFunctions(vehicleType: any)` | 71 |  |
| `Shovel.registerEventListeners(vehicleType: any)` | 85 |  |
| `Shovel:onLoad(savegame: any)` | 98 |  |
| `Shovel:onDelete()` | 166 |  |
| `Shovel:onReadStream(streamId: any, connection: any)` | 173 |  |
| `Shovel:onWriteStream(streamId: any, connection: any)` | 180 |  |
| `Shovel:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 187 |  |
| `Shovel:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 199 |  |
| `Shovel:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 211 |  |
| `Shovel:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 318 |  |
| `Shovel:loadShovelNode(xmlFile: any, key: any, shovelNode: any)` | 338 |  |
| `Shovel:getShovelNodeIsActive(shovelNode: any)` | 374 |  |
| `Shovel:getIsDischargeNodeActive(superFunc: any, dischargeNode: any)` | 406 |  |
| `Shovel:getDischargeNodeEmptyFactor(superFunc: any, dischargeNode: any)` | 423 |  |
| `Shovel:handleDischarge(superFunc: any, dischargeNode: any, dischargedLiters: any, minDropReached: any, hasMinDropFillLevel: any)` | 440 |  |
| `Shovel:handleDischargeOnEmpty(superFunc: any, dischargedLiters: any, minDropReached: any, hasMinDropFillLevel: any)` | 450 |  |
| `Shovel:handleDischargeRaycast(superFunc: any, dischargeNode: any, hitObject: any, hitShape: any, hitDistance: any, hitFillUnitIndex: any, hitTerrain: any)` | 458 |  |
| `Shovel:getCanToggleDischargeToObject(superFunc: any)` | 499 |  |
| `Shovel:getCanToggleDischargeToGround(superFunc: any)` | 509 |  |
| `Shovel:getShovelTipFactor()` | 519 |  |
| `Shovel:getIsShovelEffectState() → boolean` | 537 |  |
| `Shovel:getWearMultiplier(superFunc: any) → number` | 545 |  |
| `Shovel:doCheckSpeedLimit(superFunc: any) → boolean` | 559 |  |
| `Shovel:getCanShovelAtPosition(shovelNode: any)` | 565 |  |
| `Shovel:updateDebugValues(values: any)` | 593 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadShovelNode` | 62 |
| registerFunction | `getShovelNodeIsActive` | 63 |
| registerFunction | `getCanShovelAtPosition` | 64 |
| registerFunction | `getShovelTipFactor` | 65 |
| registerFunction | `getIsShovelEffectState` | 66 |
| registerOverwrittenFunction | `getIsDischargeNodeActive` | 72 |
| registerOverwrittenFunction | `getDischargeNodeEmptyFactor` | 73 |
| registerOverwrittenFunction | `handleDischarge` | 74 |
| registerOverwrittenFunction | `handleDischargeOnEmpty` | 75 |
| registerOverwrittenFunction | `handleDischargeRaycast` | 76 |
| registerOverwrittenFunction | `getCanToggleDischargeToObject` | 77 |
| registerOverwrittenFunction | `getCanToggleDischargeToGround` | 78 |
| registerOverwrittenFunction | `getWearMultiplier` | 79 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 80 |
| registerEventListener | `onLoad` | 86 |
| registerEventListener | `onReadStream` | 87 |
| registerEventListener | `onWriteStream` | 88 |
| registerEventListener | `onReadUpdateStream` | 89 |
| registerEventListener | `onWriteUpdateStream` | 90 |
| registerEventListener | `onDelete` | 91 |
| registerEventListener | `onUpdateTick` | 92 |
| registerEventListener | `onFillUnitFillLevelChanged` | 93 |
