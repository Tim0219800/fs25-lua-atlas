# placeables/specializations/PlaceableBuyingStation.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableBuyingStation.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableBuyingStation.lua` — FS25 1.25.1.0

✍ Placeable specialization that wraps a `BuyingStation` (loaded from `placeable.buyingStation`) where players load purchased goods. It registers the station as a loading station in the storage system, syncs it to joining clients, and declares a store spec showing the fill types it sells.

- **PlaceableBuyingStation** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableBuyingStation.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true: no prerequisite specializations. |
| `PlaceableBuyingStation.registerFunctions(placeableType: any)` | 24 | ✍ Registers `getBuyingStation`. |
| `PlaceableBuyingStation.registerOverwrittenFunctions(placeableType: any)` | 30 | ✍ Overrides `collectPickObjects`. |
| `PlaceableBuyingStation.registerEventListeners(placeableType: any)` | 36 | ✍ Subscribes to `onLoad`, `onDelete`, `onFinalizePlacement`, `onReadStream` and `onWriteStream`. |
| `PlaceableBuyingStation.registerXMLPaths(schema: any, basePath: any)` | 46 | ✍ Declares the `buyingStation` XML keys by delegating to `BuyingStation.registerXMLPaths`. |
| `PlaceableBuyingStation.initSpecialization()` | 54 | ✍ Adds the store spec type `buyingStationFillTypes` (icon `shopListAttributeIconOutput`) for placeables, using the `BuyingStation` spec value loader and getter. |
| `PlaceableBuyingStation:onLoad(savegame: table)` | 61 | ✍ Creates and loads the `BuyingStation`; on success stores it, sets its owning placeable and registers it as a loading station. On failure logs an XML error and deletes it. |
| `PlaceableBuyingStation:onDelete()` | 78 | ✍ Unregisters the loading station from the storage system and deletes the `BuyingStation`, if loaded. |
| `PlaceableBuyingStation:onFinalizePlacement()` | 89 | ✍ Registers the `BuyingStation` network object, if loaded. |
| `PlaceableBuyingStation:onReadStream(streamId: any, connection: any)` | 99 | ✍ Client side join: reads the buying station object id and stream and finishes its registration. |
| `PlaceableBuyingStation:onWriteStream(streamId: integer, connection: table)` | 112 | ✍ Server side join: writes the buying station object id and stream and registers it in the connection's stream. |
| `PlaceableBuyingStation:collectPickObjects(superFunc: any, node: any)` | 123 | ✍ Skips picking nodes that are one of the buying station's load trigger nodes; other nodes go to the parent implementation. |
| `PlaceableBuyingStation:getBuyingStation()` | 138 | ✍ Returns the `BuyingStation` object (nil if it failed to load). |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getBuyingStation` | 25 |
| registerOverwrittenFunction | `collectPickObjects` | 31 |
| registerEventListener | `onLoad` | 37 |
| registerEventListener | `onDelete` | 38 |
| registerEventListener | `onFinalizePlacement` | 39 |
| registerEventListener | `onReadStream` | 40 |
| registerEventListener | `onWriteStream` | 41 |
