# animals/husbandry/placeables/PlaceableHusbandryFood.lua

*[Version française](../../../../fr/scripts/animals/husbandry/placeables/PlaceableHusbandryFood.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryFood.lua` — FS25 1.25.1.0

✍ Placeable specialization that manages the food stock of a husbandry. It requires `PlaceableHusbandryAnimals`, keeps one fill level per supported fill type (from the animal food groups and mixtures of `animalFoodSystem`), shows it with a dynamic fill plane and a food plane, and exposes unload triggers as feeding troughs. It computes the hourly consumption from the clusters, consumes food in `updateFeeding`, registers feeding places in the engine husbandry and syncs fill levels over the network (server authoritative).

- **PlaceableHusbandryFood** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableHusbandryFood.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Returns true only if `PlaceableHusbandryAnimals` is present. |
| `PlaceableHusbandryFood.registerFunctions(placeableType: any)` | 24 | ✍ Registers the food methods (fill planes, food places, add/remove food, totals, capacity, liters per hour) on the placeable type. `getAvailableFood` and `getFoodLitersPerHour` have no body in the SDK dump. |
| `PlaceableHusbandryFood.registerOverwrittenFunctions(placeableType: any)` | 38 | ✍ Registers overrides of `updateInfo`, `updateFeeding`, `getFoodInfos`, `collectPickObjects` and `getAnimalDescription`. |
| `PlaceableHusbandryFood.registerEventListeners(placeableType: any)` | 48 | ✍ Subscribes to the load, delete, placement, stream and update-stream events, plus `onHusbandryAnimalsUpdate` and `onHusbandryAnimalsCreated`. |
| `PlaceableHusbandryFood.registerXMLPaths(schema: any, basePath: any)` | 64 | ✍ Registers the XML keys under `husbandry.food`: trough capacity, food places, dynamic food plane, food plane and the unload trigger paths. |
| `PlaceableHusbandryFood.registerSavegameXMLPaths(schema: any, basePath: any)` | 81 | ✍ Registers the savegame keys `fillLevel(?)#fillType` and `#fillLevel`. |
| `PlaceableHusbandryFood.initSpecialization()` | 90 | ✍ Adds the `animalFoodFillTypes` store spec (fill type icons in the shop list). |
| `PlaceableHusbandryFood:onLoad(savegame: any)` | 96 | ✍ Initializes the food state, reads the capacity (default 5000), creates the feeding trough unload triggers (error state if none), the optional dynamic food plane and food plane with default fill types, and the food places. |
| `PlaceableHusbandryFood:onPostLoad()` | 173 | ✍ Reads the animal type and builds the supported fill types from the animal food groups and the food mixtures of the animal food system, with each group fill level starting at 0. |
| `PlaceableHusbandryFood:onDelete()` | 201 | ✍ Deletes the feeding trough triggers, the dynamic food plane node and the food plane. |
| `PlaceableHusbandryFood:onFinalizePlacement()` | 224 | ✍ Registers each feeding trough trigger as a network object. |
| `PlaceableHusbandryFood:onPostFinalizePlacement()` | 235 | ✍ Refreshes the food fill planes once placement is finished. |
| `PlaceableHusbandryFood:onReadStream(streamId: any, connection: any)` | 241 | ✍ Network read: reads the fill level of each fill type, then each trough trigger's object id and stream data, and finishes its client registration. |
| `PlaceableHusbandryFood:onWriteStream(streamId: any, connection: any)` | 265 | ✍ Network write: writes the fill level of each fill type, then each trough trigger's object id and stream data, registering it in the connection. |
| `PlaceableHusbandryFood:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 288 | ✍ Client side update read: reads the optional fill position, then the optional fill levels and applies each difference via `addFood` or `removeFood`. Ignored if the connection is not from the server. |
| `PlaceableHusbandryFood:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 314 | ✍ Server side update write: sends the last fill position and the fill levels when their dirty flags are set. Does nothing when called for the server connection. |
| `PlaceableHusbandryFood:loadFromXMLFile(xmlFile: any, key: any)` | 334 | ✍ Reads the saved `fillLevel` entries and adds each amount via `addFood`, only for fill types this husbandry supports. |
| `PlaceableHusbandryFood:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 350 | ✍ Saves every fill type with a level above zero as a `fillLevel` entry (name and amount). |
| `PlaceableHusbandryFood:updateFeeding(superFunc: any)` | 368 | ✍ Override: on the server consumes food through the animal food system for the current hourly need (times the time adjustment), removes the consumed amounts, and returns the parent's factor multiplied by the consumption factor. |
| `PlaceableHusbandryFood:updateInfo(superFunc: any, infoTable: any)` | 391 | ✍ Override: appends the total food amount in liters to the info list. |
| `PlaceableHusbandryFood:getFoodInfos(superFunc: any)` | 402 | ✍ Override: adds one entry per food group with its title, production weight percentage, summed fill level, capacity and fill ratio. |
| `PlaceableHusbandryFood:updateFillPlanes(fillTypeIndex: any)` | 438 | ✍ Sets the food plane state to total food over capacity (clamped 0 to 1) and, if food is present and a fill type is given, applies that fill type's material to the plane. |
| `PlaceableHusbandryFood:collectPickObjects(superFunc: any, node: any)` | 459 | ✍ Override: ignores nodes that are the exact-fill root of a feeding trough so they are not collected as pick objects; otherwise defers to the parent. |
| `PlaceableHusbandryFood:onHusbandryAnimalsCreated(husbandryId: any)` | 475 | ✍ When the engine husbandry exists, adds each food place as a feeding place (type food) and stores the place index only if it is reachable on the navigation mesh. |
| `PlaceableHusbandryFood:updateFoodPlaces()` | 492 | ✍ Pushes the current total food level to every accessible feeding place of the engine husbandry. |
| `PlaceableHusbandryFood:getTotalFood()` | 506 | ✍ Returns the sum of the fill levels of all fill types, in liters. |
| `PlaceableHusbandryFood:getFoodCapacity()` | 523 | ✍ Returns the trough capacity. |
| `PlaceableHusbandryFood:getFreeFoodCapacity(fillTypeIndex: any)` | 529 | ✍ Returns the capacity minus total food, or 0 if the fill type is not supported (capacity is shared across all fill types). |
| `PlaceableHusbandryFood:addFood(farmId: any, deltaFillLevel: any, fillTypeIndex: any, fillPositionData: any, toolType: any, extraAttributes: any)` | 540 | ✍ Adds food of a fill type, limited by free capacity, and returns the amount actually added (0 if unsupported or full). Mixtures are split into their ingredients by weight; also fills the dynamic plane and flags the network update on the server. Note: the position-change condition mixes `and`/`or` without parentheses, so the second part is evaluated even on a client. |
| `PlaceableHusbandryFood:removeFood(absDeltaFillLevel: any, fillTypeIndex: any)` | 630 | ✍ Removes up to the given amount of a fill type (never more than stored), updates the dynamic plane and food places, flags the network update on the server, and returns the amount removed. |
| `PlaceableHusbandryFood:onHusbandryAnimalsUpdate(clusters: any)` | 668 | ✍ Recomputes `litersPerHour` from every cluster: the daily food need per animal for its age times the animal count, divided by 24. |
| `PlaceableHusbandryFood:getAnimalDescription(superFunc: any, cluster: any)` | 689 | ✍ Override: appends the localized percentage description text to the parent's text. |
| `PlaceableHusbandryFood.loadSpecValueAnimalFoodFillTypes(xmlFile: any, customEnvironment: any, baseDir: any)` | 697 | ✍ Store spec loader: reads the animal type name and whether the husbandry needs a water supply (no automatic water supply). Returns nil if neither node exists. |
| `PlaceableHusbandryFood.getSpecValueAnimalFoodFillTypes(storeItem: any, realItem: any)` | 715 | ✍ Store spec getter: lists the fill types of the animal type's food groups and mixtures, plus water if needed. Returns nil if the spec or animal type is missing. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `updateFillPlanes` | 25 |
| registerFunction | `updateFoodPlaces` | 26 |
| registerFunction | `addFood` | 27 |
| registerFunction | `removeFood` | 28 |
| registerFunction | `getTotalFood` | 29 |
| registerFunction | `getAvailableFood` | 30 |
| registerFunction | `getFoodCapacity` | 31 |
| registerFunction | `getFreeFoodCapacity` | 32 |
| registerFunction | `getFoodLitersPerHour` | 33 |
| registerOverwrittenFunction | `updateInfo` | 39 |
| registerOverwrittenFunction | `updateFeeding` | 40 |
| registerOverwrittenFunction | `getFoodInfos` | 41 |
| registerOverwrittenFunction | `collectPickObjects` | 42 |
| registerOverwrittenFunction | `getAnimalDescription` | 43 |
| registerEventListener | `onLoad` | 49 |
| registerEventListener | `onPostLoad` | 50 |
| registerEventListener | `onDelete` | 51 |
| registerEventListener | `onFinalizePlacement` | 52 |
| registerEventListener | `onPostFinalizePlacement` | 53 |
| registerEventListener | `onReadStream` | 54 |
| registerEventListener | `onWriteStream` | 55 |
| registerEventListener | `onReadUpdateStream` | 56 |
| registerEventListener | `onWriteUpdateStream` | 57 |
| registerEventListener | `onHusbandryAnimalsUpdate` | 58 |
| registerEventListener | `onHusbandryAnimalsCreated` | 59 |
