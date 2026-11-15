# vehicles/specializations/TreePlanter.lua

Source: `dataS/scripts/vehicles/specializations/TreePlanter.lua` — FS25 1.25.1.0

- **TreePlanter** (l.16)
- **TreePlanterActivatable** (l.1396)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `TreePlanter.prerequisitesPresent(specializations: table) → boolean` | 38 |  |
| `TreePlanter.initSpecialization()` | 46 |  |
| `TreePlanter.registerFunctions(vehicleType: any)` | 84 |  |
| `TreePlanter.registerOverwrittenFunctions(vehicleType: any)` | 99 |  |
| `TreePlanter.registerEventListeners(vehicleType: any)` | 125 |  |
| `TreePlanter:onLoad(savegame: table)` | 146 |  |
| `TreePlanter:onDelete()` | 252 |  |
| `TreePlanter:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 281 |  |
| `TreePlanter:removeMountedObject(object: integer, isDeleting: boolean)` | 307 |  |
| `TreePlanter:onReadStream(streamId: integer, connection: Connection)` | 320 |  |
| `TreePlanter:onWriteStream(streamId: integer, connection: Connection)` | 347 |  |
| `TreePlanter:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 374 |  |
| `TreePlanter:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 390 |  |
| `TreePlanter:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 406 |  |
| `TreePlanter:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 469 |  |
| `TreePlanter:onDraw(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 673 |  |
| `TreePlanter:onTurnedOn()` | 708 |  |
| `TreePlanter:onTurnedOff()` | 718 |  |
| `TreePlanter:onFillUnitIsFillingStateChanged(isFilling: any)` | 729 |  |
| `TreePlanter:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 747 |  |
| `TreePlanter:onFillUnitUnloadPallet(pallet: any)` | 755 |  |
| `TreePlanter:addFillUnitFillLevel(superFunc: any, farmId: any, fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any)` | 769 |  |
| `TreePlanter:getFillUnitFillLevel(superFunc: any, fillUnitIndex: any)` | 788 |  |
| `TreePlanter:getFillUnitFillLevelPercentage(superFunc: any, fillUnitIndex: any)` | 808 |  |
| `TreePlanter:getFillUnitFillType(superFunc: any, fillUnitIndex: any)` | 826 |  |
| `TreePlanter:getFillUnitCapacity(superFunc: any, fillUnitIndex: any)` | 845 |  |
| `TreePlanter:getFillUnitAllowsFillType(superFunc: any, fillUnitIndex: any, fillType: any)` | 865 |  |
| `TreePlanter:getFillUnitFreeCapacity(superFunc: any, fillUnitIndex: any, fillTypeIndex: any, farmId: any)` | 879 |  |
| `TreePlanter:getFillLevelInformation(superFunc: any, display: any)` | 893 |  |
| `TreePlanter:getHasObjectMounted(superFunc: table, object: table) → boolean` | 912 |  |
| `TreePlanter:getFillUnitUnloadPalletFilename(superFunc: any, fillUnitIndex: any)` | 935 |  |
| `TreePlanter:getFillUnitHasMountedPalletsToUnload(superFunc: any)` | 946 |  |
| `TreePlanter:getFillUnitMountedPalletsToUnload(superFunc: any)` | 952 |  |
| `TreePlanter:getImplementAllowAutomaticSteering(superFunc: any)` | 958 |  |
| `TreePlanter:getCanPlantOutsideSeason()` | 964 |  |
| `TreePlanter:setTreePlanterTreeTypeIndex(treeTypeIndex: any, treeVariationIndex: any, noEventSend: any)` | 970 |  |
| `TreePlanter:onTreePlanterSaplingLoaded(i3dNode: any, failedReason: any, args: any) → integer, table` | 1011 |  |
| `TreePlanter:updateTreePlanterFillLevel(onLoad: any)` | 1029 |  |
| `TreePlanter:setPlantLimitToField(plantLimitToField: boolean, noEventSend: boolean)` | 1064 |  |
| `TreePlanter:createTree(noEventSend: any)` | 1076 |  |
| `TreePlanter:loadPallet(palletObjectId: table, noEventSend: any)` | 1147 |  |
| `TreePlanter:getDirtMultiplier(superFunc: any) → number` | 1158 |  |
| `TreePlanter:getWearMultiplier(superFunc: any) → number` | 1172 |  |
| `TreePlanter:getIsSpeedRotatingPartActive(superFunc: table, speedRotatingPart: table) → boolean` | 1187 |  |
| `TreePlanter:getIsWorkAreaActive(superFunc: any, workArea: any)` | 1199 |  |
| `TreePlanter:doCheckSpeedLimit(superFunc: any) → boolean` | 1215 |  |
| `TreePlanter:getCanBeSelected(superFunc: any)` | 1221 |  |
| `TreePlanter:onDeleteTreePlanterObject(object: any)` | 1227 |  |
| `TreePlanter:getIsOnField(superFunc: any)` | 1238 |  |
| `TreePlanter:palletTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 1253 |  |
| `TreePlanter:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1284 |  |
| `TreePlanter.actionEventToggleTreePlanterFieldLimitation(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1306 |  |
| `TreePlanter.actionEventPlant(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1312 |  |
| `TreePlanter.getDefaultSpeedLimit() → number` | 1337 |  |
| `TreePlanter.getSaplingPalletInRange(self: integer, refNode: integer, palletsInTrigger: any) → table` | 1345 |  |
| `TreePlanterActivatable.new(treePlanterVehicle: table) → table` | 1402 |  |
| `TreePlanterActivatable:getIsActivatable() → boolean` | 1414 |  |
| `TreePlanterActivatable:run()` | 1428 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `removeMountedObject` | 85 |
| registerFunction | `setPlantLimitToField` | 86 |
| registerFunction | `createTree` | 87 |
| registerFunction | `loadPallet` | 88 |
| registerFunction | `palletTriggerCallback` | 89 |
| registerFunction | `onDeleteTreePlanterObject` | 90 |
| registerFunction | `getCanPlantOutsideSeason` | 91 |
| registerFunction | `setTreePlanterTreeTypeIndex` | 92 |
| registerFunction | `onTreePlanterSaplingLoaded` | 93 |
| registerFunction | `updateTreePlanterFillLevel` | 94 |
| registerOverwrittenFunction | `getDirtMultiplier` | 100 |
| registerOverwrittenFunction | `getWearMultiplier` | 101 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 102 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 103 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 104 |
| registerOverwrittenFunction | `getCanBeSelected` | 105 |
| registerOverwrittenFunction | `getIsOnField` | 106 |
| registerOverwrittenFunction | `addFillUnitFillLevel` | 108 |
| registerOverwrittenFunction | `getFillUnitFillLevel` | 109 |
| registerOverwrittenFunction | `getFillUnitFillLevelPercentage` | 110 |
| registerOverwrittenFunction | `getFillUnitFillType` | 111 |
| registerOverwrittenFunction | `getFillUnitCapacity` | 112 |
| registerOverwrittenFunction | `getFillUnitAllowsFillType` | 113 |
| registerOverwrittenFunction | `getFillUnitFreeCapacity` | 114 |
| registerOverwrittenFunction | `getFillLevelInformation` | 115 |
| registerOverwrittenFunction | `getHasObjectMounted` | 116 |
| registerOverwrittenFunction | `getFillUnitHasMountedPalletsToUnload` | 117 |
| registerOverwrittenFunction | `getFillUnitUnloadPalletFilename` | 118 |
| registerOverwrittenFunction | `getFillUnitMountedPalletsToUnload` | 119 |
| registerOverwrittenFunction | `getImplementAllowAutomaticSteering` | 120 |
| registerEventListener | `onLoad` | 126 |
| registerEventListener | `onDelete` | 127 |
| registerEventListener | `onReadStream` | 128 |
| registerEventListener | `onWriteStream` | 129 |
| registerEventListener | `onReadUpdateStream` | 130 |
| registerEventListener | `onWriteUpdateStream` | 131 |
| registerEventListener | `onUpdate` | 132 |
| registerEventListener | `onUpdateTick` | 133 |
| registerEventListener | `onDraw` | 134 |
| registerEventListener | `onRegisterActionEvents` | 135 |
| registerEventListener | `onTurnedOn` | 136 |
| registerEventListener | `onTurnedOff` | 137 |
| registerEventListener | `onFillUnitIsFillingStateChanged` | 138 |
| registerEventListener | `onFillUnitFillLevelChanged` | 139 |
| registerEventListener | `onFillUnitUnloadPallet` | 140 |
