# placeables/specializations/PlaceableIndoorAreas.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableIndoorAreas.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableIndoorAreas.lua` — FS25 1.25.1.0

✍ Placeable specialization that marks parallelogram areas as indoor in the mission's indoor mask when the placeable is finalized, and resets them to outdoor on deletion. The mask is used by the game to tell inside from outside (exact consumers are UNVERIFIED). It has no prerequisites.

- **PlaceableIndoorAreas** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableIndoorAreas.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ No prerequisite: always returns true. |
| `PlaceableIndoorAreas.registerFunctions(placeableType: any)` | 24 | ✍ Registers the loadIndoorArea method. |
| `PlaceableIndoorAreas.registerEventListeners(placeableType: any)` | 30 | ✍ Subscribes to load, delete and finalize-placement events. |
| `PlaceableIndoorAreas.registerXMLPaths(schema: any, basePath: any)` | 38 | ✍ Declares indoorAreas.indoorArea entries with startNode, widthNode and heightNode. |
| `PlaceableIndoorAreas:onLoad(savegame: table)` | 49 | ✍ Loads the indoor areas via loadIndoorArea and logs an XML warning if no indoorAreas block exists. |
| `PlaceableIndoorAreas:onDelete()` | 68 | ✍ If areas were marked, sets them back to OUTDOOR in the indoor mask, except while the placeable is reloading. |
| `PlaceableIndoorAreas:loadIndoorArea(xmlFile: any, key: any, area: any)` | 80 | ✍ Reads one area's three nodes into the table; returns false with a warning if one is missing. |
| `PlaceableIndoorAreas:onFinalizePlacement()` | 108 | ✍ Sets every area to INDOOR in the mission indoor mask and enables the reset to outdoor on deletion. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadIndoorArea` | 25 |
| registerEventListener | `onLoad` | 31 |
| registerEventListener | `onDelete` | 32 |
| registerEventListener | `onFinalizePlacement` | 33 |
