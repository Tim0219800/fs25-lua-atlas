# placeables/specializations/PlaceableTipOcclusionAreas.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableTipOcclusionAreas.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableTipOcclusionAreas.lua` — FS25 1.25.1.0

✍ Placeable specialization that lets a building mark ground areas where bulk material cannot be tipped. It loads rectangles from `placeable.tipOcclusionUpdateAreas` (start and end nodes) or a legacy single `tipOcclusionUpdateArea`. On the server it flags the matching region of the height-map collision data as dirty so tip collisions get refreshed.

- **PlaceableTipOcclusionAreas** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableTipOcclusionAreas.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true: no prerequisite specialization. |
| `PlaceableTipOcclusionAreas.registerFunctions(placeableType: any)` | 24 | ✍ Registers `loadTipOcclusionArea` and `updateTipOcclusionAreas` on the placeable type. |
| `PlaceableTipOcclusionAreas.registerEventListeners(placeableType: any)` | 31 | ✍ Subscribes to onLoad, onDelete and onFinalizePlacement. |
| `PlaceableTipOcclusionAreas.registerXMLPaths(schema: any, basePath: any)` | 39 | ✍ Declares the XML keys for the legacy single area (`#sizeX`, `#sizeZ`, `#centerX`, `#centerZ`) and the multi-area list with `#startNode` and `#endNode`. |
| `PlaceableTipOcclusionAreas:onLoad(savegame: table)` | 53 | ✍ Builds the list of areas from the XML (each listed area through `loadTipOcclusionArea`, plus the legacy single area if size X and Z are both given) and clears the update-on-delete flag. |
| `PlaceableTipOcclusionAreas:onDelete()` | 90 | ✍ Server only, and not while reloading: if the flag set at placement is on, refreshes the occlusion areas so the freed ground can be used again. |
| `PlaceableTipOcclusionAreas:loadTipOcclusionArea(xmlFile: any, key: any, area: any)` | 104 | ✍ Reads start and end nodes, warns and returns false if one is missing, then fills `area` with center and size (in root-node local XZ) from the two node positions. Returns true on success. |
| `PlaceableTipOcclusionAreas:onFinalizePlacement()` | 141 | ✍ Server only: refreshes the occlusion areas unless the placeable was loaded from a valid savegame whose tip and placement collision data are still valid; then arms the refresh on delete. |
| `PlaceableTipOcclusionAreas:updateTipOcclusionAreas()` | 155 | ✍ Server only: converts each area into a world-space bounding box and marks it dirty in `g_densityMapHeightManager` collision map. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadTipOcclusionArea` | 25 |
| registerFunction | `updateTipOcclusionAreas` | 26 |
| registerEventListener | `onLoad` | 32 |
| registerEventListener | `onDelete` | 33 |
| registerEventListener | `onFinalizePlacement` | 34 |
