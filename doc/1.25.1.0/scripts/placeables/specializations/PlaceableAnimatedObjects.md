# placeables/specializations/PlaceableAnimatedObjects.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableAnimatedObjects.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableAnimatedObjects.lua` — FS25 1.25.1.0

✍ Placeable specialization (`spec_animatedObjects`) that owns a list of `AnimatedObject` instances (doors, gates and similar) loaded from `placeable.animatedObjects`. It supports dependencies between objects based on animation time, registers the objects when placement is finished, syncs them to joining clients, saves them, and keeps their farm owner in step with the placeable. It has no prerequisites.

- **PlaceableAnimatedObjects** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableAnimatedObjects.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Prerequisite check; always returns true. |
| `PlaceableAnimatedObjects.registerFunctions(placeableType: any)` | 24 | ✍ Registers `getCanTriggerAnimatedObject` and `getAnimatedObjectBySaveId` on the placeable type. Note: no `getCanTriggerAnimatedObject` function is defined in this file, so the registered value is nil here (UNVERIFIED if another file supplies it). |
| `PlaceableAnimatedObjects.registerOverwrittenFunctions(placeableType: any)` | 31 | ✍ Registers an override of the placeable's `setOwnerFarmId`. |
| `PlaceableAnimatedObjects.registerEventListeners(placeableType: any)` | 37 | ✍ Subscribes to `onLoad`, `onDelete`, `onReadStream`, `onWriteStream` and `onPostFinalizePlacement`. |
| `PlaceableAnimatedObjects.registerXMLPaths(schema: any, basePath: any)` | 47 | ✍ Registers the `.animatedObjects` schema through `AnimatedObject.registerXMLPaths`, plus per-object `dependency` entries with `animatedObjectIndex`, `minTime` and `maxTime`. |
| `PlaceableAnimatedObjects.registerSavegameXMLPaths(schema: any, basePath: any)` | 58 | ✍ Registers the savegame paths of each `animatedObject` by delegating to `AnimatedObject.registerSavegameXMLPaths`. |
| `PlaceableAnimatedObjects:onLoad(savegame: table)` | 65 | ✍ Creates and loads each `AnimatedObject` with its dependency list, then wraps its `getCanBeTriggered` so it also requires the placeable's `getCanTriggerAnimatedObject` and that each dependency object's animation time lies within its min/max. |
| `PlaceableAnimatedObjects:onDelete()` | 124 | ✍ Deletes all animated objects and clears the list. |
| `PlaceableAnimatedObjects:onPostFinalizePlacement()` | 137 | ✍ Registers every animated object as a network object and gives it the placeable's owner farm id. |
| `PlaceableAnimatedObjects:onReadStream(streamId: any, connection: any)` | 148 | ✍ Client side: for each animated object reads its network object id and state from the stream, then finishes registering it with `g_client`. |
| `PlaceableAnimatedObjects:onWriteStream(streamId: integer, connection: table)` | 163 | ✍ Server side, when a client joins: writes each animated object's node reference and state to the stream and registers it for that connection. |
| `PlaceableAnimatedObjects:loadFromXMLFile(xmlFile: any, key: any)` | 176 | ✍ Loads each animated object's saved state from the savegame XML under `<key>.animatedObject(i)`. |
| `PlaceableAnimatedObjects:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 185 | ✍ Saves each animated object to the savegame XML under `<key>.animatedObject(i)`, passing the used mod names. |
| `PlaceableAnimatedObjects:getAnimatedObjectBySaveId(saveId: string) → table?` | 207 | ✍ Returns the animated object whose `saveId` matches, or nil if none does. |
| `PlaceableAnimatedObjects:setOwnerFarmId(superFunc: any, ownerFarmId: any, noEventSend: any)` | 219 | ✍ Override: calls the parent function, then sets the same owner farm id on every animated object without sending an event. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getCanTriggerAnimatedObject` | 25 |
| registerFunction | `getAnimatedObjectBySaveId` | 26 |
| registerOverwrittenFunction | `setOwnerFarmId` | 32 |
| registerEventListener | `onLoad` | 38 |
| registerEventListener | `onDelete` | 39 |
| registerEventListener | `onReadStream` | 40 |
| registerEventListener | `onWriteStream` | 41 |
| registerEventListener | `onPostFinalizePlacement` | 42 |
