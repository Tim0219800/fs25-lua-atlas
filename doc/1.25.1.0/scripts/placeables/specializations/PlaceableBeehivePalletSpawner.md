# placeables/specializations/PlaceableBeehivePalletSpawner.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableBeehivePalletSpawner.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableBeehivePalletSpawner.lua` — FS25 1.25.1.0

✍ Placeable specialization for the farm's honey pallet location. It wraps a `PalletSpawner`, accumulates honey liters on the server and spawns or refills a HONEY pallet once enough is pending, and syncs a 'too many pallets' flag to clients. It registers itself with `beehiveSystem`, and only one may be bought per farm.

- **PlaceableBeehivePalletSpawner** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableBeehivePalletSpawner.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Always returns true: no prerequisite specializations. |
| `PlaceableBeehivePalletSpawner.registerFunctions(placeableType: any)` | 23 | ✍ Registers `addFillLevel`, `updatePallets` and `getPalletCallback` on the placeable type. |
| `PlaceableBeehivePalletSpawner.registerOverwrittenFunctions(placeableType: any)` | 31 | ✍ Overrides `canBuy` and `updateInfo`. |
| `PlaceableBeehivePalletSpawner.registerEventListeners(placeableType: any)` | 38 | ✍ Subscribes to `onLoad`, `onDelete`, `onFinalizePlacement` and the four network stream events (read/write stream and update stream). |
| `PlaceableBeehivePalletSpawner.registerXMLPaths(schema: any, basePath: any)` | 50 | ✍ Declares the pallet spawner XML keys under `beehivePalletSpawner` by delegating to `PalletSpawner.registerXMLPaths`. |
| `PlaceableBeehivePalletSpawner.registerSavegameXMLPaths(schema: any, basePath: any)` | 58 | ✍ Declares the savegame key `beehivePalletSpawner#pendingLiters`. |
| `PlaceableBeehivePalletSpawner:onLoad(savegame: table)` | 65 | ✍ Creates and loads the `PalletSpawner`; on failure logs an XML error and sets the loading state to ERROR. Also initializes pending liters, flags, the HONEY fill type and a dirty flag. |
| `PlaceableBeehivePalletSpawner:onDelete()` | 88 | ✍ Deletes the pallet spawner (if loaded) and unregisters this spawner from `beehiveSystem`. |
| `PlaceableBeehivePalletSpawner:onFinalizePlacement()` | 98 | ✍ Registers this pallet spawner with `beehiveSystem`. |
| `PlaceableBeehivePalletSpawner:onReadStream(streamId: any, connection: any)` | 104 | ✍ Client side: reads the pallet limit flag from the initial join stream. |
| `PlaceableBeehivePalletSpawner:onWriteStream(streamId: any, connection: any)` | 113 | ✍ Server side: writes the pallet limit flag to the initial join stream. |
| `PlaceableBeehivePalletSpawner:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 123 | ✍ Client side: reads the pallet limit flag from an update stream. The flag is read unconditionally, without a dirty mask check. |
| `PlaceableBeehivePalletSpawner:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 132 | ✍ Server side: writes the pallet limit flag to an update stream, without testing the dirty mask. |
| `PlaceableBeehivePalletSpawner:loadFromXMLFile(xmlFile: any, key: any)` | 142 | ✍ Restores the pending honey liters from the savegame, keeping the current value if absent. |
| `PlaceableBeehivePalletSpawner:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 150 | ✍ Saves the pending liters to the savegame, only when greater than zero. |
| `PlaceableBeehivePalletSpawner:addFillLevel(fillLevel: any)` | 161 | ✍ Server only: adds the given liters to the pending honey amount; ignored when nil. |
| `PlaceableBeehivePalletSpawner:updatePallets()` | 173 | ✍ Server only: when more than 10 liters are pending and no spawn is in progress, asks the pallet spawner for a pallet, with `getPalletCallback` as callback. |
| `PlaceableBeehivePalletSpawner:getPalletCallback(pallet: any, result: any, fillTypeIndex: any)` | 186 | ✍ Spawn result handler: for a new pallet it empties it, then fills it with the pending liters and subtracts what fit. On a pallet limit it sets the synced limit flag; on no space nothing happens (a TODO in code). |
| `PlaceableBeehivePalletSpawner:updateInfo(superFunc: any, infoTable: any)` | 215 | ✍ Calls the parent `updateInfo`, then adds a 'too many pallets' line when the pallet limit flag is set. |
| `PlaceableBeehivePalletSpawner:canBuy(superFunc: any)` | 225 | ✍ Extends the parent check: refuses the purchase with a one-per-farm warning if the local farm already has a beehive pallet spawner. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `addFillLevel` | 24 |
| registerFunction | `updatePallets` | 25 |
| registerFunction | `getPalletCallback` | 26 |
| registerOverwrittenFunction | `canBuy` | 32 |
| registerOverwrittenFunction | `updateInfo` | 33 |
| registerEventListener | `onLoad` | 39 |
| registerEventListener | `onDelete` | 40 |
| registerEventListener | `onFinalizePlacement` | 41 |
| registerEventListener | `onReadStream` | 42 |
| registerEventListener | `onWriteStream` | 43 |
| registerEventListener | `onReadUpdateStream` | 44 |
| registerEventListener | `onWriteUpdateStream` | 45 |
