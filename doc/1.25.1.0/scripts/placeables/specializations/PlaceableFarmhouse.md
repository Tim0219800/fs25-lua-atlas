# placeables/specializations/PlaceableFarmhouse.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableFarmhouse.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableFarmhouse.lua` — FS25 1.25.1.0

✍ Placeable specialization that turns a building into a farmhouse: it provides the player spawn node and an optional sleeping trigger with its camera, and lets players sleep there through a FarmhouseActivatable. The building registers itself with the placeable system once finalized, so constructible farmhouses only count after completion. It has no prerequisites.

- **PlaceableFarmhouse** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableFarmhouse.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ No prerequisite: always returns true. |
| `PlaceableFarmhouse.registerFunctions(placeableType: table)` | 26 | ✍ Registers the sleeping trigger callback, the sleep camera and spawn getters, and getIsAllowedToSleep (body not in the SDK dump: UNVERIFIED). |
| `PlaceableFarmhouse.registerOverwrittenFunctions(placeableType: table)` | 37 | ✍ Overrides finalizeConstruction on the placeable type; the override body is not in the SDK dump (UNVERIFIED). |
| `PlaceableFarmhouse.registerEventListeners(placeableType: table)` | 44 | ✍ Subscribes to load, delete and finalize-placement events. |
| `PlaceableFarmhouse.registerXMLPaths(schema: XMLSchema, basePath: string)` | 54 | ✍ Declares farmhouse#spawnNode, farmhouse#isFinalized and the sleeping trigger node, camera node and isFreeForAll flag. |
| `PlaceableFarmhouse.registerSavegameXMLPaths(schema: XMLSchema, basePath: string)` | 68 | ✍ Declares the single savegame attribute isFreeForAll. |
| `PlaceableFarmhouse:onLoad(savegame: table)` | 77 | ✍ Creates the activatable, reads the spawn node (logs an error and falls back to the root node if missing) and the sleeping trigger, which gets a callback and a warning if the player collision bit is absent. Adds the sleeping camera when the node really is a camera, and reads isFreeForAll (default false) and isFinalized (default true). |
| `PlaceableFarmhouse:loadFromXMLFile(xmlFile: XMLFile, key: string)` | 116 | ✍ Overrides isFreeForAll with the saved value when one exists. |
| `PlaceableFarmhouse:saveToXMLFile(xmlFile: XMLFile, key: string, usedModNames: table)` | 129 | ✍ Writes the current isFreeForAll flag to the savegame. |
| `PlaceableFarmhouse:onFinalizePlacement()` | 135 | ✍ If the farmhouse is already finalized, registers it as a farmhouse with the placeable system. |
| `PlaceableFarmhouse:onDelete()` | 158 | ✍ Removes the activatable, unregisters the farmhouse from the placeable system, removes the sleeping trigger and drops the sleeping camera from the camera manager. |
| `PlaceableFarmhouse:getSpawnPoint() → integer?` | 177 | ✍ Returns the player spawn node, or nil while the farmhouse is not finalized. |
| `PlaceableFarmhouse:getSpawnWorldPosition()` | 189 | ✍ Returns the world x, y, z of the spawn node, or nil when not finalized. |
| `PlaceableFarmhouse:getSleepCamera() → integer?` | 202 | ✍ Returns the sleeping camera node, or nil if none was defined. |
| `PlaceableFarmhouse:farmhouseSleepingTriggerCallback(triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 233 | ✍ Trigger callback: only for the local player's root node, it adds the sleep activatable on enter and removes it on leave. A commented-out TODO about resetting the player's dog is dead code. Does nothing on a dedicated server (no local player). |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `farmhouseSleepingTriggerCallback` | 27 |
| registerFunction | `getSleepCamera` | 28 |
| registerFunction | `getSpawnWorldPosition` | 29 |
| registerFunction | `getSpawnPoint` | 30 |
| registerFunction | `getIsAllowedToSleep` | 31 |
| registerOverwrittenFunction | `finalizeConstruction` | 38 |
| registerEventListener | `onLoad` | 45 |
| registerEventListener | `onDelete` | 46 |
| registerEventListener | `onFinalizePlacement` | 47 |
