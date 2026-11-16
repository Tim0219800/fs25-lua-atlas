# placeables/specializations/PlaceableSilo.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableSilo.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableSilo.lua` — FS25 1.25.1.0

✍ Placeable specialization with no prerequisites for silos. It builds an UnloadingStation, a LoadingStation and one or more Storage objects (one per farm slot when storages perFarm is set and in multiplayer), registers them with g_currentMission.storageSystem, streams them to clients, saves storage contents, handles selling with a content-value warning, and shows fill levels in the info HUD. The same file also defines PlaceableSiloActivatable (refill action) and PlaceableSiloRefillEvent (client to server refill request).

- **PlaceableSilo** (l.11)
- **PlaceableSiloActivatable** (l.561)
- **PlaceableSiloRefillEvent** inherits from `Event` (l.596)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableSilo.prerequisitesPresent(specializations: table) → boolean` | 21 | ✍ Always returns true. |
| `PlaceableSilo.registerOverwrittenFunctions(placeableType: any)` | 27 | ✍ Overrides collectPickObjects, setOwnerFarmId, canBeSold and updateInfo. |
| `PlaceableSilo.registerFunctions(placeableType: any)` | 36 | ✍ Registers setAmount, refillAmount, getFillLevels and onPlayerActionTriggerCallback on the placeable type. |
| `PlaceableSilo.registerEventListeners(placeableType: any)` | 45 | ✍ Subscribes to onLoad, onDelete, onFinalizePlacement, onReadStream, onWriteStream and onSell. |
| `PlaceableSilo.registerXMLPaths(schema: any, basePath: any)` | 56 | ✍ Declares the XML under placeable.silo: sell warning text, player action trigger, perFarm and foreignSilo flags, plus unloading station, loading station and storage definitions. |
| `PlaceableSilo.registerSavegameXMLPaths(schema: any, basePath: any)` | 71 | ✍ Declares savegame keys for each storage: its index and the Storage savegame data. |
| `PlaceableSilo.initSpecialization()` | 80 | ✍ Adds the shop spec type siloVolume (capacity icon) for placeables. |
| `PlaceableSilo:onLoad(savegame: table)` | 87 | ✍ Loads the player trigger and activatable, the unloading and loading stations, and the storages (one set per farm slot if perFarm and multiplayer, otherwise one). Each storage gets its farm id and foreignSilo flag. Reads the sell warning text. |
| `PlaceableSilo:onDelete()` | 144 | ✍ Detaches storages from the stations and the storage system, then deletes storages, stations (also removing a liquid manure loading station), the activatable and the trigger. Note: it passes spec.storageFilLLevelChangedCallback to removeFillLevelChangedListeners, a field that is never set in this file. |
| `PlaceableSilo:onFinalizePlacement()` | 190 | ✍ Registers stations and storages as network objects, adds them to the storage system and links them, gives single-owner storages the placeable's farm, attaches storage extensions found in range, and enables the player action trigger. |
| `PlaceableSilo:onReadStream(streamId: any, connection: any)` | 246 | ✍ Client initial sync: reads the unloading station, loading station and every storage (object id then data) and completes their registration with g_client. |
| `PlaceableSilo:onWriteStream(streamId: any, connection: any)` | 266 | ✍ Server initial sync: writes object id and data for the unloading station, loading station and every storage, registering each in the stream. |
| `PlaceableSilo:collectPickObjects(superFunc: any, node: any)` | 286 | ✍ Skips nodes that are an unload trigger's exact fill root node or a load trigger node; otherwise defers to the parent. |
| `PlaceableSilo:canBeSold(superFunc: any)` | 313 | ✍ Returns false for per-farm silos. Otherwise returns true and, if the first storage holds content, a warning listing each fill type with an estimated sell value (lowest selling-point price times PRICE_SELL_FACTOR); the total is kept for onSell. |
| `PlaceableSilo:loadFromXMLFile(xmlFile: any, key: any)` | 362 | ✍ Loads each saved storage by its index into the matching storage object. |
| `PlaceableSilo:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 381 | ✍ Saves every storage with its 1-based index. |
| `PlaceableSilo:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 393 | ✍ Calls the parent, then on the server propagates the farm id to all storages unless the silo is per farm. |
| `PlaceableSilo:setAmount(fillType: any, amount: any)` | 409 | ✍ Sets the fill level of a fill type by filling storages in order, each up to its free capacity, until the amount is spent. |
| `PlaceableSilo:refillAmount(fillTypeIndex: any, amount: any, price: any)` | 429 | ✍ Buys material to refill the silo. On a client it sends PlaceableSiloRefillEvent to the server; on the server it adds the amount across storages and charges the farm (BOUGHT_MATERIALS). Does nothing if an argument is nil. |
| `PlaceableSilo:getFillLevels()` | 463 | ✍ Returns a table fill type index to level combined from all storages, keeping only fill types allowed by self.fillTypes when it is set. Note: for fill types in several storages the last value overwrites the earlier ones instead of summing. |
| `PlaceableSilo:onSell()` | 479 | ✍ Server only: pays the farm the total stored-content value computed in canBeSold as HARVEST_INCOME. |
| `PlaceableSilo:onPlayerActionTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 491 | ✍ When the local player of the owning farm enters or leaves the trigger, adds or removes the refill activatable. |
| `PlaceableSilo:updateInfo(superFunc: any, infoTable: any)` | 506 | ✍ Calls the parent, then adds to the info table the largest fill levels (above 0.1) from the loading station for the local farm, up to INFO_TRIGGER_NUM_DISPLAYED_FILLTYPES entries, or an empty-silo line. |
| `PlaceableSilo.loadSpecValueVolume(xmlFile: any, customEnvironment: any, baseDir: any)` | 544 | ✍ Reads the capacity of the first storage from the store item XML. |
| `PlaceableSilo.getSpecValueVolume(storeItem: any, realItem: any)` | 550 | ✍ Returns the silo volume formatted for the shop, or nil if the store item has none. |
| `PlaceableSiloActivatable.new(placeable: any)` | 565 | ✍ Creates the refill activatable for a silo placeable with the refill action text. |
| `PlaceableSiloActivatable:run()` | 576 | ✍ Sums the free capacity per fill type over all storages and opens RefillDialog, whose confirmation calls the placeable's refillAmount. |
| `PlaceableSiloRefillEvent.emptyNew()` | 602 | ✍ Creates an empty refill event, used when reading from the network. |
| `PlaceableSiloRefillEvent.new(placeable: any, fillTypeIndex: any, amount: any, price: any)` | 609 | ✍ Creates a refill event holding the placeable, fill type index, amount and price. |
| `PlaceableSiloRefillEvent:writeStream(streamId: any, connection: any)` | 622 | ✍ Writes the placeable, amount and price (int32) and the fill type index to the stream. |
| `PlaceableSiloRefillEvent:readStream(streamId: any, connection: any)` | 631 | ✍ Reads placeable, amount, price and fill type index, then runs the event immediately. |
| `PlaceableSiloRefillEvent:run(connection: any)` | 642 | ✍ On the receiving server (connection not to a server), calls refillAmount on the placeable with the transmitted values. |

## Specialization

| Type | Name | Line |
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
