# placeables/specializations/PlaceableNewFence.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableNewFence.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableNewFence.lua` — FS25 1.25.1.0

✍ Placeable specialization for the segment-based fence system: it wraps a Fence object (created from placeable.fence and the i3d at placeable.base.filename), forwards network, update and savegame handling to it, and merges into an already existing instance of the same fence config. Ownership always follows the farmland, picking is per segment, destruction is per node, and a counted build lock prevents selling a fence while a build run uses it. Several functions it registers (getFence, onSegmentCreated, getIsOnFarmland, getOwnerFarmId, deletePanel, getNodesToDeleteForPanel) are not defined in this file: UNVERIFIED where they come from.

- **PlaceableNewFence** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableNewFence.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Always returns true: no prerequisite specialization is required. |
| `PlaceableNewFence.registerEvents(placeableType: any)` | 23 | ✍ Registers the placeable event onCreateSegment. |
| `PlaceableNewFence.registerFunctions(placeableType: any)` | 29 | ✍ Registers fence-related functions on the placeable type (getFence, onSegmentCreated, panel and snap getters, updateDirtyAreas, build lock accessors). getFence and onSegmentCreated have no definition in this file. |
| `PlaceableNewFence.registerOverwrittenFunctions(placeableType: any)` | 49 | ✍ Overrides getIsOnFarmland, collectPickObjects, getDestructionMethod, performNodeDestruction, previewNodeDestructionNodes, setOwnerFarmId, getOwnerFarmId and canBeSold. getIsOnFarmland and getOwnerFarmId are not defined in this file. |
| `PlaceableNewFence.registerEventListeners(placeableType: any)` | 62 | ✍ Subscribes to onLoad, onDelete, onReadStream, onWriteStream, onUpdate and onFinalizePlacement (no onFinalizePlacement handler is defined in this file). |
| `PlaceableNewFence.registerXMLPaths(schema: any, basePath: any)` | 73 | ✍ Declares the XML keys by delegating to Fence.registerXMLPaths. |
| `PlaceableNewFence.registerSavegameXMLPaths(schema: any, basePath: any)` | 81 | ✍ Declares the savegame XML keys by delegating to Fence.registerSavegameXMLPaths. |
| `PlaceableNewFence:onLoad(savegame: table)` | 90 | ✍ Initialises the build lock count, requires placeable.base.filename (ERROR state otherwise), and returns early if another placeable with the same config exists (merge mode). Otherwise creates a segments transform group and the Fence object, and for preplaced fences deletes the map's pre-existing segment and static fence child nodes. |
| `PlaceableNewFence:onDelete()` | 148 | ✍ Deletes the Fence object if one was created. |
| `PlaceableNewFence:onReadStream(streamId: any, connection: any)` | 167 | ✍ Client side on join: lets the Fence read its stream data. Note: no nil check on the fence, which is nil when the placeable merged into an existing instance. |
| `PlaceableNewFence:onWriteStream(streamId: any, connection: any)` | 175 | ✍ Server side on join: lets the Fence write its stream data. Note: no nil check on the fence (see onReadStream). |
| `PlaceableNewFence:onUpdate(dt: any)` | 183 | ✍ Per-frame update: forwards dt to the Fence if it exists. |
| `PlaceableNewFence:setOwnerFarmId(superFunc: any, ownerFarmId: any, noEventSend: any)` | 196 | ✍ Override that intentionally does nothing: a fence never takes an owner farm directly, it follows the farmland. |
| `PlaceableNewFence:loadFromXMLFile(xmlFile: any, key: any)` | 206 | ✍ Savegame loading: loads into this fence, or into the existing instance's fence when this placeable was merged. |
| `PlaceableNewFence:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 221 | ✍ Savegame saving: delegates to the Fence object. |
| `PlaceableNewFence:getSegmentLength(segment: any)` | 238 | ✍ Returns the horizontal distance between a segment's two end points (x1/z1 to x2/z2). |
| `PlaceableNewFence:getPanelLength()` | 244 | ✍ Returns spec.panelLength. Note: this file never assigns that field, so it is probably nil unless set elsewhere (UNVERIFIED). |
| `PlaceableNewFence:getIsPanelLengthFixed()` | 250 | ✍ Returns spec.panelLengthFixed, a field not assigned in this file (UNVERIFIED). |
| `PlaceableNewFence:updateDirtyAreas(x1: any, z1: any, x2: any, z2: any)` | 256 | ✍ Marks the bounding box of the given line segment as dirty in the density-map collision map and in the AI navigation system. |
| `PlaceableNewFence:getNumSequments()` | 268 | ✍ Returns the number of fence segments from the Fence object (the name is misspelled in the source). |
| `PlaceableNewFence:getMaxVerticalAngle()` | 275 | ✍ Returns spec.maxVerticalAngle, not assigned in this file (UNVERIFIED); not registered via registerFunctions here. |
| `PlaceableNewFence:getMaxVerticalGateAngle()` | 282 | ✍ Returns spec.maxVerticalGateAngle, not assigned in this file (UNVERIFIED); not registered via registerFunctions here. |
| `PlaceableNewFence:getSnapDistance() → number?` | 290 | ✍ Returns the snap distance in meters from the first segment, or from the first segment template (parallel snapping value first, else its snapDistance); nil if there is no fence or template. |
| `PlaceableNewFence:getSnapAngle()` | 318 | ✍ Deprecated stub: always returns nil. |
| `PlaceableNewFence:getSnapCheckDistance()` | 325 | ✍ Deprecated stub: always returns nil. |
| `PlaceableNewFence:getAllowExtendingOnly()` | 332 | ✍ Deprecated stub: always returns nil. |
| `PlaceableNewFence:getMaxCornerAngle()` | 339 | ✍ Deprecated stub: always returns nil. |
| `PlaceableNewFence:getHasParallelSnapping()` | 346 | ✍ Deprecated stub: always returns false. |
| `PlaceableNewFence:getSupportsParallelSnapping()` | 353 | ✍ Deprecated stub: always returns false. |
| `PlaceableNewFence:addPickingNodesForSegment(segment: any)` | 359 | ✍ Registers the segment's rigid-body nodes as node objects of this placeable so they can be picked; ignores the preview segment and resets overlayColorNodes. |
| `PlaceableNewFence:removePickingNodesForSegment(segment: any)` | 379 | ✍ Removes the segment's rigid-body nodes from the mission's node objects; ignores the preview segment. |
| `PlaceableNewFence:recursivelyAddPickingNodes(objects: any, node: any)` | 396 | ✍ Recursively collects into the given table every node under (and including) the given node whose rigid body type is not NONE. |
| `PlaceableNewFence:getDestructionMethod(superFunc: any)` | 409 | ✍ Override: returns Placeable.DESTRUCTION.PER_NODE, so a fence is demolished piece by piece rather than at once. |
| `PlaceableNewFence:previewNodeDestructionNodes(superFunc: any, node: any)` | 415 | ✍ Override: returns the nodes of the panel containing the given node via getNodesToDeleteForPanel (defined elsewhere, UNVERIFIED). |
| `PlaceableNewFence:performNodeDestruction(superFunc: any, node: any)` | 421 | ✍ Override: deletes the panel of the given node via deletePanel (defined elsewhere, UNVERIFIED) and returns the destroyed node plus true when no segments remain, so the placeable is removed. |
| `PlaceableNewFence:collectPickObjects(superFunc: any, node: any)` | 429 | ✍ Override that does nothing: default picking is disabled because picking nodes are added per segment. |
| `PlaceableNewFence:canBeSold(superFunc: function) → boolean, string?` | 439 | ✍ Override: returns false with an 'object in use' message while a build lock is held, otherwise defers to the parent. |
| `PlaceableNewFence:getIsBuildLocked() → boolean` | 450 | ✍ Returns true while at least one build run holds a lock on this fence. |
| `PlaceableNewFence:setBuildLocked(isLocked: boolean)` | 460 | ✍ Takes (true) or releases (false) one build lock; the count never goes below zero, so overlapping runs do not unlock each other. |

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
