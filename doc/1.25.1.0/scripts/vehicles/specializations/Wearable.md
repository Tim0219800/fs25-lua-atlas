# vehicles/specializations/Wearable.lua

Source : `dataS/scripts/vehicles/specializations/Wearable.lua` — FS25 1.25.1.0

- **Wearable** (l.19)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Wearable.prerequisitesPresent(specializations: any)` | 29 |  |
| `Wearable.initSpecialization()` | 35 |  |
| `Wearable.registerFunctions(vehicleType: any)` | 57 |  |
| `Wearable.registerOverwrittenFunctions(vehicleType: any)` | 85 |  |
| `Wearable.registerEventListeners(vehicleType: any)` | 94 |  |
| `Wearable:onLoad(savegame: any)` | 110 |  |
| `Wearable:onLoadFinished(savegame: any)` | 138 |  |
| `Wearable:onSaleItemSet(saleItem: any)` | 168 |  |
| `Wearable:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 175 |  |
| `Wearable:onReadStream(streamId: any, connection: any)` | 190 |  |
| `Wearable:onWriteStream(streamId: any, connection: any)` | 205 |  |
| `Wearable:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 219 |  |
| `Wearable:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 238 |  |
| `Wearable:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 256 |  |
| `Wearable:setDamageAmount(amount: any, force: any)` | 278 |  |
| `Wearable:updateWearAmount(nodeData: any, dt: any)` | 295 |  |
| `Wearable:updateDamageAmount(dt: any)` | 306 |  |
| `Wearable:getUsageCausesWear()` | 326 |  |
| `Wearable:getUsageCausesDamage()` | 332 |  |
| `Wearable:addWearAmount(wearAmount: any, force: any)` | 344 |  |
| `Wearable:addDamageAmount(amount: any, force: any)` | 355 |  |
| `Wearable:setNodeWearAmount(nodeData: any, wearAmount: any, force: any)` | 362 |  |
| `Wearable:getNodeWearAmount(nodeData: any)` | 388 |  |
| `Wearable:getWearTotalAmount() → number` | 395 |  |
| `Wearable:getDamageAmount() → number` | 402 |  |
| `Wearable:getDamageShowOnHud() → boolean` | 409 |  |
| `Wearable:repairVehicle()` | 415 |  |
| `Wearable:getRepairPrice(superFunc: any)` | 449 |  |
| `Wearable.calculateRepairPrice(price: any, damage: any)` | 456 |  |
| `Wearable:getRepaintPrice(superFunc: any)` | 464 |  |
| `Wearable:showInfo(superFunc: any, box: any)` | 470 |  |
| `Wearable.calculateRepaintPrice(price: any, wear: any)` | 482 |  |
| `Wearable:getVehicleDamage(superFunc: any)` | 488 |  |
| `Wearable:addAllSubWearableNodes(rootNode: any)` | 494 |  |
| `Wearable:addWearableNode(node: any)` | 502 |  |
| `Wearable:validateWearableNode(node: any)` | 513 |  |
| `Wearable:addToGlobalWearableNode(node: any)` | 519 |  |
| `Wearable:addToLocalWearableNode(node: any, updateFunc: any, customIndex: any, extraParams: any)` | 528 |  |
| `Wearable:removeAllSubWearableNodes(rootNode: any)` | 563 |  |
| `Wearable:removeWearableNode(node: node)` | 572 |  |
| `Wearable:getWearMultiplier() → number` | 585 |  |
| `Wearable:getWorkWearMultiplier() → number` | 603 |  |
| `Wearable:updateDebugValues(values: any)` | 611 |  |
| `Wearable.loadSpecValueCondition(xmlFile: any, customEnvironment: any, baseDir: any)` | 629 |  |
| `Wearable.getSpecValueCondition(storeItem: any, realItem: any)` | 636 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `addAllSubWearableNodes` | 58 |
| registerFunction | `addDamageAmount` | 59 |
| registerFunction | `addToGlobalWearableNode` | 60 |
| registerFunction | `addToLocalWearableNode` | 61 |
| registerFunction | `addWearableNode` | 62 |
| registerFunction | `addWearAmount` | 63 |
| registerFunction | `getDamageAmount` | 64 |
| registerFunction | `getDamageShowOnHud` | 65 |
| registerFunction | `getNodeWearAmount` | 66 |
| registerFunction | `getUsageCausesDamage` | 67 |
| registerFunction | `getUsageCausesWear` | 68 |
| registerFunction | `getWearMultiplier` | 69 |
| registerFunction | `getWearTotalAmount` | 70 |
| registerFunction | `getWorkWearMultiplier` | 71 |
| registerFunction | `removeAllSubWearableNodes` | 72 |
| registerFunction | `removeWearableNode` | 73 |
| registerFunction | `repaintVehicle` | 74 |
| registerFunction | `repairVehicle` | 75 |
| registerFunction | `setDamageAmount` | 76 |
| registerFunction | `setNodeWearAmount` | 77 |
| registerFunction | `updateDamageAmount` | 78 |
| registerFunction | `updateWearAmount` | 79 |
| registerFunction | `validateWearableNode` | 80 |
| registerOverwrittenFunction | `getVehicleDamage` | 86 |
| registerOverwrittenFunction | `getRepairPrice` | 87 |
| registerOverwrittenFunction | `getRepaintPrice` | 88 |
| registerOverwrittenFunction | `showInfo` | 89 |
| registerEventListener | `onLoad` | 95 |
| registerEventListener | `onLoadFinished` | 96 |
| registerEventListener | `onSaleItemSet` | 99 |
| registerEventListener | `onReadStream` | 100 |
| registerEventListener | `onWriteStream` | 101 |
| registerEventListener | `onReadUpdateStream` | 102 |
| registerEventListener | `onWriteUpdateStream` | 103 |
| registerEventListener | `onUpdateTick` | 104 |
