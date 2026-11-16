# placeables/specializations/PlaceableLeveling.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableLeveling.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableLeveling.lua` — FS25 1.25.1.0

✍ Placeable specialization describing how the ground is leveled and painted around a building when it is placed. It loads level areas (flattened, optionally painted with a ground type), paint-only areas and the smoothing parameters, then builds TerrainDeformation objects and queues them through the terrain deformation queue. It has no prerequisites; the deformation is run on demand by the placement code.

- **PlaceableLeveling** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableLeveling.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ No prerequisite: always returns true. |
| `PlaceableLeveling.registerFunctions(placeableType: table)` | 25 | ✍ Registers the leveling methods: area loaders, deformation objects, add area, apply, and the two leveling getters. |
| `PlaceableLeveling.registerEventListeners(placeableType: table)` | 38 | ✍ Subscribes to the load event. |
| `PlaceableLeveling.registerXMLPaths(schema: XMLSchema, basePath: string)` | 46 | ✍ Declares leveling attributes (requireLeveling, maxSmoothDistance, maxSlope, maxEdgeAngle, smoothingGroundType, realignAfterLeveling) and the levelArea and paintArea entries with start, width, height nodes and groundType. |
| `PlaceableLeveling:onLoad(savegame: table)` | 68 | ✍ Reads leveling settings (maxSmoothDistance is clamped to 0 to 10 with a warning, slope and edge angle default to 45), warns if the leveling block is missing and loads level and paint areas. Also checks for the deprecated rampAreas element. |
| `PlaceableLeveling:loadLevelArea(xmlFile: XMLFile, key: string, area: table) → boolean` | 114 | ✍ Reads a level area (three nodes and an optional groundType) into the table; returns false with a warning if a node is missing. |
| `PlaceableLeveling:loadPaintArea(xmlFile: XMLFile, key: string, area: table) → boolean` | 147 | ✍ Same as loadLevelArea but for paint-only areas, with warnings worded for paint areas. |
| `PlaceableLeveling:getDeformationObjects(terrainRootNode: integer, forBlockingOnly: boolean, isBlocking: boolean) → array` | 180 | ✍ Builds the TerrainDeformation objects for a terrain node: one for all level areas (blocked-area map, outside smoothing brush and limits, collision mask, small max displacements) and, unless blocking-only, one painting object for paint areas. Returns an empty list without a valid terrain root. Caller owns and deletes them. |
| `PlaceableLeveling:addDeformationArea(deformationObject: TerrainDeformation, area: table, terrainBrushId: integer, writeBlockedAreaMap: boolean)` | 241 | ✍ Converts an area's three nodes to world coordinates, builds the two edge vectors from the start corner and adds the parallelogram to the deformation object with the brush id and the blocked-area-map write flag. |
| `PlaceableLeveling:getRequiresLeveling() → boolean` | 261 | ✍ Returns whether the placeable asks for ground leveling. |
| `PlaceableLeveling:getRequiresRealignAfterLeveling() → boolean` | 268 | ✍ Returns whether the placeable is realigned in height after leveling (default true). |
| `PlaceableLeveling:applyDeformation(isPreview: boolean, callback: function)` | 277 | ✍ Runs the deformation objects one after another through g_terrainDeformationQueue, either as a preview or for real, summing the displaced volume. The callback receives the state, total volume and a blocking object name on failure, and objects are deleted through the async task manager. Calls the callback at once with success if there is nothing to do. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadLevelArea` | 26 |
| registerFunction | `loadPaintArea` | 27 |
| registerFunction | `addDeformationArea` | 28 |
| registerFunction | `applyDeformation` | 29 |
| registerFunction | `getDeformationObjects` | 30 |
| registerFunction | `getRequiresLeveling` | 31 |
| registerFunction | `getRequiresRealignAfterLeveling` | 32 |
| registerEventListener | `onLoad` | 39 |
