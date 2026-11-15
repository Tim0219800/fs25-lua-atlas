# placeables/specializations/PlaceableSilo.lua

Source : `dataS/scripts/placeables/specializations/PlaceableSilo.lua` — FS25 1.25.1.0

- **PlaceableSilo** (l.11)
- **PlaceableSiloActivatable** (l.561)
- **PlaceableSiloRefillEvent** hérite de `Event` (l.596)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableSilo.prerequisitesPresent(specializations: table) → boolean` | 21 |  |
| `PlaceableSilo.registerOverwrittenFunctions(placeableType: any)` | 27 |  |
| `PlaceableSilo.registerFunctions(placeableType: any)` | 36 |  |
| `PlaceableSilo.registerEventListeners(placeableType: any)` | 45 |  |
| `PlaceableSilo.registerXMLPaths(schema: any, basePath: any)` | 56 |  |
| `PlaceableSilo.registerSavegameXMLPaths(schema: any, basePath: any)` | 71 |  |
| `PlaceableSilo.initSpecialization()` | 80 |  |
| `PlaceableSilo:onLoad(savegame: table)` | 87 |  |
| `PlaceableSilo:onDelete()` | 144 |  |
| `PlaceableSilo:onFinalizePlacement()` | 190 |  |
| `PlaceableSilo:onReadStream(streamId: any, connection: any)` | 246 |  |
| `PlaceableSilo:onWriteStream(streamId: any, connection: any)` | 266 |  |
| `PlaceableSilo:collectPickObjects(superFunc: any, node: any)` | 286 |  |
| `PlaceableSilo:canBeSold(superFunc: any)` | 313 |  |
| `PlaceableSilo:loadFromXMLFile(xmlFile: any, key: any)` | 362 |  |
| `PlaceableSilo:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 381 |  |
| `PlaceableSilo:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 393 |  |
| `PlaceableSilo:setAmount(fillType: any, amount: any)` | 409 |  |
| `PlaceableSilo:refillAmount(fillTypeIndex: any, amount: any, price: any)` | 429 |  |
| `PlaceableSilo:getFillLevels()` | 463 |  |
| `PlaceableSilo:onSell()` | 479 |  |
| `PlaceableSilo:onPlayerActionTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 491 |  |
| `PlaceableSilo:updateInfo(superFunc: any, infoTable: any)` | 506 |  |
| `PlaceableSilo.loadSpecValueVolume(xmlFile: any, customEnvironment: any, baseDir: any)` | 544 |  |
| `PlaceableSilo.getSpecValueVolume(storeItem: any, realItem: any)` | 550 |  |
| `PlaceableSiloActivatable.new(placeable: any)` | 565 |  |
| `PlaceableSiloActivatable:run()` | 576 |  |
| `PlaceableSiloRefillEvent.emptyNew()` | 602 |  |
| `PlaceableSiloRefillEvent.new(placeable: any, fillTypeIndex: any, amount: any, price: any)` | 609 |  |
| `PlaceableSiloRefillEvent:writeStream(streamId: any, connection: any)` | 622 |  |
| `PlaceableSiloRefillEvent:readStream(streamId: any, connection: any)` | 631 |  |
| `PlaceableSiloRefillEvent:run(connection: any)` | 642 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `collectPickObjects` | 28 |
| registerOverwrittenFunction | `setOwnerFarmId` | 29 |
| registerOverwrittenFunction | `canBeSold` | 30 |
| registerOverwrittenFunction | `updateInfo` | 31 |
| registerFunction | `setAmount` | 37 |
| registerFunction | `refillAmount` | 38 |
| registerFunction | `getFillLevels` | 39 |
| registerFunction | `onPlayerActionTriggerCallback` | 40 |
| registerEventListener | `onLoad` | 46 |
| registerEventListener | `onDelete` | 47 |
| registerEventListener | `onFinalizePlacement` | 48 |
| registerEventListener | `onReadStream` | 49 |
| registerEventListener | `onWriteStream` | 50 |
| registerEventListener | `onSell` | 51 |
