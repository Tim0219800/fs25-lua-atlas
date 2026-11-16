# triggers/WoodUnloadTrigger.lua

*[Version française](../../fr/scripts/triggers/WoodUnloadTrigger.md)*

Source: `dataS/scripts/triggers/WoodUnloadTrigger.lua` — FS25 1.25.1.0

✍ Subclass of UnloadTrigger that sells or processes logs (split shapes) lying in a tree-collision trigger. The server computes volume and a quality-based price per log, adds it to the target and deletes the log. A second trigger lets the player start a manual sale, or autoUnload sells when a vehicle is inside; a trainSystemId can credit the rental farm of a train. Several helpers called here (getCanProcessWood, getTargetFillType, onProcessedWood, getNeedRaiseActive, updateActivatableObject) are not defined in the dump (UNVERIFIED).

- **WoodUnloadTrigger** inherits from `UnloadTrigger` (l.16)

## Functions

| Function | Line | Description |
|---|---|---|
| `WoodUnloadTrigger.registerXMLPaths(schema: any, basePath: any)` | 24 | ✍ Registers the parent UnloadTrigger XML paths plus triggerNode, activationTriggerNode, autoUnload (default false) and trainSystemId. |
| `WoodUnloadTrigger.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 38 | ✍ Creates the trigger on top of UnloadTrigger.new with empty tables of wood and vehicles in the trigger, split-shape stat placeholders, and extraAttributes initialised with price = 1. |
| `WoodUnloadTrigger:load(components: table, xmlFile: table, xmlNode: string, target: table, extraAttributes: table, i3dMappings: table) → boolean` | 61 | ✍ Calls the parent load, then requires a triggerNode whose collision mask includes the TREE bit (else returns false) and registers `woodTriggerCallback`. Optionally registers a player activation trigger (needs the PLAYER mask bit), reads autoUnload and trainSystemId, and creates the activatable. |
| `WoodUnloadTrigger:delete()` | 106 | ✍ Removes the wood trigger, and the activation trigger together with its activatable if present, then calls the parent delete. |
| `WoodUnloadTrigger:processWood(farmId: any, noEventSend: any)` | 124 | ✍ On a client it only sends WoodUnloadTriggerEvent to the server. On the server it sells each existing log in the trigger: computes volume and price, adds the fill level to the target (if free capacity exceeds 90 percent of the volume), calls onProcessedWood and deletes the log. Note: totalMass is never increased, so the woodTonsSold stat always receives 0. |
| `WoodUnloadTrigger:calculateWoodBaseValue(objectId: any)` | 199 | ✍ Reads volume, split type and split shape stats of a log node, then returns the result of calculateWoodBaseValueForData: liters, price per liter and longest side. |
| `WoodUnloadTrigger:calculateWoodBaseValueForData(volume: any, splitType: any, sizeX: any, sizeY: any, sizeZ: any, numConvexes: any, numAttachments: any)` | 209 | ✍ Computes volume times the split type's volumeToLiter, and a price per liter from the split type scaled by shape quality (bounding box vs volume, convex count), length and attachments count. The quality effect is blended by economic difficulty. Returns liters, price, longest side. |
| `WoodUnloadTrigger:update(dt: any)` | 247 | ✍ After the parent update, on the server picks the farm to credit: the train system's last rental farm, the vehicle owner in autoUnload mode, or the target owner. If that farm is not the spectator, it calls processWood. |
| `WoodUnloadTrigger:woodTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 292 | ✍ Physics callback. Split shapes with a positive price per liter are added on enter and removed on leave. In autoUnload mode, vehicles are counted in and out; entry raises the object active. |
| `WoodUnloadTrigger:getWoodLogs()` | 332 | ✍ Returns the table of logs currently in the trigger, keyed by node id. |
| `WoodUnloadTrigger:woodSellTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 338 | ✍ Physics callback of the activation trigger: when the local player's root node enters (and manual selling is active) the activatable is added, and removed on leave. |
