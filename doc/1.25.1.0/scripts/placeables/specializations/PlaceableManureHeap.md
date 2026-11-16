# placeables/specializations/PlaceableManureHeap.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableManureHeap.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableManureHeap.lua` — FS25 1.25.1.0

✍ Placeable specialization for a manure heap: it creates a LoadingStation and a ManureHeap storage object, registers them with the mission storage system, and optionally requires placement near a barn. Handles network streaming, savegame delegation to the ManureHeap object, shop capacity spec and info HUD fill level. ManureHeap, LoadingStation and the storage system are used but their code is not part of this file.

- **PlaceableManureHeap** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableManureHeap.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true: no prerequisite specialization is required. |
| `PlaceableManureHeap.registerOverwrittenFunctions(placeableType: any)` | 24 | ✍ Overrides setOwnerFarmId, collectPickObjects, getCanBePlacedAt and updateInfo on the placeable type. |
| `PlaceableManureHeap.registerEventListeners(placeableType: any)` | 33 | ✍ Subscribes to onLoad, onDelete, onFinalizePlacement, onReadStream and onWriteStream. |
| `PlaceableManureHeap.registerXMLPaths(schema: any, basePath: any)` | 43 | ✍ Declares the manureHeap XML keys: those of ManureHeap, the needsBarn flag (schema default true) and the nested loadingStation keys. |
| `PlaceableManureHeap.registerSavegameXMLPaths(schema: any, basePath: any)` | 53 | ✍ Registers the savegame XML keys by delegating to ManureHeap.registerSavegameXMLPaths. |
| `PlaceableManureHeap.initSpecialization()` | 61 | ✍ Registers the shop spec type manureHeapCapacity (capacity icon, placeable species) with its load and display callbacks. |
| `PlaceableManureHeap:onLoad(savegame: table)` | 68 | ✍ Creates and loads the loading station, then the ManureHeap, and reads needsBarn from the XML. Returns false (and frees the station) if the loading station fails to load. Note: it passes spec.isServer to ManureHeap.new, a field not set in this file, and needsBarn defaults to false here while the schema default is true. |
| `PlaceableManureHeap:onDelete()` | 96 | ✍ Removes the heap from the storage system and from its loading/unloading stations, deletes it, then unregisters and deletes the loading station (including from the manure loading station list when manure is supported). |
| `PlaceableManureHeap:onFinalizePlacement()` | 125 | ✍ Registers the loading station and heap as network objects, adds them to the storage system with the owner farm, and links the heap and nearby storage extensions to extendable loading and unloading stations in range. |
| `PlaceableManureHeap:onReadStream(streamId: any, connection: any)` | 160 | ✍ Client side on join: reads the object ids and stream data of the loading station and the heap, then finishes their client registration. |
| `PlaceableManureHeap:onWriteStream(streamId: any, connection: any)` | 176 | ✍ Server side on join: writes the object ids and stream data of the loading station and the heap and registers both objects in the connection stream. |
| `PlaceableManureHeap:loadFromXMLFile(xmlFile: any, key: any)` | 192 | ✍ Savegame loading: forwards to the ManureHeap object if it exists. |
| `PlaceableManureHeap:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 201 | ✍ Savegame saving: forwards to the ManureHeap object if it exists. |
| `PlaceableManureHeap:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 210 | ✍ Override: calls the parent, then on the server sets the heap's owner and re-links storage extensions and extendable loading/unloading stations in range for the new farm. |
| `PlaceableManureHeap:collectPickObjects(superFunc: any, node: any)` | 241 | ✍ Override: skips the loading-station load trigger nodes and the heap's activation trigger so they are not added as pickable objects; other nodes go to the parent. |
| `PlaceableManureHeap:getCanBePlacedAt(superFunc: any, x: any, y: any, z: any, farmId: any)` | 263 | ✍ Override: refuses placement if there is no heap, or if needsBarn is set and no extendable unloading station of the farm is in range (returns false plus a warning text); otherwise defers to the parent. |
| `PlaceableManureHeap:updateInfo(superFunc: any, infoTable: any)` | 284 | ✍ Override: after the parent, appends a line to the info table showing the manure heap fill level in liters. |
| `PlaceableManureHeap.loadSpecValueCapacity(xmlFile: any, customEnvironment: any, baseDir: any)` | 300 | ✍ Reads the manureHeap capacity value from the placeable XML for the shop spec. |
| `PlaceableManureHeap.getSpecValueCapacity(storeItem: any, realItem: any)` | 306 | ✍ Returns the capacity formatted as a volume string for the shop, or nil if the store item has none. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `setOwnerFarmId` | 25 |
| registerOverwrittenFunction | `collectPickObjects` | 26 |
| registerOverwrittenFunction | `getCanBePlacedAt` | 27 |
| registerOverwrittenFunction | `updateInfo` | 28 |
| registerEventListener | `onLoad` | 34 |
| registerEventListener | `onDelete` | 35 |
| registerEventListener | `onFinalizePlacement` | 36 |
| registerEventListener | `onReadStream` | 37 |
| registerEventListener | `onWriteStream` | 38 |
