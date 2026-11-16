# placement/PalletSpawner.lua

*[Version française](../../fr/scripts/placement/PalletSpawner.md)*

Source: `dataS/scripts/placement/PalletSpawner.lua` — FS25 1.25.1.0

✍ Helper owned by a production point, shop or similar placeable that spawns pallet vehicles on defined spawn places. It loads spawn places and pallet definitions from XML, maps fill types to pallet files, queues spawn requests and processes them one at a time via the PlacementManager and VehicleLoadingData. Spawning runs on the authority (server); result codes such as PALLET_LIMITED_REACHED and RESULT_SUCCESS are defined outside this file (UNVERIFIED).

- **PalletSpawner** (l.19)

## Functions

| Function | Line | Description |
|---|---|---|
| `PalletSpawner.new(baseDirectory: any, customMt: any)` | 23 | ✍ Creates a spawner with an empty queue and the mod/base directory used to resolve pallet paths. Sets a vertical spawn offset of 0.2 when the platform has dynamic pallets, otherwise 0. |
| `PalletSpawner:load(components: table, xmlFile: table, key: string, customEnv: string, i3dMappings: table) → boolean` | 42 | ✍ Reads `spawnPlaces.spawnPlace` entries (optionally restricted by `#fillTypes` or `#fillTypeCategories`, not both) and the pallets: first every fill type's default pallet file, then `pallets.pallet#filename` entries, which override. Returns false with an XML error if no spawn place exists. |
| `PalletSpawner:delete()` | 98 | ✍ Empty cleanup hook; nothing is released here. |
| `PalletSpawner:loadPalletFromFilename(palletFilename: any, limitFillTypeId: any)` | 103 | ✍ Loads a pallet vehicle XML, reads its size, capacity and supported fill types, and registers it for those fill types (or only `limitFillTypeId`). Returns the pallet table, or nil if the file fails to load or no fill type matches. |
| `PalletSpawner:getSupportedFillTypes()` | 140 | ✍ Returns the table mapping fill type ids to their pallet definitions. |
| `PalletSpawner:spawnPallet(farmId: integer, fillTypeId: integer, callback: function, callbackTarget: table)` | 149 | ✍ Queues a pallet for the farm and fill type and registers the spawner as updateable. Calls the callback immediately with an error code if the pallet slot limit is reached or no pallet exists for the fill type. |
| `PalletSpawner:getOrSpawnPallet(farmId: integer, fillTypeId: integer, callback: function, callbackTarget: table)` | 170 | ✍ Looks for an existing non-full pallet of the fill type on the spawn places (physics overlap test) and reports it with PALLET_ALREADY_PRESENT; otherwise falls back to spawnPallet. Result goes through the callback. |
| `PalletSpawner:getAllPallets(fillTypeId: integer, callbackFunc: function, callbackTarget: table)` | 196 | ✍ Overlap-tests the spawn places for pallets currently holding the given fill type and passes them as a list, with the fill type id, to the callback synchronously. |
| `PalletSpawner:update(dt: any)` | 214 | ✍ Per-frame step: when idle, takes the first queued request and asks the placement manager asynchronously for a free place. Removes the spawner from the updateables once the queue is empty. |
| `PalletSpawner:onSpawnSearchFinished(location: any)` | 233 | ✍ Placement callback. If a place was found, clamps its Y to at least terrain height plus the offset and loads the pallet as an owned vehicle (spawnEmpty parameter). If not, reports RESULT_NO_SPACE and pops the request. |
| `PalletSpawner:onFinishLoadingPallet(vehicles: any, vehicleLoadState: any)` | 261 | ✍ Vehicle-load callback: reports the first loaded vehicle with success, or an error code if the load state is not OK, then pops the current request so the next one can start. |
| `PalletSpawner:onFindExistingPallet(node: any)` | 271 | ✍ Overlap callback: accepts a pallet vehicle that supports the wanted fill type and still has free capacity in unit 1, stores it and returns false to stop further reports. |
| `PalletSpawner:onFindPallet(node: any)` | 285 | ✍ Overlap callback: collects pallet vehicles whose pallet fill unit currently holds the wanted fill type into a set keyed by the vehicle. |
| `PalletSpawner.registerXMLPaths(schema: any, basePath: any)` | 297 | ✍ Registers `spawnPlaces.spawnPlace(?)#fillTypes` and `#fillTypeCategories`, the PlacementUtil place keys, and `pallets.pallet(?)#filename` under the base path. |
