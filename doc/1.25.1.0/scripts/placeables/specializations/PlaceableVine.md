# placeables/specializations/PlaceableVine.lua

Source : `dataS/scripts/placeables/specializations/PlaceableVine.lua` — FS25 1.25.1.0

- **PlaceableVine** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableVine.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableVine.registerFunctions(placeableType: any)` | 24 |  |
| `PlaceableVine.registerOverwrittenFunctions(placeableType: any)` | 43 |  |
| `PlaceableVine.registerEventListeners(placeableType: any)` | 52 |  |
| `PlaceableVine.registerXMLPaths(schema: any, basePath: any)` | 59 |  |
| `PlaceableVine.registerSavegameXMLPaths(schema: any, basePath: any)` | 81 |  |
| `PlaceableVine:onLoad(savegame: table)` | 90 |  |
| `PlaceableVine:deleteSegment(superFunc: any, segment: any)` | 195 |  |
| `PlaceableVine:generateSegmentPoles(superFunc: any, segment: any, sync: any)` | 208 |  |
| `PlaceableVine:onCreateSegmentPanel(isPreview: any, segment: any, panel: any, poleIndex: any, dy: any, pole: any)` | 236 |  |
| `PlaceableVine:doDeletePanel(superFunc: any, segment: any, segmentIndex: any, poleIndex: any)` | 363 |  |
| `PlaceableVine:destroyVineArea(data: any)` | 399 |  |
| `PlaceableVine:getVineFruitTypeIndex()` | 418 |  |
| `PlaceableVine:getInitialGrowthState() → integer` | 427 |  |
| `PlaceableVine:updateVineNode(node: any, isGrowing: any)` | 440 |  |
| `PlaceableVine:updateVineVisuals(data: any)` | 498 |  |
| `PlaceableVine:harvestVine(node: any, startX: any, startY: any, startZ: any, currentX: any, currentY: any, currentZ: any, callback: any, target: any)` | 538 |  |
| `PlaceableVine:setShakingFactor(node: any, worldX: any, worldY: any, worldZ: any, intensity: any)` | 573 |  |
| `PlaceableVine:setSqueezeFactor(node: integer, worldX: number, worldY: number, worldZ: number, strength: number, length: number, fadeLength: number?)` | 594 |  |
| `PlaceableVine:prepareVine(node: any, startX: any, startY: any, startZ: any, currentX: any, currentY: any, currentZ: any)` | 609 |  |
| `PlaceableVine:getSectionFactor(node: any, i: any, startX: any, startY: any, startZ: any, currentX: any, currentY: any, currentZ: any)` | 641 |  |
| `PlaceableVine:getVineAreaByNode(node: any)` | 669 |  |
| `PlaceableVine:getVineFruitType()` | 687 |  |
| `PlaceableVine:getHasSegmentTargetGrowthState(segment: any, fruitTypeIndex: any, useHarvestStates: any, usePrepareStates: any)` | 693 |  |
| `PlaceableVine:getSegmentSideArea(segment: any, segmentSide: any)` | 734 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `updateVineNode` | 25 |
| registerFunction | `updateVineVisuals` | 26 |
| registerFunction | `destroyVineArea` | 27 |
| registerFunction | `getVineFruitTypeIndex` | 28 |
| registerFunction | `getInitialGrowthState` | 29 |
| registerFunction | `setShakingFactor` | 30 |
| registerFunction | `setSqueezeFactor` | 31 |
| registerFunction | `harvestVine` | 32 |
| registerFunction | `prepareVine` | 33 |
| registerFunction | `getVineFruitType` | 34 |
| registerFunction | `getHasSegmentTargetGrowthState` | 35 |
| registerFunction | `getSegmentSideArea` | 36 |
| registerFunction | `getSectionFactor` | 37 |
| registerFunction | `getVineAreaByNode` | 38 |
| registerOverwrittenFunction | `doDeletePanel` | 44 |
| registerOverwrittenFunction | `generateSegmentPoles` | 45 |
| registerOverwrittenFunction | `deleteSegment` | 46 |
| registerOverwrittenFunction | `getHasParallelSnapping` | 47 |
| registerEventListener | `onLoad` | 53 |
| registerEventListener | `onCreateSegmentPanel` | 54 |
