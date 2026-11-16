# triggers/BaleUnloadTrigger.lua

*[Version française](../../fr/scripts/triggers/BaleUnloadTrigger.md)*

Source: `dataS/scripts/triggers/BaleUnloadTrigger.lua` — FS25 1.25.1.0

✍ Unload trigger subclass (parent UnloadTrigger) that accepts bales. Bales entering its trigger node are tracked on the server and drained gradually into the trigger's fill unit at a configurable liters-per-second rate until empty, then deleted. It also registers itself with BaleLoader vehicles entering the trigger so they can unload bales automatically. UnloadTrigger itself is not in this file (UNVERIFIED details).

- **BaleUnloadTrigger** inherits from `UnloadTrigger` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `BaleUnloadTrigger.registerXMLPaths(schema: any, basePath: any)` | 22 | ✍ Registers the parent's XML paths plus #triggerNode, #deleteLitersPerSecond (default 4000) and the fill type config keys from FillTypeManager.registerConfigXMLFilltypes. |
| `BaleUnloadTrigger.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 35 | ✍ Constructor. Builds the parent UnloadTrigger with this class's metatable and initialises the trigger node and an empty list of bales currently inside. |
| `BaleUnloadTrigger:load(components: table, xmlFile: table, xmlNode: string, target: table, extraAttributes: table, i3dMappings: table) → boolean` | 52 | ✍ Loads the parent, then the trigger node, which must have the dynamic object collision flag (and the vehicle flag when automatic bale drop is enabled on the platform), else it logs an XML error and returns false. On the server it registers the trigger callback; reads the delete rate. Returns true on success. |
| `BaleUnloadTrigger:delete()` | 86 | ✍ Server only: removes the trigger registration, clears the trigger node and bale list, then calls the parent delete. |
| `BaleUnloadTrigger:update(dt: number)` | 116 | ✍ Server only. For each tracked bale that can be sold and is not mounted, moves up to the rate times dt of its content into the trigger's fill unit and lowers the bale level. When almost empty, updates cotton bale stats and the achievement, deletes the bale and removes it from the list. Stays active while bales remain; invalid bales are dropped. |
| `BaleUnloadTrigger:baleTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 172 | ✍ Trigger callback (enabled triggers only). A Bale entering is added to the tracked list if the unload trigger supports it, and removed when it leaves. A Vehicle with the BaleLoader specialization is registered or unregistered through addBaleUnloadTrigger and removeBaleUnloadTrigger on enter and leave. |
