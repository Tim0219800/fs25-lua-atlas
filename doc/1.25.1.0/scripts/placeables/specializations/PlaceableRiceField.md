# placeables/specializations/PlaceableRiceField.lua

Source: `dataS/scripts/placeables/specializations/PlaceableRiceField.lua` — FS25 1.25.1.0

- **PlaceableRiceField** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableRiceField.registerXMLPaths(schema: XMLSchema, basePath: string)` | 58 |  |
| `PlaceableRiceField.registerSavegameXMLPaths(schema: any, basePath: any)` | 96 |  |
| `PlaceableRiceField.prerequisitesPresent(specializations: table) → boolean` | 113 |  |
| `PlaceableRiceField.registerFunctions(placeableType: any)` | 119 |  |
| `PlaceableRiceField.registerOverwrittenFunctions(placeableType: any)` | 167 |  |
| `PlaceableRiceField.registerEventListeners(placeableType: any)` | 179 |  |
| `PlaceableRiceField.initSpecialization()` | 194 |  |
| `PlaceableRiceField:onLoad(savegame: table)` | 215 |  |
| `PlaceableRiceField:onPumpI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 302 |  |
| `PlaceableRiceField:onDelete()` | 329 |  |
| `PlaceableRiceField:onReadStream(streamId: any, connection: any)` | 366 |  |
| `PlaceableRiceField:onWriteStream(streamId: any, connection: any)` | 398 |  |
| `PlaceableRiceField:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 445 |  |
| `PlaceableRiceField:onUpdateTick(dt: any)` | 473 |  |
| `PlaceableRiceField:loadFromXMLFile(xmlFile: any, key: any)` | 552 |  |
| `PlaceableRiceField:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 604 |  |
| `PlaceableRiceField:getDestructionMethod(superFunc: any)` | 629 |  |
| `PlaceableRiceField:previewNodeDestructionNodes(superFunc: function, node: integer) → array?` | 642 |  |
| `PlaceableRiceField:performNodeDestruction(superFunc: any, node: any)` | 659 |  |
| `PlaceableRiceField:collectPickObjects(superFunc: any, node: any, target: any)` | 667 |  |
| `PlaceableRiceField:buildMesh(field: any)` | 1302 |  |
| `PlaceableRiceField:performTerrainDeformation(field: any, callback: any)` | 1467 |  |
| `PlaceableRiceField:getHasValidFields()` | 1667 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `onPumpI3DLoaded` | 120 |
| registerFunction | `drawDebug` | 121 |
| registerFunction | `getCanCreateNewField` | 122 |
| registerFunction | `createNewField` | 123 |
| registerFunction | `removeFieldByNode` | 124 |
| registerFunction | `removeFieldByIndex` | 125 |
| registerFunction | `deleteField` | 126 |
| registerFunction | `getFields` | 127 |
| registerFunction | `getFieldByIndex` | 128 |
| registerFunction | `getFieldByNode` | 129 |
| registerFunction | `getCanAddVertex` | 130 |
| registerFunction | `getCanFinish` | 131 |
| registerFunction | `onPolyhedronOverlap` | 132 |
| registerFunction | `onFinishedGrowthPeriod` | 133 |
| registerFunction | `getHasValidFields` | 134 |
| registerFunction | `addVertex` | 135 |
| registerFunction | `removeLastVertex` | 136 |
| registerFunction | `tryToFinishField` | 137 |
| registerFunction | `finalizeNewField` | 138 |
| registerFunction | `onRiceFieldAnswerEvent` | 139 |
| registerFunction | `buildMesh` | 140 |
| registerFunction | `performTerrainDeformation` | 141 |
| registerFunction | `onTerrainDeformationFinished` | 142 |
| registerFunction | `onTerrainDeformationFailed` | 143 |
| registerFunction | `onTerrainDeformationTaskFinished` | 144 |
| registerFunction | `getFirstAndLastVertex` | 145 |
| registerFunction | `getNumVertices` | 146 |
| registerFunction | `setWaterHeight` | 147 |
| registerFunction | `setEffectVisibility` | 148 |
| registerFunction | `getWaterHeight` | 149 |
| registerFunction | `setWaterHeightTarget` | 150 |
| registerFunction | `getWaterHeightTarget` | 151 |
| registerFunction | `getWaterFillLevel` | 152 |
| registerFunction | `getWaterFillLevelPerSqm` | 153 |
| registerFunction | `getFieldFillingState` | 154 |
| registerFunction | `getMaxWaterHeight` | 155 |
| registerFunction | `getArea` | 156 |
| registerFunction | `getSupportedFruitTypes` | 157 |
| registerFunction | `playerTriggerCallback` | 158 |
| registerFunction | `renderEdges` | 159 |
| registerFunction | `getRiceFieldState` | 160 |
| registerFunction | `onRiceFieldStatusResult` | 161 |
| registerFunction | `getConfirmDestruction` | 162 |
| registerOverwrittenFunction | `addToPhysics` | 168 |
| registerOverwrittenFunction | `collectPickObjects` | 169 |
| registerOverwrittenFunction | `getIsOnFarmland` | 170 |
| registerOverwrittenFunction | `getFarmlandId` | 171 |
| registerOverwrittenFunction | `getDestructionMethod` | 172 |
| registerOverwrittenFunction | `performNodeDestruction` | 173 |
| registerOverwrittenFunction | `previewNodeDestructionNodes` | 174 |
| registerEventListener | `onLoad` | 180 |
| registerEventListener | `onDelete` | 181 |
| registerEventListener | `onReadStream` | 182 |
| registerEventListener | `onWriteStream` | 183 |
| registerEventListener | `onReadUpdateStream` | 184 |
| registerEventListener | `onWriteUpdateStream` | 185 |
| registerEventListener | `onDirtyMaskCleared` | 186 |
| registerEventListener | `onUpdateTick` | 187 |
| registerEventListener | `onPeriodChanged` | 189 |

## Messages

- subscribes `MessageType.FINISHED_GROWTH_PERIOD` (l.295)
