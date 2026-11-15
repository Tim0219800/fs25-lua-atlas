# vehicles/specializations/Consumable.lua

Source : `dataS/scripts/vehicles/specializations/Consumable.lua` — FS25 1.25.1.0


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Consumable.prerequisitesPresent(specializations: table) → boolean` | 26 |  |
| `Consumable.initSpecialization()` | 32 |  |
| `Consumable.registerEvents(vehicleType: table)` | 82 |  |
| `Consumable.registerFunctions(vehicleType: table)` | 89 |  |
| `Consumable.registerOverwrittenFunctions(vehicleType: table)` | 101 |  |
| `Consumable.registerEventListeners(vehicleType: table)` | 110 |  |
| `Consumable:onLoad(savegame: table)` | 130 |  |
| `Consumable:onPostLoad(savegame: table)` | 259 |  |
| `Consumable:onDelete()` | 308 |  |
| `Consumable:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 315 |  |
| `Consumable:onReadStream(streamId: any, connection: any)` | 333 |  |
| `Consumable:onWriteStream(streamId: any, connection: any)` | 358 |  |
| `Consumable:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 377 |  |
| `Consumable:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 406 |  |
| `Consumable:onDirtyMaskCleared()` | 437 |  |
| `Consumable:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 455 |  |
| `Consumable:onDraw(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 494 |  |
| `Consumable:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 513 |  |
| `Consumable:onFillUnitIsFillingStateChanged(isFilling: any)` | 605 |  |
| `Consumable:onAddedFillUnitTrigger(fillTypeIndex: any, fillUnitIndex: any, numTriggers: any)` | 624 |  |
| `Consumable:onRemovedFillUnitTrigger(numTriggers: any)` | 630 |  |
| `Consumable:getConsumableVariationIndexByFillUnitIndex(fillUnitIndex: any)` | 636 |  |
| `Consumable:setConsumableSlotVariationIndex(typeIndex: any, slotIndex: any, variationIndex: any)` | 657 |  |
| `Consumable:updateConsumable(typeName: any, delta: any, consumingInProgress: any, fillConsumingSlots: any)` | 724 |  |
| `Consumable:getConsumableIsAvailable(typeName: any)` | 870 |  |
| `Consumable:getShowConsumableEmptyWarning(typeName: any)` | 882 |  |
| `Consumable:getCustomFillTriggerSpeedFactor(fillTrigger: any, fillUnitIndex: any, fillType: any)` | 894 |  |
| `Consumable:addFillUnitFillLevel(superFunc: any, farmId: any, fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, ...: any)` | 918 |  |
| `Consumable:getFillUnitFreeCapacity(superFunc: any, fillUnitIndex: any, ...: any)` | 938 |  |
| `Consumable:collectPalletTensionBeltNodes(superFunc: any, nodes: any)` | 959 |  |
| `Consumable.updateActivatable(self: any)` | 976 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onConsumableVariationChanged` | 83 |
| registerFunction | `getConsumableVariationIndexByFillUnitIndex` | 90 |
| registerFunction | `setConsumableSlotVariationIndex` | 91 |
| registerFunction | `updateConsumable` | 92 |
| registerFunction | `getConsumableIsAvailable` | 93 |
| registerFunction | `getShowConsumableEmptyWarning` | 94 |
| registerFunction | `getCustomFillTriggerSpeedFactor` | 95 |
| registerOverwrittenFunction | `addFillUnitFillLevel` | 102 |
| registerOverwrittenFunction | `getFillUnitFreeCapacity` | 103 |
| registerOverwrittenFunction | `collectPalletTensionBeltNodes` | 104 |
| registerEventListener | `onLoad` | 111 |
| registerEventListener | `onPostLoad` | 112 |
| registerEventListener | `onDelete` | 113 |
| registerEventListener | `onReadStream` | 114 |
| registerEventListener | `onWriteStream` | 115 |
| registerEventListener | `onReadUpdateStream` | 116 |
| registerEventListener | `onWriteUpdateStream` | 117 |
| registerEventListener | `onDirtyMaskCleared` | 118 |
| registerEventListener | `onUpdate` | 119 |
| registerEventListener | `onDraw` | 120 |
| registerEventListener | `onFillUnitFillLevelChanged` | 121 |
| registerEventListener | `onFillUnitIsFillingStateChanged` | 122 |
| registerEventListener | `onAddedFillUnitTrigger` | 123 |
| registerEventListener | `onRemovedFillUnitTrigger` | 124 |
