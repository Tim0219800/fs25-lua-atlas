# vehicles/specializations/YarderCarriage.lua

Source: `dataS/scripts/vehicles/specializations/YarderCarriage.lua` — FS25 1.25.1.0


## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `YarderCarriage.prerequisitesPresent(specializations: table) → boolean` | 28 |  |
| `YarderCarriage.initSpecialization()` | 34 |  |
| `YarderCarriage.registerFunctions(vehicleType: any)` | 100 |  |
| `YarderCarriage.registerOverwrittenFunctions(vehicleType: any)` | 130 |  |
| `YarderCarriage.registerEventListeners(vehicleType: any)` | 137 |  |
| `YarderCarriage:onLoad(savegame: any)` | 150 |  |
| `YarderCarriage:onLoadFinished(savegame: any)` | 303 |  |
| `YarderCarriage:onDelete()` | 312 |  |
| `YarderCarriage:onReadStream(streamId: integer, connection: Connection)` | 366 |  |
| `YarderCarriage:onWriteStream(streamId: integer, connection: Connection)` | 391 |  |
| `YarderCarriage:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 413 |  |
| `YarderCarriage:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 442 |  |
| `YarderCarriage:onPostUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 460 |  |
| `YarderCarriage:getCarriageDimensions()` | 541 |  |
| `YarderCarriage:getCarriagePullRopeTargetNode()` | 548 |  |
| `YarderCarriage:getCarriagePushRopeTargetNode()` | 554 |  |
| `YarderCarriage:setYarderTowerVehicle(vehicle: any)` | 560 |  |
| `YarderCarriage:updateRopeAlignmentNodes(ropeNode: any, tx: any, ty: any, tz: any, maxOffset: any)` | 566 |  |
| `YarderCarriage:updateCarriageInRange()` | 585 |  |
| `YarderCarriage:onYarderCarriageUpdateEnd()` | 619 |  |
| `YarderCarriage:updateTreeAttachRopes(dt: any)` | 628 |  |
| `YarderCarriage:onCarriageTreeRaycastCallback(hitObjectId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 681 |  |
| `YarderCarriage:onAttachTreeAction()` | 750 |  |
| `YarderCarriage:attachTreeToCarriage(splitShapeId: any, x: any, y: any, z: any, ropeIndex: any, noEventSend: any)` | 770 |  |
| `YarderCarriage:createJoint(shapeId: any, shapeJointId: any)` | 845 |  |
| `YarderCarriage:onDetachTreeAction()` | 872 |  |
| `YarderCarriage:detachTreeFromCarriage(ropeIndex: any, noEventSend: any)` | 878 |  |
| `YarderCarriage:getNumAttachedTrees()` | 924 |  |
| `YarderCarriage:getMaxNumAttachedTrees()` | 930 |  |
| `YarderCarriage:getAttachedTreeMass()` | 936 |  |
| `YarderCarriage:getIsCarriageTreeAttachAllowed(splitShapeId: any)` | 948 |  |
| `YarderCarriage:getIsTreeInMountRange()` | 971 |  |
| `YarderCarriage:showCarriageTreeMountFailedWarning(ropeIndex: any, reason: any)` | 990 |  |
| `YarderCarriage:setCarriageLiftInput(direction: any)` | 999 |  |
| `YarderCarriage.registerSavegameXMLPaths(schema: any, basePath: any)` | 1057 |  |
| `YarderCarriage:saveAttachedTreesToXML(xmlFile: any, key: any, usedModNames: any)` | 1066 |  |
| `YarderCarriage.loadAttachedTreesFromXML(xmlFile: any, key: any)` | 1086 |  |
| `YarderCarriage:resolveLoadedAttachedTrees(data: any)` | 1105 |  |
| `YarderCarriage:onYarderCarriageTreeShapeCut(oldShape: any, shape: any)` | 1125 |  |
| `YarderCarriage:onYarderCarriageTreeShapeMounted(shape: any, mountVehicle: any)` | 1139 |  |
| `YarderCarriage:getDirtMultiplier(superFunc: any) → number` | 1154 |  |
| `YarderCarriage:getWearMultiplier(superFunc: any) → number` | 1168 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getCarriageDimensions` | 101 |
| registerFunction | `getCarriagePullRopeTargetNode` | 102 |
| registerFunction | `getCarriagePushRopeTargetNode` | 103 |
| registerFunction | `setYarderTowerVehicle` | 104 |
| registerFunction | `updateRopeAlignmentNodes` | 105 |
| registerFunction | `updateCarriageInRange` | 106 |
| registerFunction | `onYarderCarriageUpdateEnd` | 107 |
| registerFunction | `updateTreeAttachRopes` | 108 |
| registerFunction | `onCarriageTreeRaycastCallback` | 109 |
| registerFunction | `onAttachTreeAction` | 110 |
| registerFunction | `attachTreeToCarriage` | 111 |
| registerFunction | `createJoint` | 112 |
| registerFunction | `onDetachTreeAction` | 113 |
| registerFunction | `detachTreeFromCarriage` | 114 |
| registerFunction | `getNumAttachedTrees` | 115 |
| registerFunction | `getMaxNumAttachedTrees` | 116 |
| registerFunction | `getAttachedTreeMass` | 117 |
| registerFunction | `getIsCarriageTreeAttachAllowed` | 118 |
| registerFunction | `getIsTreeInMountRange` | 119 |
| registerFunction | `showCarriageTreeMountFailedWarning` | 120 |
| registerFunction | `setCarriageLiftInput` | 121 |
| registerFunction | `saveAttachedTreesToXML` | 122 |
| registerFunction | `resolveLoadedAttachedTrees` | 123 |
| registerFunction | `onYarderCarriageTreeShapeCut` | 124 |
| registerFunction | `onYarderCarriageTreeShapeMounted` | 125 |
| registerOverwrittenFunction | `getDirtMultiplier` | 131 |
| registerOverwrittenFunction | `getWearMultiplier` | 132 |
| registerEventListener | `onLoad` | 138 |
| registerEventListener | `onLoadFinished` | 139 |
| registerEventListener | `onDelete` | 140 |
| registerEventListener | `onReadStream` | 141 |
| registerEventListener | `onWriteStream` | 142 |
| registerEventListener | `onReadUpdateStream` | 143 |
| registerEventListener | `onWriteUpdateStream` | 144 |
| registerEventListener | `onPostUpdate` | 145 |

## Messages

- subscribes `MessageType.TREE_SHAPE_CUT` (l.297)
- subscribes `MessageType.TREE_SHAPE_MOUNTED` (l.298)
- publishes `MessageType.TREE_SHAPE_MOUNTED` (l.836)
