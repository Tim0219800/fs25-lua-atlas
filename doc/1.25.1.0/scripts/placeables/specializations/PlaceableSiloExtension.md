# placeables/specializations/PlaceableSiloExtension.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableSiloExtension.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableSiloExtension.lua` — FS25 1.25.1.0

✍ Placeable specialization with no prerequisites for storage extensions that add capacity to existing silos. It owns a single Storage object, registers it with g_currentMission.storageSystem and attaches it to the unloading and loading stations in range of the same farm. Placement is refused when no station is in range, and selling warns about stored content and pays its estimated value. The storage is streamed to clients and saved with the placeable.

- **PlaceableSiloExtension** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableSiloExtension.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Always returns true. |
| `PlaceableSiloExtension.registerOverwrittenFunctions(placeableType: any)` | 25 | ✍ Overrides setOwnerFarmId, getCanBePlacedAt and canBeSold. |
| `PlaceableSiloExtension.registerEventListeners(placeableType: any)` | 33 | ✍ Subscribes to onLoad, onDelete, onFinalizePlacement, onReadStream, onWriteStream and onSell. |
| `PlaceableSiloExtension.registerXMLPaths(schema: any, basePath: any)` | 44 | ✍ Declares the XML under placeable.siloExtension: foreignSilo flag, a translatable warning for placement away from a silo, storage node and the Storage definition. |
| `PlaceableSiloExtension.registerSavegameXMLPaths(schema: any, basePath: any)` | 55 | ✍ Declares the savegame keys by delegating to Storage.registerSavegameXMLPaths. |
| `PlaceableSiloExtension.initSpecialization()` | 63 | ✍ Adds the shop spec type siloExtensionVolume (capacity icon) for placeables. |
| `PlaceableSiloExtension:onLoad(savegame: table)` | 70 | ✍ Creates and loads the Storage from placeable.siloExtension.storage (warns if missing), copies the foreignSilo flag to it and reads the near-silo warning text. |
| `PlaceableSiloExtension:onDelete()` | 90 | ✍ If the storage is known to the storage system, detaches it from all its unloading and loading stations and removes it; then deletes the storage. |
| `PlaceableSiloExtension:onFinalizePlacement()` | 109 | ✍ Finds extendable unloading and loading stations in range for the owner farm, gives the storage its owner, registers it as a network object and adds it to the storage system and those stations. |
| `PlaceableSiloExtension:onReadStream(streamId: any, connection: any)` | 128 | ✍ Client initial sync: reads the storage's object id and data and completes its registration with g_client, if the placeable has a storage. |
| `PlaceableSiloExtension:onWriteStream(streamId: any, connection: any)` | 140 | ✍ Server initial sync: writes the storage's object id and data and registers it in the stream for this connection. |
| `PlaceableSiloExtension:getCanBePlacedAt(superFunc: any, x: any, y: any, z: any, farmId: any)` | 152 | ✍ Returns the parent's refusal if any; also false without a storage. Looks for extendable unloading and loading stations in range at the position for that farm and returns false with the near-silo warning if none is found, otherwise true. |
| `PlaceableSiloExtension:canBeSold(superFunc: any)` | 179 | ✍ Returns true; if the storage holds content, also returns a warning listing each fill type with an estimated value (lowest selling-point price times PRICE_SELL_FACTOR), and keeps the total for onSell. |
| `PlaceableSiloExtension:loadFromXMLFile(xmlFile: any, key: any)` | 228 | ✍ Forwards savegame loading to the storage, if any. |
| `PlaceableSiloExtension:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 238 | ✍ Forwards savegame saving to the storage, if any. |
| `PlaceableSiloExtension:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 247 | ✍ Calls the parent, then on the server gives the same owner farm to the storage. |
| `PlaceableSiloExtension:onSell()` | 259 | ✍ Server only: pays the farm the total stored-content value computed in canBeSold as HARVEST_INCOME. |
| `PlaceableSiloExtension.loadSpecValueVolume(xmlFile: any, customEnvironment: any, baseDir: any)` | 271 | ✍ Reads the storage capacity from the store item XML. |
| `PlaceableSiloExtension.getSpecValueVolume(storeItem: any, realItem: any)` | 277 | ✍ Returns the extension volume formatted for the shop, or nil if the store item has none. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `setOwnerFarmId` | 26 |
| registerOverwrittenFunction | `getCanBePlacedAt` | 27 |
| registerOverwrittenFunction | `canBeSold` | 28 |
| registerEventListener | `onLoad` | 34 |
| registerEventListener | `onDelete` | 35 |
| registerEventListener | `onFinalizePlacement` | 36 |
| registerEventListener | `onReadStream` | 37 |
| registerEventListener | `onWriteStream` | 38 |
| registerEventListener | `onSell` | 39 |
