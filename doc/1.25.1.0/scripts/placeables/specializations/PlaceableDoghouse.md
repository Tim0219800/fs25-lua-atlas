# placeables/specializations/PlaceableDoghouse.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableDoghouse.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableDoghouse.lua` — FS25 1.25.1.0

✍ Placeable specialization for the farm's dog house. The server spawns a `Dog` and a `DogBall` at nodes defined in the XML (optionally per `dogHouse` configuration), a construction preview shows a textured dog model instead, and players can interact via a trigger to fill the food bowl. Only one dog house is allowed per farm, tracked in `g_currentMission.doghouses`, and the bowl is emptied every game hour.

- **PlaceableDoghouse** (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableDoghouse.prerequisitesPresent(specializations: table) → boolean` | 22 | ✍ Always returns true: no prerequisite specializations. |
| `PlaceableDoghouse.initSpecialization()` | 28 | ✍ Adds the placeable configuration type `dogHouse` (selectable doghouse configurations) to the placeable configuration manager. |
| `PlaceableDoghouse.registerFunctions(placeableType: any)` | 35 | ✍ Registers eight functions: interaction trigger callback, registration checks and (un)registration with the mission, food bowl state, dog and spawn node getters, and the preview dog load callback. |
| `PlaceableDoghouse.registerOverwrittenFunctions(placeableType: any)` | 49 | ✍ Overrides `setOwnerFarmId`, `canBuy`, `getCanBePlacedAt` and `getNeedHourChanged`. |
| `PlaceableDoghouse.registerEventListeners(placeableType: any)` | 58 | ✍ Subscribes to `onLoad`, `onDelete`, `onFinalizePlacement`, `onWriteStream`, `onReadStream` and `onHourChanged`. |
| `PlaceableDoghouse.registerXMLPaths(schema: any, basePath: any)` | 69 | ✍ Declares the dog house keys (dog node, preview node, texture tile indices, dog XML, nameplate, ball node and file, interaction trigger, bowl food node and fill sound) both under `dogHouse` and under each `dogHouseConfiguration`. |
| `PlaceableDoghouse.registerSavegameXMLPaths(schema: any, basePath: any)` | 92 | ✍ Declares the savegame keys by delegating to `Dog.registerSavegameXMLPaths`. |
| `PlaceableDoghouse:onLoad(savegame: table)` | 101 | ✍ Picks the active configuration, then on the server (not in preview) creates and registers the `Dog` and `DogBall`. In construction preview it loads the dog model asynchronously for display. Sets up the interaction trigger, bowl food node and sound and the activatable. If the spawn node or dog is invalid, it removes most listeners and stops. |
| `PlaceableDoghouse:onDelete()` | 206 | ✍ Removes the activatable, unregisters the doghouse from the mission, and on the server deletes the dog and ball if not already deleted. Removes the trigger, deletes the fill sound and releases the preview dog i3d. |
| `PlaceableDoghouse:onFinalizePlacement()` | 240 | ✍ Server: calls `finalizePlacement` on the dog. Then registers the doghouse with the mission. |
| `PlaceableDoghouse:onReadStream(streamId: any, connection: any)` | 252 | ✍ Client side join: reads the dog network object (and links the dog back to this spawner) and the food bowl visibility. |
| `PlaceableDoghouse:onWriteStream(streamId: integer, connection: table)` | 269 | ✍ Server side join: writes the dog network object and the food bowl visibility. |
| `PlaceableDoghouse:loadFromXMLFile(xmlFile: any, key: any)` | 281 | ✍ Delegates loading of the savegame data to the dog, if there is one. |
| `PlaceableDoghouse:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 290 | ✍ Delegates saving to the dog, if there is one. |
| `PlaceableDoghouse:onPreviewDogLoaded(node: any, failedReason: any, args: any)` | 299 | ✍ Async callback for the preview dog model: links it to the preview node (or root node) and sets the texture atlas tile shader parameter. Always finishes the loading task. |
| `PlaceableDoghouse:dogInteractionTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 319 | ✍ Trigger callback: when the local player of the owning farm enters or leaves and a dog exists, adds or removes the doghouse activatable. |
| `PlaceableDoghouse:isDoghouseRegistered() → boolean` | 335 | ✍ Returns true if the mission already has a doghouse for this placeable's owner farm. |
| `PlaceableDoghouse:registerDoghouseToMission() → boolean` | 343 | ✍ Adds this placeable to `g_currentMission.doghouses` unless the farm already has one; returns whether it was added. |
| `PlaceableDoghouse:unregisterDoghouseToMission() → boolean` | 355 | ✍ Removes this placeable from `g_currentMission.doghouses` and returns true. |
| `PlaceableDoghouse:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 363 | ✍ Calls the parent, then on the server propagates the new owner farm id to the dog and the ball. |
| `PlaceableDoghouse:setFoodBowlState(isFilled: any, noEventSend: any)` | 380 | ✍ Sends a bowl state event, shows or hides the food node and, when filled, tells the dog about the bowl and plays the fill sound. Does nothing without a food node. |
| `PlaceableDoghouse:getDog()` | 399 | ✍ Returns the `Dog` object (nil on clients not yet synced or when none was spawned). |
| `PlaceableDoghouse:getSpawnNode()` | 405 | ✍ Returns the dog spawn node. |
| `PlaceableDoghouse:getCanBePlacedAt(superFunc: any, x: any, y: any, z: any, farmId: any)` | 411 | ✍ Refuses placement with a one-per-farm warning if a doghouse is already registered; otherwise defers to the parent. |
| `PlaceableDoghouse:canBuy(superFunc: any)` | 421 | ✍ Runs the parent check, then refuses the purchase with a one-per-farm warning if a doghouse already exists for the farm. |
| `PlaceableDoghouse:getNeedHourChanged(superFunc: any)` | 436 | ✍ Always returns true so the placeable receives `onHourChanged`. |
| `PlaceableDoghouse:onHourChanged()` | 442 | ✍ Empties the food bowl every game hour, without sending an event (`setFoodBowlState(false, true)`). |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `dogInteractionTriggerCallback` | 36 |
| registerFunction | `isDoghouseRegistered` | 37 |
| registerFunction | `registerDoghouseToMission` | 38 |
| registerFunction | `unregisterDoghouseToMission` | 39 |
| registerFunction | `setFoodBowlState` | 40 |
| registerFunction | `getDog` | 41 |
| registerFunction | `getSpawnNode` | 42 |
| registerFunction | `onPreviewDogLoaded` | 43 |
| registerOverwrittenFunction | `setOwnerFarmId` | 50 |
| registerOverwrittenFunction | `canBuy` | 51 |
| registerOverwrittenFunction | `getCanBePlacedAt` | 52 |
| registerOverwrittenFunction | `getNeedHourChanged` | 53 |
| registerEventListener | `onLoad` | 59 |
| registerEventListener | `onDelete` | 60 |
| registerEventListener | `onFinalizePlacement` | 61 |
| registerEventListener | `onWriteStream` | 62 |
| registerEventListener | `onReadStream` | 63 |
| registerEventListener | `onHourChanged` | 64 |
