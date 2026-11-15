# placeables/specializations/PlaceableLeveling.lua

Source: `dataS/scripts/placeables/specializations/PlaceableLeveling.lua` — FS25 1.25.1.0

- **PlaceableLeveling** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableLeveling.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableLeveling.registerFunctions(placeableType: table)` | 25 |  |
| `PlaceableLeveling.registerEventListeners(placeableType: table)` | 38 |  |
| `PlaceableLeveling.registerXMLPaths(schema: XMLSchema, basePath: string)` | 46 |  |
| `PlaceableLeveling:onLoad(savegame: table)` | 68 |  |
| `PlaceableLeveling:loadLevelArea(xmlFile: XMLFile, key: string, area: table) → boolean` | 114 |  |
| `PlaceableLeveling:loadPaintArea(xmlFile: XMLFile, key: string, area: table) → boolean` | 147 |  |
| `PlaceableLeveling:getDeformationObjects(terrainRootNode: integer, forBlockingOnly: boolean, isBlocking: boolean) → array` | 180 |  |
| `PlaceableLeveling:addDeformationArea(deformationObject: TerrainDeformation, area: table, terrainBrushId: integer, writeBlockedAreaMap: boolean)` | 241 |  |
| `PlaceableLeveling:getRequiresLeveling() → boolean` | 261 |  |
| `PlaceableLeveling:getRequiresRealignAfterLeveling() → boolean` | 268 |  |
| `PlaceableLeveling:applyDeformation(isPreview: boolean, callback: function)` | 277 |  |

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
