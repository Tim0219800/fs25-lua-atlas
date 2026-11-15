# placeables/specializations/PlaceableFence.lua

Source: `dataS/scripts/placeables/specializations/PlaceableFence.lua` — FS25 1.25.1.0

- **PlaceableFence** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableFence.prerequisitesPresent(specializations: table) → boolean` | 24 |  |
| `PlaceableFence.registerEvents(placeableType: any)` | 30 |  |
| `PlaceableFence.registerFunctions(placeableType: any)` | 36 |  |
| `PlaceableFence.registerOverwrittenFunctions(placeableType: any)` | 91 |  |
| `PlaceableFence.registerEventListeners(placeableType: any)` | 102 |  |
| `PlaceableFence.registerXMLPaths(schema: any, basePath: any)` | 112 |  |
| `PlaceableFence.registerSavegameXMLPaths(schema: any, basePath: any)` | 143 |  |
| `PlaceableFence:onLoad(savegame: table)` | 157 |  |
| `PlaceableFence:onDelete()` | 273 |  |
| `PlaceableFence:onReadStream(streamId: any, connection: any)` | 316 |  |
| `PlaceableFence:onWriteStream(streamId: any, connection: any)` | 360 |  |
| `PlaceableFence:onUpdate(dt: any)` | 393 |  |
| `PlaceableFence:setOwnerFarmId(superFunc: any, ownerFarmId: any, noEventSend: any)` | 399 |  |
| `PlaceableFence:loadFromXMLFile(xmlFile: any, key: any)` | 413 |  |
| `PlaceableFence:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 457 |  |
| `PlaceableFence:getPoleNear(x: any, y: any, z: any, maxDistance: any) → x, z, distance` | 559 |  |
| `PlaceableFence:getPoleNearOverlapCallback(hitObjectId: any)` | 578 |  |
| `PlaceableFence:getPolePosition(node: any, allowPanel: any)` | 606 |  |
| `PlaceableFence:getPoleShapeForPreview()` | 640 |  |
| `PlaceableFence:getMaxVerticalAngleAndYForPreview()` | 664 |  |
| `PlaceableFence:getMaxVerticalAngleAndYForSegment(segment: table) → number, number, number` | 679 |  |
| `PlaceableFence:getSegmentLength(segment: any)` | 711 |  |
| `PlaceableFence:getPanelLength()` | 717 |  |
| `PlaceableFence:getIsPanelLengthFixed()` | 723 |  |
| `PlaceableFence:canBeSold(superFunc: function) → boolean, string?` | 733 |  |
| `PlaceableFence:getIsBuildLocked() → boolean` | 746 |  |
| `PlaceableFence:setBuildLocked(isLocked: boolean)` | 756 |  |
| `PlaceableFence:createSegment(x1: any, z1: any, x2: any, z2: any, renderFirst: any, gateIndex: any)` | 769 |  |
| `PlaceableFence:addSegment(segment: any, sync: any)` | 784 |  |
| `PlaceableFence:deleteSegment(segment: any)` | 793 |  |
| `PlaceableFence:updateDirtyAreas(x1: any, z1: any, x2: any, z2: any)` | 830 |  |
| `PlaceableFence:setPreviewSegment(segment: any)` | 842 |  |
| `PlaceableFence:getPreviewSegment()` | 860 |  |
| `PlaceableFence:getGate(index: any)` | 867 |  |
| `PlaceableFence:getSegment(index: any)` | 874 |  |
| `PlaceableFence:getNumSequments()` | 881 |  |
| `PlaceableFence:getMaxVerticalAngle()` | 888 |  |
| `PlaceableFence:getMaxVerticalGateAngle()` | 895 |  |
| `PlaceableFence:getBoundingCheckWidth()` | 902 |  |
| `PlaceableFence:getSnapDistance()` | 908 |  |
| `PlaceableFence:getSnapCheckDistance()` | 918 |  |
| `PlaceableFence:getAllowExtendingOnly()` | 924 |  |
| `PlaceableFence:getMaxCornerAngle()` | 930 |  |
| `PlaceableFence:getHasParallelSnapping()` | 936 |  |
| `PlaceableFence:getSupportsParallelSnapping()` | 942 |  |
| `PlaceableFence:deletePanel(node: any)` | 948 |  |
| `PlaceableFence:doDeletePanel(segment: any, segmentIndex: any, poleIndex: any)` | 984 |  |
| `PlaceableFence:findRaycastInfo(node: any)` | 1103 |  |
| `PlaceableFence:getNodesToDeleteForPanel(node: any)` | 1181 |  |
| `PlaceableFence:isPoleInAnySegment(x: any, z: any, ignoreSegment: any)` | 1228 |  |
| `PlaceableFence:fakeRandomValueForPosition(x: any, y: any, z: any, n: any)` | 1247 |  |
| `PlaceableFence:generateSegmentPoles(segment: any, sync: any)` | 1262 |  |
| `PlaceableFence:calculateSegmentPoles(segment: table) → boolean` | 1287 |  |
| `PlaceableFence:updateSegmentShapes(segment: any)` | 1335 |  |
| `PlaceableFence:addSegmentShapesToUpdate(segment: any)` | 1557 |  |
| `PlaceableFence:updateSegmentUpdateQueue()` | 1566 |  |
| `PlaceableFence:addPickingNodesForSegment(segment: any)` | 1582 |  |
| `PlaceableFence:removePickingNodesForSegment(segment: any)` | 1602 |  |
| `PlaceableFence:recursivelyAddPickingNodes(objects: any, node: any)` | 1619 |  |
| `PlaceableFence:getDestructionMethod(superFunc: any)` | 1632 |  |
| `PlaceableFence:previewNodeDestructionNodes(superFunc: any, node: any)` | 1638 |  |
| `PlaceableFence:performNodeDestruction(superFunc: any, node: any)` | 1644 |  |
| `PlaceableFence:collectPickObjects(superFunc: any, node: any)` | 1652 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onCreateSegmentPanel` | 31 |
| registerFunction | `addSegment` | 37 |
| registerFunction | `addSegmentShapesToUpdate` | 38 |
| registerFunction | `calculateSegmentPoles` | 39 |
| registerFunction | `createSegment` | 40 |
| registerFunction | `deletePanel` | 41 |
| registerFunction | `deleteSegment` | 42 |
| registerFunction | `detachSourceNodes` | 43 |
| registerFunction | `doDeletePanel` | 44 |
| registerFunction | `fakeRandomValueForPosition` | 45 |
| registerFunction | `findRaycastInfo` | 46 |
| registerFunction | `generateSegmentPoles` | 47 |
| registerFunction | `getGate` | 48 |
| registerFunction | `getMaxVerticalAngle` | 49 |
| registerFunction | `getMaxVerticalAngleAndYForPreview` | 50 |
| registerFunction | `getMaxVerticalAngleAndYForSegment` | 51 |
| registerFunction | `getMaxVerticalGateAngle` | 52 |
| registerFunction | `getNodesToDeleteForPanel` | 53 |
| registerFunction | `getNumSequments` | 54 |
| registerFunction | `getPanelLength` | 55 |
| registerFunction | `getIsPanelLengthFixed` | 56 |
| registerFunction | `getIsBuildLocked` | 57 |
| registerFunction | `setBuildLocked` | 58 |
| registerFunction | `getPoleNear` | 59 |
| registerFunction | `getPoleNearOverlapCallback` | 60 |
| registerFunction | `getPolePosition` | 61 |
| registerFunction | `getPoleShapeForPreview` | 62 |
| registerFunction | `getPreviewSegment` | 63 |
| registerFunction | `getSegment` | 64 |
| registerFunction | `getSegmentLength` | 65 |
| registerFunction | `isPoleInAnySegment` | 66 |
| registerFunction | `recursivelyAddPickingNodes` | 67 |
| registerFunction | `addPickingNodesForSegment` | 68 |
| registerFunction | `removePickingNodesForSegment` | 69 |
| registerFunction | `setPreviewSegment` | 70 |
| registerFunction | `updatePanelVisuals` | 71 |
| registerFunction | `updateSegmentShapes` | 72 |
| registerFunction | `updateSegmentUpdateQueue` | 73 |
| registerFunction | `updateDirtyAreas` | 74 |
| registerFunction | `getSupportsParallelSnapping` | 75 |
| registerFunction | `getBoundingCheckWidth` | 77 |
| registerFunction | `getSnapDistance` | 78 |
| registerFunction | `getSnapAngle` | 79 |
| registerFunction | `getSnapCheckDistance` | 80 |
| registerFunction | `getAllowExtendingOnly` | 81 |
| registerFunction | `getMaxCornerAngle` | 82 |
| registerFunction | `getHasParallelSnapping` | 83 |
| registerFunction | `registerTerrainHeightChangeCallbacks` | 85 |
| registerFunction | `onTerrainDeformationSyncerUpdate` | 86 |
| registerOverwrittenFunction | `canBeSold` | 92 |
| registerOverwrittenFunction | `collectPickObjects` | 93 |
| registerOverwrittenFunction | `getDestructionMethod` | 94 |
| registerOverwrittenFunction | `performNodeDestruction` | 95 |
| registerOverwrittenFunction | `previewNodeDestructionNodes` | 96 |
| registerOverwrittenFunction | `setOwnerFarmId` | 97 |
| registerEventListener | `onLoad` | 103 |
| registerEventListener | `onDelete` | 104 |
| registerEventListener | `onReadStream` | 105 |
| registerEventListener | `onWriteStream` | 106 |
| registerEventListener | `onUpdate` | 107 |
