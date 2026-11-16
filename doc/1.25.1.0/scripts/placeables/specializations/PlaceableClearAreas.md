# placeables/specializations/PlaceableClearAreas.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableClearAreas.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableClearAreas.lua` — FS25 1.25.1.0

✍ Placeable specialization that defines rectangular areas (start, width and height nodes) cleared when the placeable is first built. On the server, for a placeable not loaded from a savegame, it removes fields, weeds, stones, tire tracks, decoration and heap content on the areas.

- **PlaceableClearAreas** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableClearAreas.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true: no prerequisite specializations. |
| `PlaceableClearAreas.registerFunctions(placeableType: any)` | 24 | ✍ Registers `loadClearArea`. |
| `PlaceableClearAreas.registerEventListeners(placeableType: any)` | 30 | ✍ Subscribes to `onLoad` and `onPostFinalizePlacement`. |
| `PlaceableClearAreas.registerXMLPaths(schema: any, basePath: any)` | 37 | ✍ Declares `clearAreas.clearArea(?)` with `startNode`, `widthNode` and `heightNode`. |
| `PlaceableClearAreas:onLoad(savegame: table)` | 48 | ✍ Loads every `clearArea` entry that is valid and warns when the `clearAreas` section is missing. |
| `PlaceableClearAreas:loadClearArea(xmlFile: any, key: any, area: any)` | 66 | ✍ Reads the start, width and height nodes into the area table; logs a warning and returns false if any is missing, else true. |
| `PlaceableClearAreas:onPostFinalizePlacement()` | 94 | ✍ Server only, and only for new placements: for each area removes field, weed, stone, tire track and deco content via `FSDensityMapUtil` and clears height-map content via `DensityMapHeightUtil.clearArea`. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadClearArea` | 25 |
| registerEventListener | `onLoad` | 31 |
| registerEventListener | `onPostFinalizePlacement` | 32 |
