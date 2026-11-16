# placeables/specializations/PlaceableWardrobe.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableWardrobe.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableWardrobe.lua` — FS25 1.25.1.0

✍ Placeable specialization for a wardrobe where players change their character. A player trigger adds a WardrobeActivatable for the local player when the wardrobe is free for all or belongs to the player farm. The free-for-all flag is saved and sent to joining clients.

- **PlaceableWardrobe** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableWardrobe.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Always returns true: no prerequisite specialization. |
| `PlaceableWardrobe.registerFunctions(placeableType: any)` | 25 | ✍ Registers `wardrobeTriggerCallback` on the placeable type. |
| `PlaceableWardrobe.registerEventListeners(placeableType: any)` | 31 | ✍ Subscribes to onLoad, onDelete, onReadStream and onWriteStream (savegame load/save are handled by the standard placeable hooks, UNVERIFIED). |
| `PlaceableWardrobe.registerXMLPaths(schema: any, basePath: any)` | 40 | ✍ Declares the wardrobe XML keys (trigger node and `#isFreeForAll`). |
| `PlaceableWardrobe.registerSavegameXMLPaths(schema: any, basePath: any)` | 49 | ✍ Declares the savegame attribute `#isFreeForAll`. |
| `PlaceableWardrobe:onLoad(savegame: table)` | 58 | ✍ Creates the activatable, reads `placeable.wardrobe#triggerNode` (warning if it lacks the player collision bit) and registers the trigger, then reads `#isFreeForAll` (default false). |
| `PlaceableWardrobe:loadFromXMLFile(xmlFile: any, key: any)` | 77 | ✍ Restores `#isFreeForAll` from the savegame when present. |
| `PlaceableWardrobe:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 87 | ✍ Writes `#isFreeForAll` to the savegame. |
| `PlaceableWardrobe:onDelete()` | 93 | ✍ Removes the activatable from the activatable system and removes the trigger. |
| `PlaceableWardrobe:onReadStream(streamId: integer, connection: Connection)` | 108 | ✍ Client side on join: reads the free-for-all boolean. |
| `PlaceableWardrobe:onWriteStream(streamId: integer, connection: Connection)` | 117 | ✍ Server side on join: writes the free-for-all boolean. |
| `PlaceableWardrobe:wardrobeTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 124 | ✍ Trigger callback: when the local player enters or leaves, and the wardrobe is free for all or owned by the player farm, adds or removes the activatable. Other actors are ignored. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `wardrobeTriggerCallback` | 26 |
| registerEventListener | `onLoad` | 32 |
| registerEventListener | `onDelete` | 33 |
| registerEventListener | `onReadStream` | 34 |
| registerEventListener | `onWriteStream` | 35 |
