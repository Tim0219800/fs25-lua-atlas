# placeables/specializations/PlaceableFence.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableFence.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableFence.lua` — FS25 1.25.1.0

✍ Placeable specialization for player-built fences made of segments (start and end x, z) that are filled with pole and panel clones following the terrain height, with optional gates driven by AnimatedObject. It handles snapping rules, a preview segment, panel-by-panel deletion, an asynchronous one-segment-per-frame rebuild queue, a build lock, and savegame and network sync of segments. Several terrain-change hooks (registerTerrainHeightChangeCallbacks, onTerrainDeformationSyncerUpdate) have no body in the SDK dump: UNVERIFIED.

- **PlaceableFence** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableFence.prerequisitesPresent(specializations: table) → boolean` | 24 | ✍ No prerequisite: always returns true. |
| `PlaceableFence.registerEvents(placeableType: any)` | 30 | ✍ Declares the onCreateSegmentPanel event, raised each time a panel is built between two poles (preview or final). |
| `PlaceableFence.registerFunctions(placeableType: any)` | 36 | ✍ Registers all fence methods on the placeable type: segments, poles, panels, gates, preview, picking nodes, snapping and build-lock getters, and terrain-change callbacks. detachSourceNodes, updatePanelVisuals, getSnapAngle, registerTerrainHeightChangeCallbacks and onTerrainDeformationSyncerUpdate have no body in the SDK dump (UNVERIFIED). |
| `PlaceableFence.registerOverwrittenFunctions(placeableType: any)` | 91 | ✍ Overrides canBeSold, collectPickObjects, getDestructionMethod, performNodeDestruction, previewNodeDestructionNodes and setOwnerFarmId on the placeable type. |
| `PlaceableFence.registerEventListeners(placeableType: any)` | 102 | ✍ Subscribes to load, delete, stream read/write and update events. |
| `PlaceableFence.registerXMLPaths(schema: any, basePath: any)` | 112 | ✍ Declares the fence XML: pole and panel variant groups, panel length and fixed flag, vertical angle limits, bounding width, snap distance/angle/check distance, extending-only, max corner angle, parallel snapping, invisible poles, plus gate entries (node, length, trigger, texts, duration, doors) and the animated-object paths. |
| `PlaceableFence.registerSavegameXMLPaths(schema: any, basePath: any)` | 143 | ✍ Declares the savegame data: for each segment start and end positions, first/last pole visibility, gate index and the animated object state. |
| `PlaceableFence:onLoad(savegame: table)` | 157 | ✍ Reads fence settings with defaults (max vertical angle 35 degrees, gate angle 5, bounding width 0.25), collects the pole and panel variants from the children of their group nodes and loads the gate definitions. Ends with detachSourceNodes (no body in the dump, UNVERIFIED). |
| `PlaceableFence:onDelete()` | 273 | ✍ Cleans up: deletes pending update timers, unregisters from the terrain deformation syncer cells, deletes the gate animated objects and the detached source nodes if they still exist. |
| `PlaceableFence:onReadStream(streamId: any, connection: any)` | 316 | ✍ Client join: reads every segment (start/end coordinates, gate index, first/last pole flags), rebuilds its poles synchronously, reads each gate's animated object and registers terrain height-change callbacks. |
| `PlaceableFence:onWriteStream(streamId: any, connection: any)` | 360 | ✍ Server side counterpart: writes the segment count and every segment's data, then each gate segment's animated object id and state, registering it in the stream. |
| `PlaceableFence:onUpdate(dt: any)` | 393 | ✍ Each update call processes the segment shape queue through updateSegmentUpdateQueue. |
| `PlaceableFence:setOwnerFarmId(superFunc: any, ownerFarmId: any, noEventSend: any)` | 399 | ✍ Calls the parent, then propagates the new owner farm id to every gate animated object. |
| `PlaceableFence:loadFromXMLFile(xmlFile: any, key: any)` | 413 | ✍ Rebuilds the fence from the savegame: reads each segment, skips and logs an error for invalid positions, regenerates its poles synchronously and restores gate animated-object state. |
| `PlaceableFence:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 457 | ✍ Writes all segments (start, end, gate index and animated object for gates). The first/last pole flags are only written when false, since true is the default. |
| `PlaceableFence:getPoleNear(x: any, y: any, z: any, maxDistance: any) → x, z, distance` | 559 | ✍ Searches for a fence pole within maxDistance of a point using a sphere overlap on static objects. Returns the pole's world x, y, z, its node and its segment, or nil. Gates are ignored. |
| `PlaceableFence:getPoleNearOverlapCallback(hitObjectId: any)` | 578 | ✍ Overlap callback for getPoleNear: keeps the closest hit whose group belongs to one of this fence's segments and that has fewer than three children (to skip gates). Returns true to continue the overlap query. |
| `PlaceableFence:getPolePosition(node: any, allowPanel: any)` | 606 | ✍ Given a collision node, tells whether it belongs to a pole of this fence (or, with allowPanel, to one of its panels) and returns that pole's world x, y, z plus the segment, otherwise nil. |
| `PlaceableFence:getPoleShapeForPreview()` | 640 | ✍ Returns a clone of the first pole variant for placement preview, or nil if poles are invisible, absent or empty. The caller must delete the returned clone. |
| `PlaceableFence:getMaxVerticalAngleAndYForPreview()` | 664 | ✍ Runs getMaxVerticalAngleAndYForSegment on the current preview segment and returns its max angle, min height and max height. |
| `PlaceableFence:getMaxVerticalAngleAndYForSegment(segment: table) → number, number, number` | 679 | ✍ Computes, from terrain heights at consecutive poles, the steepest slope angle in radians and the lowest and highest terrain height. Needs the segment's poles to be calculated but no shapes. Initial min/max are 1000 and -1000. |
| `PlaceableFence:getSegmentLength(segment: any)` | 711 | ✍ Returns the horizontal distance between a segment's start and end points. |
| `PlaceableFence:getPanelLength()` | 717 | ✍ Returns the configured panel length. |
| `PlaceableFence:getIsPanelLengthFixed()` | 723 | ✍ Returns whether the panel length is fixed in the XML. |
| `PlaceableFence:canBeSold(superFunc: function) → boolean, string?` | 733 | ✍ Refuses the sale with the object-in-use message while a build lock is held, otherwise defers to the parent implementation and returns its result. |
| `PlaceableFence:getIsBuildLocked() → boolean` | 746 | ✍ Returns true while the build-lock counter is above zero. |
| `PlaceableFence:setBuildLocked(isLocked: boolean)` | 756 | ✍ Increments the lock counter when true, decrements it (never below 0) when false, so overlapping build runs do not unlock each other. |
| `PlaceableFence:createSegment(x1: any, z1: any, x2: any, z2: any, renderFirst: any, gateIndex: any)` | 769 | ✍ Returns a new segment table from start and end coordinates, the render-first flag and an optional gate index. The last pole is always rendered; nothing is registered yet (see addSegment). |
| `PlaceableFence:addSegment(segment: any, sync: any)` | 784 | ✍ Appends the segment to the fence and generates its poles; the sync flag chooses immediate or queued shape building. |
| `PlaceableFence:deleteSegment(segment: any)` | 793 | ✍ Removes a segment: deletes its gate animated object, node group and pending timer, drops its terrain-change listeners, removes it from the list and flags the covered area dirty. |
| `PlaceableFence:updateDirtyAreas(x1: any, z1: any, x2: any, z2: any)` | 830 | ✍ Marks the bounding box of the line as dirty in the density-map height collision map and in the AI navigation system. |
| `PlaceableFence:setPreviewSegment(segment: any)` | 842 | ✍ Replaces the preview segment: deletes the previous preview's node group and generates poles for the new one without synchronous shape building (queued). |
| `PlaceableFence:getPreviewSegment()` | 860 | ✍ Returns the current preview segment, or nil. |
| `PlaceableFence:getGate(index: any)` | 867 | ✍ Returns the gate definition at the given 1-based index. |
| `PlaceableFence:getSegment(index: any)` | 874 | ✍ Returns the segment at the given 1-based index. |
| `PlaceableFence:getNumSequments()` | 881 | ✍ Returns the number of segments (the name contains a typo for 'segments'). |
| `PlaceableFence:getMaxVerticalAngle()` | 888 | ✍ Returns the maximum allowed terrain angle for normal segments. |
| `PlaceableFence:getMaxVerticalGateAngle()` | 895 | ✍ Returns the maximum allowed terrain angle for gate segments. |
| `PlaceableFence:getBoundingCheckWidth()` | 902 | ✍ Returns the width of the box used for collision checks when placing. |
| `PlaceableFence:getSnapDistance()` | 908 | ✍ Returns the snap distance from the XML, or nil if not set. |
| `PlaceableFence:getSnapCheckDistance()` | 918 | ✍ Returns the distance used to detect snap targets (default 0.25). |
| `PlaceableFence:getAllowExtendingOnly()` | 924 | ✍ Returns whether new segments may only extend existing ones instead of attaching mid-segment. |
| `PlaceableFence:getMaxCornerAngle()` | 930 | ✍ Returns the maximum allowed angle between two connected segments. |
| `PlaceableFence:getHasParallelSnapping()` | 936 | ✍ Always returns false in this specialization; overridable by other code. |
| `PlaceableFence:getSupportsParallelSnapping()` | 942 | ✍ Returns the XML flag saying whether parallel snapping is offered. |
| `PlaceableFence:deletePanel(node: any)` | 948 | ✍ Removes the panel hit by a node. On the server it applies doDeletePanel and broadcasts PlaceableFenceRemoveSegmentEvent; on a client it clears the node's collision mask and sends the event to the server. Returns true if a panel was found. |
| `PlaceableFence:doDeletePanel(segment: any, segmentIndex: any, poleIndex: any)` | 984 | ✍ Applies a panel removal on the segment: shortens it, moves its start, deletes it, or splits it in two. Re-renders poles that neighbours need, regenerates shapes and marks the old area dirty. Called on the server and by the removal event on clients. |
| `PlaceableFence:findRaycastInfo(node: any)` | 1103 | ✍ From a raycast collision node, walks the node hierarchy to find the panel, its visuals, the segment, the pole and the pole index (2*child+1 into the poles list). Handles gate cases; if the node is a pole only, returns nil for panel. Returns nil if no segment matches. |
| `PlaceableFence:getNodesToDeleteForPanel(node: any)` | 1181 | ✍ For a destruction preview, returns the visual nodes that removing the panel would delete: the panel or the gate doors, plus an end pole that would be left alone. Returns nil if no panel is found. |
| `PlaceableFence:isPoleInAnySegment(x: any, z: any, ignoreSegment: any)` | 1228 | ✍ Finds another segment whose start or end coincides with the given x, z (within PlaceableFence.EPSILON). Returns the segment and two flags: matches start, matches end; nil if none. The ignored segment is skipped. |
| `PlaceableFence:fakeRandomValueForPosition(x: any, y: any, z: any, n: any)` | 1247 | ✍ Deterministic pseudo-random value from x and z only: a fraction in [0,1), or with n an integer from 1 to n. Used so pole and panel variants stay identical on every client. |
| `PlaceableFence:generateSegmentPoles(segment: any, sync: any)` | 1262 | ✍ Recomputes the segment's poles, then rebuilds its shapes immediately (sync) or queues them, and updates picking nodes. Marks the area dirty unless it is the preview segment. Does nothing if the segment is too short. |
| `PlaceableFence:calculateSegmentPoles(segment: table) → boolean` | 1287 | ✍ Fills the segment's pole coordinate list (x, z pairs) without touching shapes: whole panel lengths first, then one or two evenly sized end panels; gates only get two poles. Returns false if the segment is shorter than 0.01. |
| `PlaceableFence:updateSegmentShapes(segment: any)` | 1335 | ✍ Rebuilds a segment's scene nodes: deletes the old group, clones poles and panels on the terrain height, rotates and sizes them, adds physics unless it is the preview, and raises onCreateSegmentPanel. For gates, builds the gate and a synced AnimatedObject (broadcast by the server). Note: the AnimatedObject save id uses x2 twice, where the comment suggests z2 was meant. |
| `PlaceableFence:addSegmentShapesToUpdate(segment: any)` | 1557 | ✍ Queues a segment for shape rebuilding and wakes the placeable's update loop. |
| `PlaceableFence:updateSegmentUpdateQueue()` | 1566 | ✍ Takes the first queued segment per call and rebuilds its shapes (picking nodes removed and re-added), then keeps the update loop active, so only one segment is rebuilt per frame. |
| `PlaceableFence:addPickingNodesForSegment(segment: any)` | 1582 | ✍ Registers every node of the segment group that has a rigid body with the mission's node-object table so it can be picked, and resets the overlay color cache. Skipped for the preview segment. |
| `PlaceableFence:removePickingNodesForSegment(segment: any)` | 1602 | ✍ Reverse of addPickingNodesForSegment: unregisters the segment's rigid-body nodes from the mission's node-object table. Skipped for the preview segment. |
| `PlaceableFence:recursivelyAddPickingNodes(objects: any, node: any)` | 1619 | ✍ Recursively appends to the given list every node under a node whose rigid body type is not NONE. |
| `PlaceableFence:getDestructionMethod(superFunc: any)` | 1632 | ✍ Returns Placeable.DESTRUCTION.PER_NODE, so the fence is destroyed piece by piece. |
| `PlaceableFence:previewNodeDestructionNodes(superFunc: any, node: any)` | 1638 | ✍ Returns the nodes to highlight for a node-destruction preview, delegating to getNodesToDeleteForPanel. |
| `PlaceableFence:performNodeDestruction(superFunc: any, node: any)` | 1644 | ✍ Deletes the panel for a node through deletePanel and returns whether something was deleted plus whether the whole placeable should be destroyed (no segments left). |
| `PlaceableFence:collectPickObjects(superFunc: any, node: any)` | 1652 | ✍ Empty override: the fence adds no default picking objects at placeable level, since segment nodes are registered separately. The parent implementation is not called. |

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
