# placeables/specializations/PlaceableNewFence.lua

Source: `dataS/scripts/placeables/specializations/PlaceableNewFence.lua` — FS25 1.25.1.0

- **PlaceableNewFence** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableNewFence.prerequisitesPresent(specializations: table) → boolean` | 17 |  |
| `PlaceableNewFence.registerEvents(placeableType: any)` | 23 |  |
| `PlaceableNewFence.registerFunctions(placeableType: any)` | 29 |  |
| `PlaceableNewFence.registerOverwrittenFunctions(placeableType: any)` | 49 |  |
| `PlaceableNewFence.registerEventListeners(placeableType: any)` | 62 |  |
| `PlaceableNewFence.registerXMLPaths(schema: any, basePath: any)` | 73 |  |
| `PlaceableNewFence.registerSavegameXMLPaths(schema: any, basePath: any)` | 81 |  |
| `PlaceableNewFence:onLoad(savegame: table)` | 90 |  |
| `PlaceableNewFence:onDelete()` | 148 |  |
| `PlaceableNewFence:onReadStream(streamId: any, connection: any)` | 167 |  |
| `PlaceableNewFence:onWriteStream(streamId: any, connection: any)` | 175 |  |
| `PlaceableNewFence:onUpdate(dt: any)` | 183 |  |
| `PlaceableNewFence:setOwnerFarmId(superFunc: any, ownerFarmId: any, noEventSend: any)` | 196 |  |
| `PlaceableNewFence:loadFromXMLFile(xmlFile: any, key: any)` | 206 |  |
| `PlaceableNewFence:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 221 |  |
| `PlaceableNewFence:getSegmentLength(segment: any)` | 238 |  |
| `PlaceableNewFence:getPanelLength()` | 244 |  |
| `PlaceableNewFence:getIsPanelLengthFixed()` | 250 |  |
| `PlaceableNewFence:updateDirtyAreas(x1: any, z1: any, x2: any, z2: any)` | 256 |  |
| `PlaceableNewFence:getNumSequments()` | 268 |  |
| `PlaceableNewFence:getMaxVerticalAngle()` | 275 |  |
| `PlaceableNewFence:getMaxVerticalGateAngle()` | 282 |  |
| `PlaceableNewFence:getSnapDistance() → number?` | 290 |  |
| `PlaceableNewFence:getSnapAngle()` | 318 |  |
| `PlaceableNewFence:getSnapCheckDistance()` | 325 |  |
| `PlaceableNewFence:getAllowExtendingOnly()` | 332 |  |
| `PlaceableNewFence:getMaxCornerAngle()` | 339 |  |
| `PlaceableNewFence:getHasParallelSnapping()` | 346 |  |
| `PlaceableNewFence:getSupportsParallelSnapping()` | 353 |  |
| `PlaceableNewFence:addPickingNodesForSegment(segment: any)` | 359 |  |
| `PlaceableNewFence:removePickingNodesForSegment(segment: any)` | 379 |  |
| `PlaceableNewFence:recursivelyAddPickingNodes(objects: any, node: any)` | 396 |  |
| `PlaceableNewFence:getDestructionMethod(superFunc: any)` | 409 |  |
| `PlaceableNewFence:previewNodeDestructionNodes(superFunc: any, node: any)` | 415 |  |
| `PlaceableNewFence:performNodeDestruction(superFunc: any, node: any)` | 421 |  |
| `PlaceableNewFence:collectPickObjects(superFunc: any, node: any)` | 429 |  |
| `PlaceableNewFence:canBeSold(superFunc: function) → boolean, string?` | 439 |  |
| `PlaceableNewFence:getIsBuildLocked() → boolean` | 450 |  |
| `PlaceableNewFence:setBuildLocked(isLocked: boolean)` | 460 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onCreateSegment` | 24 |
| registerFunction | `getFence` | 30 |
| registerFunction | `onSegmentCreated` | 31 |
| registerFunction | `getNumSequments` | 32 |
| registerFunction | `getPanelLength` | 33 |
| registerFunction | `getIsPanelLengthFixed` | 34 |
| registerFunction | `updateDirtyAreas` | 35 |
| registerFunction | `getSupportsParallelSnapping` | 36 |
| registerFunction | `getSnapDistance` | 37 |
| registerFunction | `getSnapAngle` | 38 |
| registerFunction | `getSnapCheckDistance` | 39 |
| registerFunction | `getAllowExtendingOnly` | 40 |
| registerFunction | `getMaxCornerAngle` | 41 |
| registerFunction | `getHasParallelSnapping` | 42 |
| registerFunction | `getIsBuildLocked` | 43 |
| registerFunction | `setBuildLocked` | 44 |
| registerOverwrittenFunction | `getIsOnFarmland` | 50 |
| registerOverwrittenFunction | `collectPickObjects` | 51 |
| registerOverwrittenFunction | `getDestructionMethod` | 52 |
| registerOverwrittenFunction | `performNodeDestruction` | 53 |
| registerOverwrittenFunction | `previewNodeDestructionNodes` | 54 |
| registerOverwrittenFunction | `setOwnerFarmId` | 55 |
| registerOverwrittenFunction | `getOwnerFarmId` | 56 |
| registerOverwrittenFunction | `canBeSold` | 57 |
| registerEventListener | `onLoad` | 63 |
| registerEventListener | `onDelete` | 64 |
| registerEventListener | `onReadStream` | 65 |
| registerEventListener | `onWriteStream` | 66 |
| registerEventListener | `onUpdate` | 67 |
| registerEventListener | `onFinalizePlacement` | 68 |
