# animals/husbandry/placeables/PlaceableHusbandryPallets.lua

Source : `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryPallets.lua` — FS25 1.25.1.0

- **PlaceableHusbandryPallets** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableHusbandryPallets.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableHusbandryPallets.registerFunctions(placeableType: any)` | 24 |  |
| `PlaceableHusbandryPallets.registerOverwrittenFunctions(placeableType: any)` | 37 |  |
| `PlaceableHusbandryPallets.registerEventListeners(placeableType: any)` | 45 |  |
| `PlaceableHusbandryPallets.registerXMLPaths(schema: any, basePath: any)` | 58 |  |
| `PlaceableHusbandryPallets.registerSavegameXMLPaths(schema: any, basePath: any)` | 71 |  |
| `PlaceableHusbandryPallets:onLoad(savegame: any)` | 80 |  |
| `PlaceableHusbandryPallets:onDelete()` | 176 |  |
| `PlaceableHusbandryPallets:onFinalizePlacement()` | 196 |  |
| `PlaceableHusbandryPallets:onReadStream(streamId: any, connection: any)` | 213 |  |
| `PlaceableHusbandryPallets:onWriteStream(streamId: any, connection: any)` | 225 |  |
| `PlaceableHusbandryPallets:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 238 |  |
| `PlaceableHusbandryPallets:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 254 |  |
| `PlaceableHusbandryPallets:loadFromXMLFile(xmlFile: any, key: any)` | 270 |  |
| `PlaceableHusbandryPallets:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 285 |  |
| `PlaceableHusbandryPallets:onHusbandryAnimalsUpdate(clusters: any)` | 300 |  |
| `PlaceableHusbandryPallets:onPalletTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 328 |  |
| `PlaceableHusbandryPallets:updatePalletInfo()` | 347 |  |
| `PlaceableHusbandryPallets:getAllPalletsCallback(pallets: any, fillTypeIndex: any)` | 367 |  |
| `PlaceableHusbandryPallets:updatePallets()` | 400 |  |
| `PlaceableHusbandryPallets:addPendingLiters(fillTypeIndex: integer, liters: number) → number` | 420 |  |
| `PlaceableHusbandryPallets:getPalletCallback(pallet: any, result: any, fillTypeIndex: any)` | 442 |  |
| `PlaceableHusbandryPallets:showSpawnerBlockedWarning(fillTypeIndex: any)` | 482 |  |
| `PlaceableHusbandryPallets:showPalletBlockedWarning(fillTypeIndex: any)` | 497 |  |
| `PlaceableHusbandryPallets:updateInfo(superFunc: any, infoTable: any)` | 509 |  |
| `PlaceableHusbandryPallets:getConditionInfos(superFunc: any)` | 520 |  |
| `PlaceableHusbandryPallets:updateOutput(superFunc: any, foodFactor: any, productionFactor: any, globalProductionFactor: any)` | 551 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onPalletTriggerCallback` | 25 |
| registerFunction | `getAllPalletsCallback` | 26 |
| registerFunction | `updatePallets` | 27 |
| registerFunction | `addPendingLiters` | 28 |
| registerFunction | `getPalletCallback` | 29 |
| registerFunction | `showSpawnerBlockedWarning` | 30 |
| registerFunction | `showPalletBlockedWarning` | 31 |
| registerFunction | `updatePalletInfo` | 32 |
| registerOverwrittenFunction | `getConditionInfos` | 38 |
| registerOverwrittenFunction | `updateOutput` | 39 |
| registerOverwrittenFunction | `updateInfo` | 40 |
| registerEventListener | `onLoad` | 46 |
| registerEventListener | `onDelete` | 47 |
| registerEventListener | `onFinalizePlacement` | 48 |
| registerEventListener | `onReadStream` | 49 |
| registerEventListener | `onWriteStream` | 50 |
| registerEventListener | `onReadUpdateStream` | 51 |
| registerEventListener | `onWriteUpdateStream` | 52 |
| registerEventListener | `onHusbandryAnimalsUpdate` | 53 |
