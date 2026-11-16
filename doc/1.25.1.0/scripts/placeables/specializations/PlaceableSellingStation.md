# placeables/specializations/PlaceableSellingStation.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableSellingStation.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableSellingStation.lua` — FS25 1.25.1.0

✍ Placeable specialization with no prerequisites that wraps a SellingStation (a place where players sell fill types, e.g. a market or processor). It creates the station from placeable.sellingStation, registers it with g_currentMission.storageSystem and economyManager when placed, streams it to clients and forwards savegame load/save. The SellingStation class itself is not in this file.

- **PlaceableSellingStation** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableSellingStation.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true. |
| `PlaceableSellingStation.registerFunctions(placeableType: any)` | 24 | ✍ Registers getSellingStation on the placeable type. |
| `PlaceableSellingStation.registerOverwrittenFunctions(placeableType: any)` | 30 | ✍ Overrides collectPickObjects. |
| `PlaceableSellingStation.registerEventListeners(placeableType: any)` | 36 | ✍ Subscribes to onLoad, onDelete, onFinalizePlacement, onReadStream and onWriteStream. |
| `PlaceableSellingStation.registerXMLPaths(schema: any, basePath: any)` | 46 | ✍ Declares the XML schema by delegating to SellingStation.registerXMLPaths under placeable.sellingStation. |
| `PlaceableSellingStation.registerSavegameXMLPaths(schema: any, basePath: any)` | 54 | ✍ Declares savegame XML paths via SellingStation.registerSavegameXMLPaths. |
| `PlaceableSellingStation.initSpecialization()` | 62 | ✍ Adds the shop spec type sellingStationFillTypes (input icon) for placeables, using SellingStation's load and get functions. |
| `PlaceableSellingStation:onLoad(savegame: table)` | 69 | ✍ Creates the SellingStation and loads it from placeable.sellingStation, linking it to the first component node; the placeable is stored as owningPlaceable. The return value of load is ignored. |
| `PlaceableSellingStation:onDelete()` | 80 | ✍ Removes the station from the storage system and the economy manager, then deletes it. |
| `PlaceableSellingStation:onFinalizePlacement()` | 91 | ✍ Registers the station as a network object and adds it to the storage system (as unloading station) and the economy manager. |
| `PlaceableSellingStation:onReadStream(streamId: any, connection: any)` | 100 | ✍ Client initial sync: reads the station's object id and data, then completes its registration with g_client. |
| `PlaceableSellingStation:onWriteStream(streamId: any, connection: any)` | 110 | ✍ Server initial sync: writes the station's object id and data and registers it in the stream for this connection. |
| `PlaceableSellingStation:getSellingStation()` | 120 | ✍ Returns the SellingStation object of this placeable. |
| `PlaceableSellingStation:collectPickObjects(superFunc: any, node: any)` | 126 | ✍ Skips the node when it is an unload trigger's exact fill root node; otherwise defers to the parent implementation. |
| `PlaceableSellingStation:loadFromXMLFile(xmlFile: any, key: any)` | 144 | ✍ Forwards savegame loading to the selling station. |
| `PlaceableSellingStation:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 151 | ✍ Forwards savegame saving to the selling station. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getSellingStation` | 25 |
| registerOverwrittenFunction | `collectPickObjects` | 31 |
| registerEventListener | `onLoad` | 37 |
| registerEventListener | `onDelete` | 38 |
| registerEventListener | `onFinalizePlacement` | 39 |
| registerEventListener | `onReadStream` | 40 |
| registerEventListener | `onWriteStream` | 41 |
