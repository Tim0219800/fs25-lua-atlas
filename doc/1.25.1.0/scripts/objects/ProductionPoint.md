# objects/ProductionPoint.lua

*[Version française](../../fr/scripts/objects/ProductionPoint.md)*

Source: `dataS/scripts/objects/ProductionPoint.lua` — FS25 1.25.1.0

✍ Network object (extends Object) for a placeable production point: a set of productions that turn input fill types into output fill types, backed by a storage, an unloading (selling) station, an optional loading station and pallet spawner. In this dump only part of the class has bodies: XML schema registration (including savegame keys), join-time stream sync, loading of the saved state, store spec values, the player interaction trigger, opening the production menu and the purchase request. The production cycle logic, output distribution (setOutputDistributionMode, setProductionState, setProductionStatus) and constants such as OUTPUT_MODE are not in the dump and are UNVERIFIED.

- **ProductionPoint** inherits from `Object` (l.45)

## Functions

| Function | Line | Description |
|---|---|---|
| `ProductionPoint.registerXMLPaths(schema: any, basePath: any)` | 49 | ✍ Registers the XML schema of a production point: name, shared throughput flag, each production (id, name, cycles per month/hour/minute, costs while active, inputs and outputs with fillType and amount, sellDirectly, isPrimary), player trigger node, sounds, animation nodes, effect nodes and the sub-sections for selling station, loading station, pallet spawner and storage. |
| `ProductionPoint.registerSavegameXMLPaths(schema: any, basePath: any)` | 88 | ✍ Registers the savegame XML keys: pallet spawn cooldown, production costs still to claim, directSellFillType and autoDeliverFillType lists, per-production id and isEnabled, and the storage's savegame paths. |
| `ProductionPoint:readStream(streamId: integer, connection: table)` | 531 | ✍ Client join: after the parent readStream, reads the direct-sell and auto-deliver fill types, then the object ids and state of the unloading station, the optional loading station and the storage (finishing their registration), the active productions with status, and the pallet limit flag. |
| `ProductionPoint:writeStream(streamId: integer, connection: table)` | 591 | ✍ Server join: writes the same data read by readStream, in the same order, and registers the stations and the storage in the stream for the connecting client. |
| `ProductionPoint:readUpdateStream(streamId: any, timestamp: any, connection: any)` | 638 | ✍ Client update: reads the palletLimitReached boolean sent by the server. |
| `ProductionPoint:writeUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 646 | ✍ Server update: writes the palletLimitReached boolean. |
| `ProductionPoint:loadFromXMLFile(xmlFile: XMLFile, key: string) → boolean` | 987 | ✍ Restores the saved state: pallet spawn cooldown, unclaimed costs, enabled state of each production (all enabled if the placeable is unowned), direct-sell and auto-deliver fill types, then the storage. Returns false if the storage fails to load; unknown production ids give a warning. |
| `ProductionPoint.loadSpecValueInputFillTypes(xmlFile: any, customEnvironment: any, baseDir: any)` | 1260 | ✍ Store spec loader: collects the set of input fill type names from all productions in the placeable XML, including the first production point configuration. Returns a name set, or nil if there are none. |
| `ProductionPoint.getSpecValueInputFillTypes(storeItem: any, realItem: any)` | 1283 | ✍ Converts the stored input fill type names of a store item into fill type data through the fill type manager; nil if none. |
| `ProductionPoint.loadSpecValueOutputFillTypes(xmlFile: any, customEnvironment: any, baseDir: any)` | 1293 | ✍ Store spec loader like the input one, but collecting the output fill type names of all productions and of the first configuration. |
| `ProductionPoint.getSpecValueOutputFillTypes(storeItem: any, realItem: any)` | 1316 | ✍ Converts the stored output fill type names of a store item into fill type data; nil if none. |
| `ProductionPoint:interactionTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 1326 | ✍ Trigger callback for the local player entering or leaving the interaction zone. On enter it either runs the activatable at once (platforms with auto-activate) or refreshes its text and registers it; on leave it removes it. |
| `ProductionPoint:openMenu()` | 1350 | ✍ Opens the in-game menu and publishes GUI_INGAME_OPEN_PRODUCTION_SCREEN with this production point so the production page shows it. |
| `ProductionPoint:buyRequest(requestCallback: any, target: any)` | 1357 | ✍ Starts a purchase of an unowned production point: refuses during a guided tour, computes the price (plus farmland price when the placeable buys land the farm does not own) and shows a yes/no dialog; on yes sends a BuyExistingPlaceableEvent and shows the result. Note: it subscribes a callback without target but unsubscribes with the production point as target, which may not remove it (UNVERIFIED). |

## Messages

- publishes `MessageType.GUI_INGAME_OPEN_PRODUCTION_SCREEN` (l.1352)
