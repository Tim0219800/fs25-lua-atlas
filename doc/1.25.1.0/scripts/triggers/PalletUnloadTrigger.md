# triggers/PalletUnloadTrigger.lua

*[Version française](../../fr/scripts/triggers/PalletUnloadTrigger.md)*

Source: `dataS/scripts/triggers/PalletUnloadTrigger.lua` — FS25 1.25.1.0

✍ Subclass of UnloadTrigger that detects pallets (objects with isPallet) entering a vehicle-collision trigger and either unloads them automatically on the server or lets the player trigger the unload. It tracks pallets carrying a supported fill type and, when autoUnload is off, nearby vehicles and the player. The dump has a gap where methods such as unloadPallets and updateActivatableObject would be, so their code is not visible here (UNVERIFIED).

- **PalletUnloadTrigger** inherits from `UnloadTrigger` (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `PalletUnloadTrigger.registerXMLPaths(schema: any, basePath: any)` | 23 | ✍ Registers the parent UnloadTrigger XML paths plus triggerNode, autoUnload (default true) and autoUnloadStrapped (default false). |
| `PalletUnloadTrigger.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 36 | ✍ Creates the trigger on top of UnloadTrigger.new with its activatable, empty pallet and vehicle tables, enabled, autoUnload on and autoUnloadStrapped off. |
| `PalletUnloadTrigger:load(components: table, xmlFile: table, xmlNode: string, target: table, extraAttributes: table, i3dMappings: table) → boolean` | 61 | ✍ Calls the parent load, then reads triggerNode and returns false if it is missing or if its collision mask lacks the VEHICLE bit (logged as an XML error). Registers the physics callback `palletTriggerCallback` and reads autoUnload and autoUnloadStrapped. |
| `PalletUnloadTrigger:delete()` | 90 | ✍ Removes the physics trigger, drops the delete listeners on tracked pallets, clears the pallet and vehicle tables, then calls the parent delete. |
| `PalletUnloadTrigger:palletTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 205 | ✍ Physics callback. A pallet with a non-empty fill unit of a supported type is added on enter (removed on leave); with autoUnload the server then calls unloadPallets. Without autoUnload it counts vehicles in range and tracks the local player, then refreshes the activatable. |
