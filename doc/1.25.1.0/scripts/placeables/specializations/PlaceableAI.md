# placeables/specializations/PlaceableAI.lua

Source: `dataS/scripts/placeables/specializations/PlaceableAI.lua` — FS25 1.25.1.0

- **PlaceableAI** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableAI.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableAI.registerFunctions(placeableType: any)` | 24 |  |
| `PlaceableAI.registerEventListeners(placeableType: any)` | 34 |  |
| `PlaceableAI.registerXMLPaths(schema: any, basePath: any)` | 43 |  |
| `PlaceableAI:onLoad(savegame: table)` | 66 |  |
| `PlaceableAI:onPostLoad(savegame: any)` | 103 |  |
| `PlaceableAI:onDelete()` | 145 |  |
| `PlaceableAI:loadAIUpdateArea(xmlFile: any, key: any, area: any)` | 175 |  |
| `PlaceableAI:loadAISpline(xmlFile: any, key: any, spline: any)` | 212 |  |
| `PlaceableAI:loadAIObstacle(xmlFile: any, key: any, obstacle: any)` | 236 |  |
| `PlaceableAI:onFinalizePlacement()` | 282 |  |
| `PlaceableAI:setObstacleActive(obstacle: any, active: any)` | 312 |  |
| `PlaceableAI:updateAIUpdateAreas()` | 328 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `setObstacleActive` | 25 |
| registerFunction | `loadAIUpdateArea` | 26 |
| registerFunction | `loadAISpline` | 27 |
| registerFunction | `loadAIObstacle` | 28 |
| registerFunction | `updateAIUpdateAreas` | 29 |
| registerEventListener | `onLoad` | 35 |
| registerEventListener | `onPostLoad` | 36 |
| registerEventListener | `onDelete` | 37 |
| registerEventListener | `onFinalizePlacement` | 38 |
