# misc/TreePlantManager.lua

Source: `dataS/scripts/misc/TreePlantManager.lua` — FS25 1.25.1.0

- **TreePlantManager** inherits from `AbstractManager` (l.23)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `TreePlantManager.new(customMt: any)` | 33 |  |
| `TreePlantManager:initDataStructures()` | 41 |  |
| `TreePlantManager:initialize()` | 58 |  |
| `TreePlantManager:deleteTreesData()` | 74 |  |
| `TreePlantManager:loadDefaultTypes(missionInfo: any, baseDirectory: any)` | 84 |  |
| `TreePlantManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 93 |  |
| `TreePlantManager:unloadMapData()` | 119 |  |
| `TreePlantManager:loadTreeTypes(xmlFile: any, missionInfo: any, baseDirectory: any, isBaseType: any, customEnvironment: any)` | 146 |  |
| `TreePlantManager:registerTreeType(name: string, title: string, stages: array, growthTimeHours: number, isBaseType: boolean, splitTypeIndex: integer, supportsPlanting: boolean, saplingPrice: number) → table` | 272 |  |
| `TreePlantManager:getTreeTypeFilename(treeTypeDesc: any, growthStateI: any)` | 311 |  |
| `TreePlantManager:canPlantTree()` | 323 |  |
| `TreePlantManager:plantTree(treeTypeIndex: integer, x: number, y: number, z: number, rx: number, ry: number, rz: number, growthStateI: integer, variationIndex: integer, isGrowing: boolean?, nextGrowthTargetHour: number?, existingSplitShapeFileId: integer?) → integer?` | 344 |  |
| `TreePlantManager:loadTreeNode(treeTypeDesc: any, x: any, y: any, z: any, rx: any, ry: any, rz: any, growthStateI: any, variationIndex: any, splitShapeLoadingFileId: any)` | 397 |  |
| `TreePlantManager:loadTreeTrunk(treeTypeDesc: any, x: any, y: any, z: any, dirX: any, dirY: any, dirZ: any, length: any, growthStateI: any, variationIndex: any, delimb: any, useOnlyStump: any)` | 472 |  |
| `TreePlantManager.cutTreeTrunkCallback(loadTreeTrunkData: any, shape: any, isBelow: any, isAbove: any, minY: any, maxY: any, minZ: any, maxZ: any)` | 499 |  |
| `TreePlantManager:updateTrees(dt: any, dtGame: any)` | 512 |  |
| `TreePlantManager:addTreeCutJoint(jointIndex: any, shape: any, nx: any, ny: any, nz: any, maxAngle: any, maxLifetime: any)` | 776 |  |
| `TreePlantManager:getIsTreeDeleted(node: any)` | 785 |  |
| `TreePlantManager:getTreeRigidBodyType(node: any)` | 802 |  |
| `TreePlantManager:cleanupDeletedTrees()` | 820 |  |
| `TreePlantManager:loadFromXMLFile(xmlFilename: any)` | 866 |  |
| `TreePlantManager:saveToXMLFile(xmlFilename: any)` | 908 |  |
| `TreePlantManager:readFromServerStream(streamId: any)` | 959 |  |
| `TreePlantManager:writeToClientStream(streamId: any)` | 986 |  |
| `TreePlantManager:getTreeTypeDescFromIndex(index: any)` | 1022 |  |
| `TreePlantManager:getTreeTypeNameFromIndex(index: any)` | 1031 |  |
| `TreePlantManager:getTreeTypeDescFromName(name: any)` | 1042 |  |
| `TreePlantManager:getTreeTypeIndexAndVariationFromName(name: any, stageIndex: any, variationName: any)` | 1052 |  |
| `TreePlantManager:getTreeTypeNameAndVariationByIndex(treeTypeIndex: any, stageIndex: any, variationIndex: any)` | 1077 |  |
| `TreePlantManager:getPalletStoreItemFilenameByIndex(treeTypeIndex: any, stageIndex: any, variationIndex: any)` | 1096 |  |
| `TreePlantManager:getTreeTypeDescFromSplitType(splitTypeIndex: any)` | 1115 |  |
| `TreePlantManager:getTreeTypeIndexFromName(name: any)` | 1125 |  |
| `TreePlantManager:addClientTree(serverSplitShapeFileId: any, nodeId: any)` | 1138 |  |
| `TreePlantManager:removeClientTree(serverSplitShapeFileId: any)` | 1146 |  |
| `TreePlantManager:getClientTree(serverSplitShapeFileId: any)` | 1154 |  |
| `TreePlantManager:addingSplitShape(shape: any, oldShape: any, fromTree: any)` | 1168 |  |
| `TreePlantManager:removingSplitShape(shape: any)` | 1200 |  |
| `TreePlantManager:setSplitShapeLeafScaleAndVariation(shape: any, scale: any, variation: any)` | 1226 |  |
| `TreePlantManager:consoleCommandCutTrees(radius: string\|number) → string` | 1235 |  |
| `TreePlantManager:onTreeCutCommandOverlapCallback(objectId: any, ...: any)` | 1249 |  |
| `TreePlantManager:onTreeCutCommandSplitCallback(shape: any, isBelow: any, isAbove: any, minY: any, maxY: any, minZ: any, maxZ: any)` | 1257 |  |
| `TreePlantManager:consoleCommandPlantTrees(treeTypeName: any, number: any, growthStateI: any, variationIndex: any, isGrowing: any)` | 1313 |  |
| `TreePlantManager:consoleCommandLoadAll(treeTypeName: any, number: any, growthStateI: any, variationIndex: any, isGrowing: any)` | 1362 |  |

## Messages

- publishes `MessageType.TREE_SHAPE_CUT` (l.1194)
