# animals/husbandry/placeables/PlaceableHusbandryPallets.lua

*[Version française](../../../../fr/scripts/animals/husbandry/placeables/PlaceableHusbandryPallets.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryPallets.lua` — FS25 1.25.1.0

✍ Placeable specialization for husbandries that output goods on pallets (for example wool or eggs). It requires `PlaceableHusbandryAnimals`. Animals produce liters per hour, accumulated as pending liters, and the server spawns or reuses pallets through a `PalletSpawner` and fills them. It synchronizes fill levels and capacities to clients, saves the pending liters, and reads `placeable.husbandry.pallets.palletSpawner`.

- **PlaceableHusbandryPallets** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableHusbandryPallets.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Returns true only if the placeable type has the `PlaceableHusbandryAnimals` specialization. |
| `PlaceableHusbandryPallets.registerFunctions(placeableType: any)` | 24 | ✍ Registers new placeable functions: pallet trigger callback, pallet queries and spawning (`updatePallets`, `addPendingLiters`, `getPalletCallback`), warning display and `updatePalletInfo`. |
| `PlaceableHusbandryPallets.registerOverwrittenFunctions(placeableType: any)` | 37 | ✍ Registers overrides of `getConditionInfos`, `updateOutput` and `updateInfo`. |
| `PlaceableHusbandryPallets.registerEventListeners(placeableType: any)` | 45 | ✍ Subscribes to onLoad, onDelete, onFinalizePlacement, the four stream events (read/write initial and update) and onHusbandryAnimalsUpdate. |
| `PlaceableHusbandryPallets.registerXMLPaths(schema: any, basePath: any)` | 58 | ✍ Declares the repeatable `husbandry.pallets.palletSpawner` XML: `palletTrigger#node`, fill types, `#unitText`, `#maxNumPallets` and the `PalletSpawner` paths. Note: `#unitText` is registered but `onLoad` here does not read it. |
| `PlaceableHusbandryPallets.registerSavegameXMLPaths(schema: any, basePath: any)` | 71 | ✍ Declares the savegame paths `pendingLiters(?)#fillType` and `#liters` used to persist pending output. |
| `PlaceableHusbandryPallets:onLoad(savegame: any)` | 80 | ✍ Builds per-fill-type tables, creates one `PalletSpawner` per XML spawner (warns on duplicate fill types), and on the server collects pallet triggers that have the VEHICLE collision bit. Also sets a dirty flag and warns if an animal subtype outputs a pallet fill type the husbandry does not support. |
| `PlaceableHusbandryPallets:onDelete()` | 176 | ✍ Deletes every pallet spawner and removes the pallet triggers that were added. |
| `PlaceableHusbandryPallets:onFinalizePlacement()` | 196 | ✍ Registers the pallet triggers with `addTrigger` and the callback `onPalletTriggerCallback`, marking them as added. |
| `PlaceableHusbandryPallets:onReadStream(streamId: any, connection: any)` | 213 | ✍ Client: reads, per fill type, the fill level and capacity (float32) and the pallet-limit-reached flag from the initial stream. |
| `PlaceableHusbandryPallets:onWriteStream(streamId: any, connection: any)` | 225 | ✍ Server: writes the last sent fill levels and capacities per fill type, then the pallet-limit-reached flag. |
| `PlaceableHusbandryPallets:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 238 | ✍ Client: if the server's dirty bit is set, reads the same data as the initial stream (levels, capacities, limit flag). |
| `PlaceableHusbandryPallets:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 254 | ✍ Server: when the placeable dirty flag is set in the mask, writes levels, capacities and the limit flag to the client. |
| `PlaceableHusbandryPallets:loadFromXMLFile(xmlFile: any, key: any)` | 270 | ✍ Loads the saved pending liters per fill type, then refreshes the pallet info. |
| `PlaceableHusbandryPallets:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 285 | ✍ Saves each fill type that still has pending liters above 0 under `pendingLiters(i)`. |
| `PlaceableHusbandryPallets:onHusbandryAnimalsUpdate(clusters: any)` | 300 | ✍ Resets liters per hour and recomputes them from the animal clusters (output curve at age times animal count divided by 24), and lists the fill types currently produced. |
| `PlaceableHusbandryPallets:onPalletTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 328 | ✍ Trigger callback; only handles leave events: forgets the leaving pallet object (current and tracked pallets) and refreshes pallet info. |
| `PlaceableHusbandryPallets:updatePalletInfo()` | 347 | ✍ Server only, and only if no query is running: resets pending sums and asks each pallet spawner for all its pallets, with `getAllPalletsCallback` as the answer. |
| `PlaceableHusbandryPallets:getAllPalletsCallback(pallets: any, fillTypeIndex: any)` | 367 | ✍ Adds each pallet's capacity and fill level to pending totals; when all queries are done, publishes fill levels and capacities (using max pallets times the largest capacity if there is room for more pallets) and raises the dirty flag when a value moved by more than 1. |
| `PlaceableHusbandryPallets:updatePallets()` | 400 | ✍ Server only: if no spawn is pending, asks the pallet spawner for a pallet (existing or new) for each fill type having more than 5 pending liters. |
| `PlaceableHusbandryPallets:addPendingLiters(fillTypeIndex: integer, liters: number) → number` | 420 | ✍ Server only: adds positive liters to the pending amount of a supported fill type and triggers pallet spawning. Returns the liters added, or 0 if client, non-positive amount or unsupported fill type. |
| `PlaceableHusbandryPallets:getPalletCallback(pallet: any, result: any, fillTypeIndex: any)` | 442 | ✍ Spawner answer: stores the pallet, clears the limit flag, empties a newly spawned pallet and fills it with pending liters, retriggering if over 5 remain. On no space it shows a blocked warning; on the pallet limit it sets the limit flag. Finally refreshes pallet info. |
| `PlaceableHusbandryPallets:showSpawnerBlockedWarning(fillTypeIndex: any)` | 482 | ✍ Once per output cycle, on the server broadcasts `AnimalHusbandryNoMorePalletSpaceEvent` to the owner farm and shows the local warning. |
| `PlaceableHusbandryPallets:showPalletBlockedWarning(fillTypeIndex: any)` | 497 | ✍ Client, only for the owner farm: shows a critical in-game notification that the pallet spawner of this husbandry is blocked for the fill type. |
| `PlaceableHusbandryPallets:updateInfo(superFunc: any, infoTable: any)` | 509 | ✍ Override. After the parent, adds a highlighted too-many-pallets entry to the info table when the pallet limit is reached. |
| `PlaceableHusbandryPallets:getConditionInfos(superFunc: any)` | 520 | ✍ Override. For each currently produced fill type, appends an inverted condition bar with fill level and capacity ratio. Note: it uses `spec.fillTypeUnit`, which this file never sets (UNVERIFIED). |
| `PlaceableHusbandryPallets:updateOutput(superFunc: any, foodFactor: any, productionFactor: any, globalProductionFactor: any)` | 551 | ✍ Override. Calls the parent, clears the warning flag and, on the server, adds liters per hour times production factors times `timeAdjustment` to pending liters, then spawns pallets if needed. |

## Specialization

| Type | Name | Line |
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
