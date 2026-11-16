# placeables/specializations/PlaceableFoliageAreas.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableFoliageAreas.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableFoliageAreas.lua` — FS25 1.25.1.0

✍ Placeable specialization that lets a building define parallelogram areas (start, width, height nodes) painted with a fruit type at a growth state, or with a deco foliage layer, when the placeable is finalized. It only writes to the map on the server. It has no prerequisites.

- **PlaceableFoliageAreas** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableFoliageAreas.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ No prerequisite: always returns true. |
| `PlaceableFoliageAreas.registerFunctions(placeableType: any)` | 24 | ✍ Registers the loadFoliageArea method on the placeable type. |
| `PlaceableFoliageAreas.registerEventListeners(placeableType: any)` | 30 | ✍ Subscribes to the load and post-finalize-placement events. |
| `PlaceableFoliageAreas.registerXMLPaths(schema: any, basePath: any)` | 37 | ✍ Declares foliageAreas.foliageArea entries: start, width and height nodes, fruitType, growthStateName, decoFoliage and numeric state. |
| `PlaceableFoliageAreas:onLoad(savegame: table)` | 52 | ✍ Iterates the foliageArea entries and keeps those that loadFoliageArea accepts in spec.areas. |
| `PlaceableFoliageAreas:loadFoliageArea(xmlFile: any, key: any, area: any)` | 66 | ✍ Reads one area into the given table. If both fruitType and decoFoliage are set, decoFoliage is ignored. Resolves the fruit type and growth state (default is the max harvesting state minus one), checks the deco layer exists on the map, and needs the three nodes. Returns false on any failure. |
| `PlaceableFoliageAreas:onPostFinalizePlacement()` | 134 | ✍ Server only: for fruit areas queues a FieldUpdateTask with the fruit type and growth state on the area; for deco areas calls applyDecoFoliage on the foliage system with the three corner world positions. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadFoliageArea` | 25 |
| registerEventListener | `onLoad` | 31 |
| registerEventListener | `onPostFinalizePlacement` | 32 |
