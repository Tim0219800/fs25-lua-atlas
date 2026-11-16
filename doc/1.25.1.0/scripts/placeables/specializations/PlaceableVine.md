# placeables/specializations/PlaceableVine.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableVine.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableVine.lua` — FS25 1.25.1.0

✍ Placeable specialization for vineyards, built on PlaceableFence: each fence panel carries a vine node whose growth state is read from the fruit-type density map (`FSDensityMapUtil` vine area functions, signatures only in the dump, so their internals are UNVERIFIED). It loads the fruit type, panel size, sections, growth-state visuals and reset rules from `placeable.vine`, and offers harvest, prepare and shake/squeeze hooks used by vine machines, working server side. The vine system in `g_currentMission.vineSystem` tracks the panels.

- **PlaceableVine** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableVine.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Returns true only if the placeable type includes the PlaceableFence specialization. |
| `PlaceableVine.registerFunctions(placeableType: any)` | 24 | ✍ Registers the vine functions: node and visual updates, area destruction, fruit type and initial growth state getters, shake and squeeze factors, harvest, prepare, section factor, area by node and segment helpers. |
| `PlaceableVine.registerOverwrittenFunctions(placeableType: any)` | 43 | ✍ Overrides the fence functions `doDeletePanel`, `generateSegmentPoles`, `deleteSegment` and `getHasParallelSnapping`. Note: no `getHasParallelSnapping` function is defined in this file (UNVERIFIED target). |
| `PlaceableVine.registerEventListeners(placeableType: any)` | 52 | ✍ Subscribes to onLoad and onCreateSegmentPanel (the latter is raised by the fence specialization for each created panel). |
| `PlaceableVine.registerXMLPaths(schema: any, basePath: any)` | 59 | ✍ Declares the `.vine` keys: `#fruitType`, `#width`, `#length`, `#thresholdFactor`, `#numLODOffsets`, `#numSections`, on/off-season growth states, growth state nodes with foliage states, and reset states with threshold and target. |
| `PlaceableVine.registerSavegameXMLPaths(schema: any, basePath: any)` | 81 | ✍ Declares the savegame attribute `#startGrowthState` of the vineyard. |
| `PlaceableVine:onLoad(savegame: table)` | 90 | ✍ Reads the fruit type (warns and aborts if missing or unknown), panel dimensions, section count, on/off-season growth states, growth-state foliage mappings (with validity checks) and reset states, plus the saved start growth state. |
| `PlaceableVine:deleteSegment(superFunc: any, segment: any)` | 195 | ✍ Forgets the stored vine data of the segment, then calls the parent to delete it. |
| `PlaceableVine:generateSegmentPoles(superFunc: any, segment: any, sync: any)` | 208 | ✍ Before the parent regenerates a non-preview segment, unregisters its previous vine nodes from the vine system and resets the segment data list. |
| `PlaceableVine:onCreateSegmentPanel(isPreview: any, segment: any, panel: any, poleIndex: any, dy: any, pole: any)` | 236 | ✍ Called per new fence panel. Optionally disables shadow casting, then for real panels creates the vine node data, hides the growth-state nodes, adjusts custom LOD children and random UV offsets, computes section areas and reads existing vine pixels. If no vine exists yet it creates the area with the start state, and registers the node with the vine system. In preview it only shows the preview state. |
| `PlaceableVine:doDeletePanel(superFunc: any, segment: any, segmentIndex: any, poleIndex: any)` | 363 | ✍ Before the parent deletes a panel, removes the matching vine node from the vine system and destroys its density-map vine area; does nothing for an invalid segment or pole index. |
| `PlaceableVine:destroyVineArea(data: any)` | 399 | ✍ Server only: destroys the density-map vine area of each section of the given panel data. |
| `PlaceableVine:getVineFruitTypeIndex()` | 418 | ✍ Returns the index of the vineyard fruit type. |
| `PlaceableVine:getInitialGrowthState() → integer` | 427 | ✍ Returns the growth state new vines start in: the off-season state when the fruit type cannot be planted in the current period and one is defined, else the on-season state or 1. Uses `environment.currentPeriod`, UNVERIFIED. |
| `PlaceableVine:updateVineNode(node: any, isGrowing: any)` | 440 | ✍ Refreshes a panel node: if growing, may reset the whole area to a target state when part of it is already in a reset state (server only); then re-reads the growth values of every section from the density map and updates visuals. Ignores unknown or deleted nodes. |
| `PlaceableVine:updateVineVisuals(data: any)` | 498 | ✍ Shows the growth-state node with the largest foliage area, hides the others, and sets its `hideSectionStates` shader parameter from the dominant state of each section (the shader call uses only three section values). |
| `PlaceableVine:harvestVine(node: any, startX: any, startY: any, startZ: any, currentX: any, currentY: any, currentZ: any, callback: any, target: any)` | 538 | ✍ Server only: for sections overlapped by the harvester path beyond the threshold factor, cuts the vine area and calls `callback(target, ...)` with area, weed, spray, plow and lime factors; then refreshes the node. |
| `PlaceableVine:setShakingFactor(node: any, worldX: any, worldY: any, worldZ: any, intensity: any)` | 573 | ✍ Sets the `harvestPosition` shader parameter (world position and intensity) on all growth-state nodes of the panel to animate shaking. |
| `PlaceableVine:setSqueezeFactor(node: integer, worldX: number, worldY: number, worldZ: number, strength: number, length: number, fadeLength: number?)` | 594 | ✍ Sets the squeeze shader parameters (`harvestSqueezePosition` and `harvestSqueezeScale` with strength, length, fade length) on all growth-state nodes of the panel. |
| `PlaceableVine:prepareVine(node: any, startX: any, startY: any, startZ: any, currentX: any, currentY: any, currentZ: any)` | 609 | ✍ Server only: applies the prepare operation to sections touched by the machine path (beyond the threshold factor), refreshes the node if anything changed and returns the total prepared area (0 on clients or unknown nodes). |
| `PlaceableVine:getSectionFactor(node: any, i: any, startX: any, startY: any, startZ: any, currentX: any, currentY: any, currentZ: any)` | 641 | ✍ Returns the fraction (0 to 1) of section `i` covered along the node local Z axis by the segment between the start and current world positions. |
| `PlaceableVine:getVineAreaByNode(node: any)` | 669 | ✍ Returns six numbers (start, width and height corner coordinates in XZ) of the rectangle covered by a panel node, using the configured vine width and length. |
| `PlaceableVine:getVineFruitType()` | 687 | ✍ Returns the vineyard fruit type index, same value as `getVineFruitTypeIndex`. |
| `PlaceableVine:getHasSegmentTargetGrowthState(segment: any, fruitTypeIndex: any, useHarvestStates: any, usePrepareStates: any)` | 693 | ✍ Returns true if any panel of the segment has area in the harvest growth states (or the withered state when preparing) for the given fruit type; false for another fruit type or when neither mode is requested. |
| `PlaceableVine:getSegmentSideArea(segment: any, segmentSide: any)` | 734 | ✍ Returns six XZ coordinates describing a strip along one side of a fence segment, offset from the segment by the snap distance (side 1 by default). |

## Specialization

| Type | Name | Line |
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
