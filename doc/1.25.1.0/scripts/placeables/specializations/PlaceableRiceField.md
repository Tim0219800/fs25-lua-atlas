# placeables/specializations/PlaceableRiceField.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableRiceField.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableRiceField.lua` — FS25 1.25.1.0

✍ Placeable specialization for player-drawn rice paddies. Each field is a polygon with a flat terrain area, a raised ridge around it, a water plane (visual, mirror and collision meshes), a pump with sounds and a player trigger. The server animates the water level over game time and syncs it; the terrain is deformed through g_terrainDeformationQueue. It also uses PlaceableRiceFieldActivatable and the shallow water simulation if present. Many functions are registered but have no body in the dump (field creation, vertices, water getters, events), so they are UNVERIFIED.

- **PlaceableRiceField** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableRiceField.registerXMLPaths(schema: XMLSchema, basePath: string)` | 58 | ✍ Declares the XML schema under placeable.riceField: inner area and ridge ground types and sizes, ridge foliage, water max level and fill duration, underwater fog shader values, pump i3d with filling/emptying nodes and sounds, player trigger node, and the supported fruit types. |
| `PlaceableRiceField.registerSavegameXMLPaths(schema: any, basePath: any)` | 96 | ✍ Declares the savegame XML for each saved field: world height, water height and target, initial fruit data for preplaced fields, outline vertices and per-period water levels. |
| `PlaceableRiceField.prerequisitesPresent(specializations: table) → boolean` | 113 | ✍ Always returns true; no prerequisite specialization. |
| `PlaceableRiceField.registerFunctions(placeableType: any)` | 119 | ✍ Registers the rice field API on the placeable type (field create/remove/get, vertices, water height and fill level getters/setters, terrain deformation callbacks, rice field state events). Most of these functions are not defined in the dump. |
| `PlaceableRiceField.registerOverwrittenFunctions(placeableType: any)` | 167 | ✍ Overrides addToPhysics, collectPickObjects, getIsOnFarmland, getFarmlandId, getDestructionMethod, performNodeDestruction and previewNodeDestructionNodes. |
| `PlaceableRiceField.registerEventListeners(placeableType: any)` | 179 | ✍ Subscribes to onLoad, onDelete, the stream read/write events (initial and update), onDirtyMaskCleared, onUpdateTick and onPeriodChanged. |
| `PlaceableRiceField.initSpecialization()` | 194 | ✍ Only when g_isDevelopmentVersion is set, registers four console commands (gsRiceFieldWaterSetLevel, gsRiceFieldWaterSetShaderParameters, gsRiceFieldSetRice, gsRiceFieldCreateFromField). |
| `PlaceableRiceField:onLoad(savegame: table)` | 215 | ✍ Reads ground types, ridge and water settings, fog values, trigger node and fruit types from XML, starts the async load of the pump i3d, loads pump sounds on the client, creates the activatable and subscribes to FINISHED_GROWTH_PERIOD. Note: the ridge foliage growth state fallback reads the foliageGrowthStateName key instead of foliageGrowthState. |
| `PlaceableRiceField:onPumpI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 302 | ✍ Async callback for the shared pump i3d: stores the node as a template cloned per field, remembers the node paths for filling/emptying water and splash, then finishes the loading task. Returns false if the i3d failed. |
| `PlaceableRiceField:onDelete()` | 329 | ✍ Removes the activatable, unsubscribes from messages, deletes all fields, the pump template, sounds and the shared i3d request. |
| `PlaceableRiceField:onReadStream(streamId: any, connection: any)` | 366 | ✍ Client initial sync: reads each field (height, polygon vertices, water height, optional target), creates it, builds its meshes and sets the pump effects as filling or emptying. |
| `PlaceableRiceField:onWriteStream(streamId: any, connection: any)` | 398 | ✍ Server initial sync: writes the number of fields, then for each its height, polygon vertices, water height and optional water target. |
| `PlaceableRiceField:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 445 | ✍ Server only: when the water dirty flag is set, writes the water height (compressed up to the max level) and a flag telling if the target was reached, only for fields marked dirty. |
| `PlaceableRiceField:onUpdateTick(dt: any)` | 473 | ✍ Adds random waves to the shallow water simulation near filling splashes. On the server, moves each field's water height toward its target at a rate scaled by effective time scale and the fill duration, ends effects and flags a sync when the target is reached. |
| `PlaceableRiceField:loadFromXMLFile(xmlFile: any, key: any)` | 552 | ✍ Loads each saved field: height, water height, polygon, per-period water levels and optional water target. On a new savegame, the server also applies the initial terrain deformation and initial fruit. Note: the local callback passed to performTerrainDeformation is never defined, so it is nil. |
| `PlaceableRiceField:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 604 | ✍ Saves each field: world height, water height, optional target, per-period water levels per square meter and polygon vertices as x z strings. |
| `PlaceableRiceField:getDestructionMethod(superFunc: any)` | 629 | ✍ Returns Placeable.DESTRUCTION.PER_NODE, so the player removes one field at a time instead of the whole placeable. |
| `PlaceableRiceField:previewNodeDestructionNodes(superFunc: function, node: integer) → array?` | 642 | ✍ For the field under the targeted node, draws the outline of its water mesh and of the visible shapes of its pump. Returns nil (no extra nodes for the brush to highlight). |
| `PlaceableRiceField:performNodeDestruction(superFunc: any, node: any)` | 659 | ✍ Removes the field matching the node; returns whether a field was removed and whether the whole placeable should be destroyed (no valid field left). |
| `PlaceableRiceField:collectPickObjects(superFunc: any, node: any, target: any)` | 667 | ✍ Empty override: disables the default pick object collection for this placeable. |
| `PlaceableRiceField:buildMesh(field: any)` | 1302 | ✍ Builds a field's nodes from its polygon: visual water plane with the riceFieldWaterSimulation material, a mirror plane, water and placement collision planes, a cloned pump and a player trigger at the first edge. Registers the field, sets the water height and adds the water plane to the shallow water simulation. Returns false if a mesh cannot be created. Note: shader parameters of the mirror plane are set on the main plane node. |
| `PlaceableRiceField:performTerrainDeformation(field: any, callback: any)` | 1467 | ✍ Queues three terrain jobs for a field: flattening the polygon with the inner ground type, raising ridges along each edge, and painting the ridge ground type if it exists. Each job calls onTerrainDeformationTaskFinished; the callback is stored in field.brushCallback. |
| `PlaceableRiceField:getHasValidFields()` | 1667 | ✍ Returns true if at least one field polygon has three or more vertices. |

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
